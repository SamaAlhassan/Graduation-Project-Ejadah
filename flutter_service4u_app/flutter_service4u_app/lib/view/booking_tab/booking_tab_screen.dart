import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_hub_app/controller/controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> with SingleTickerProviderStateMixin {
  final AuthController authController = Get.find<AuthController>();

  // Variables to hold user data
  String userName = "";
  String userEmail = "";
  bool isLoading = true; // Loading state
  late TabController tabController; // Define the TabController

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this); // Initialize TabController
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      Map<String, dynamic>? userData = await authController.getUserData();

      if (userData != null) {
        setState(() {
          userName = userData['name'] ?? "N/A";
          userEmail = userData['email'] ?? "N/A";
          isLoading = false; // Mark loading as complete
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false; // Prevent infinite loading in case of error
      });
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);

    return GetBuilder<BookingScreenController>(
      init: BookingScreenController(),
      builder: (bookingScreenController) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVerSpace(24.h),
            getCustomFont("Bookings", 24.sp,
                    Get.isDarkMode ? regularWhite : regularBlack, 1,
                    fontWeight: FontWeight.w700)
                .paddingSymmetric(horizontal: 30.h),
            getVerSpace(16.87.h),
            Container(
              height: 72.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.h),
                color: context.theme.focusColor,
              ),
              child: TabBar(
                unselectedLabelColor: Color(0XFF6E758A),
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
                labelStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp),
                labelColor: buttonColor,
                unselectedLabelStyle: TextStyle(
                    color: Color(0XFF23408F),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: ShapeDecoration(
                    color: buttonColor.withOpacity(0.10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.h))),
                controller: tabController, // Set TabController here
                tabs: const [
                  Tab(text: "Upcoming"),
                  Tab(text: "History"),
                ],
                onTap: (index) {
                  // Ensure PageView switches with Tab
                  bookingScreenController.pageController.jumpToPage(index);
                },
              ),
            ).paddingSymmetric(horizontal: 16.h),
            getVerSpace(2.h),
            Expanded(
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: bookingScreenController.pageController,
                onPageChanged: (value) {
                  tabController.animateTo(value,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                children: [
                  _UpcomingPage(userName: userName),
                  _HistoryPage(userName: userName),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingScreenController extends GetxController {
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class _UpcomingPage extends StatelessWidget {
  final String userName;
  _UpcomingPage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('new_orders')
          .where('user_name', isEqualTo: userName)
          .where('status', whereIn: ['accepted', 'new'])
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return booking_empty_formate(
            "booking_upcoming_icon.svg",
            "No Upcoming Order",
            context.theme.primaryColor,
            "Currently you don’t have any upcoming order.",
            Color(0XFF535763),
            () {},
          );
        }

        final bookings = snapshot.data!.docs;
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            var booking = bookings[index];
            var data = booking.data() as Map<String, dynamic>;

            return data['status'] == "complete"
                ? SizedBox()
                : Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.h),
                        border: Border.all(color: grey20)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.build, size: 40, color: Colors.blue),
                            getHorSpace(16.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomFont(data['service_name'] ?? 'N/A',
                                    16.sp, context.theme.primaryColor, 1,
                                    fontWeight: FontWeight.w600),
                                getVerSpace(6.h),
                                getCustomFont(
                                    "Order Number: ${data['order_number'] ?? 'N/A'}",
                                    14.sp,
                                    grey40,
                                    1,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                            getVerSpace(10.h),
                          ],
                        ),
                        getVerSpace(12.h),
                        Divider(color: greyButton),
                        Container(
                          child: Column(
                            children: [
                              getVerSpace(2.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  getCustomFont(
                                      "Status", 14.sp, greyTextColor, 1,
                                      fontWeight: FontWeight.w500),
                                  if (data['status'] == 'accepted') ...[
                                    confirm_pending_button(
                                        data['status'],
                                        confermButtonBgColor,
                                        confermButtonTextColor)
                                  ],
                                  if (data['status'] == 'new') ...[
                                    confirm_pending_button(
                                        data['status'],
                                        pendingButtonBgColor,
                                        pendingButtonTextColor)
                                  ],
                                ],
                              ),
                              getVerSpace(10.h),
                              Row(
                                children: [
                                  Container(
                                    height: 40.h,
                                    width: 40.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color(0XFFC4C4C4)
                                                .withOpacity(0.30))),
                                    child: getSvgImage("date_icon.svg",
                                            color: greyTextColor)
                                        .paddingAll(9.h),
                                  ),
                                  getHorSpace(10.h),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      getCustomFont(
                                          "${data['time'] ?? 'No Time'}, ${data['date'] ?? 'No Date'}",
                                          14.sp,
                                          context.theme.primaryColor,
                                          1,
                                          fontWeight: FontWeight.w600),
                                      getVerSpace(6.h),
                                      getCustomFont("Schedule", 12.sp,
                                          greyTextColor, 1,
                                          fontWeight: FontWeight.w500),
                                    ],
                                  )
                                ],
                              ),
                              getVerSpace(10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // User Information
                                  Row(
                                    children: [
                                      Container(
                                        height: 40.h,
                                        width: 40.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0XFFC4C4C4)
                                                .withOpacity(0.30),
                                          ),
                                        ),
                                        child: getSvgImage("profile_icon.svg")
                                            .paddingSymmetric(
                                                horizontal: 9.43.h,
                                                vertical: 7.22.h),
                                      ),
                                      getHorSpace(10.h),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          getCustomFont(
                                            data['provider_name'] ?? 'provider_name',
                                            14.sp,
                                            context.theme.primaryColor,
                                            1,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          getVerSpace(6.h),
                                          getCustomFont(
                                            "Provider Name",
                                            12.sp,
                                            greyTextColor,
                                            1,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  // Call Button with phone number functionality
                                  GestureDetector(
                                    onTap: () async {
                                      String phoneNumber = data['phone_number'] ?? '';
                                      if (phoneNumber.isNotEmpty) {
                                        final url = 'tel:$phoneNumber';
                                        if (await canLaunch(url)) {
                                          await launch(url); // Opens dialer with the phone number
                                        } else {
                                          print('Could not launch $url');
                                        }
                                      } else {
                                        print('Phone number is empty');
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.h),
                                        color: buttonColor,
                                      ),
                                      child: Row(
                                        children: [
                                          getSvgImage("call_icon_border.svg"),
                                          getHorSpace(8.h),
                                          getCustomFont(
                                            "Call",
                                            14.sp,
                                            Color(0XFFFCFCFC),
                                            1,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ).paddingSymmetric(
                                          horizontal: 11.5.h, vertical: 8.h),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ).paddingAll(16.h),
                  ).paddingSymmetric(vertical: 10.h);
            },
          );
        },
      );
  }
}

class _HistoryPage extends StatelessWidget {
  final String userName;
  _HistoryPage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('new_orders')
          .where('user_name', isEqualTo: userName)
          .where('status', isEqualTo: 'canceled')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.history, size: 50, color: Colors.grey),
              SizedBox(height: 16),
              getCustomFont(
                "No Order History",
                18.sp,
                context.theme.primaryColor,
                1,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              getCustomFont(
                "Currently you don’t have any past order history.",
                14.sp,
                greyTextColor,
                1,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 30), // Adjust spacing as needed
            ],
          );
        }

        final bookings = snapshot.data!.docs;
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            var booking = bookings[index];
            var data = booking.data() as Map<String, dynamic>;

            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.h),
                  border: Border.all(color: grey20)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.build, size: 40, color: Colors.green),
                      getHorSpace(16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomFont(data['service_name'] ?? 'N/A',
                              16.sp, context.theme.primaryColor, 1,
                              fontWeight: FontWeight.w600),
                          getVerSpace(6.h),
                          getCustomFont(
                              "Order Number: ${data['order_number'] ?? 'N/A'}",
                              14.sp,
                              neutralShades,
                              1,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      getVerSpace(10.h),
                    ],
                  ),
                  getVerSpace(12.h),
                  Divider(color: greyButton),
                  Container(
                    child: Column(
                      children: [
                        getVerSpace(2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont("Status", 14.sp, greyTextColor, 1,
                                fontWeight: FontWeight.w500),
                            confirm_pending_button(
                                data['status'],
                                completedButtonColor,
                                completedButtonTextColor),
                          ],
                        ),
                        getVerSpace(12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont("Provider", 14.sp, greyTextColor, 1,
                                fontWeight: FontWeight.w500),
                            getCustomFont(data['provider_name'] ?? 'N/A', 14.sp,
                                Color(0XFF33383F), 1,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        getVerSpace(12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont(
                                "Schedule", 14.sp, greyTextColor, 1,
                                fontWeight: FontWeight.w500),
                            getCustomFont(
                                "${data['time']}, ${data['date']}",
                                14.sp,
                                Color(0XFF33383F),
                                1,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingAll(16.h),
            ).paddingSymmetric(vertical: 10.h);
          },
        );
      },
    );
  }
}

Widget confirm_pending_button(
    String status, Color buttonBgColor, Color buttonTextColor) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.h),
      color: buttonBgColor,
    ),
    child: getCustomFont(status, 14.sp, buttonTextColor, 1,
            fontWeight: FontWeight.w600)
        .paddingSymmetric(horizontal: 8.h),
  );
}
