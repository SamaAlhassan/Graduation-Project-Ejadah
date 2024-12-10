import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:service_hub_app/firestore_test_page.dart';
import 'package:service_hub_app/utils/color_category.dart';
import '../../../../controller/controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/constantWidget.dart';
import '../../../../current_location_screen.dart';
import '../ac_repair_categories_screens/phone_number_screen.dart';

class CheakOutScreen extends StatefulWidget {
  @override
  State<CheakOutScreen> createState() => _CheakOutScreenState();
}

class _CheakOutScreenState extends State<CheakOutScreen> {
  CheakOutScreenController cheakOutScreenController =
      Get.put(CheakOutScreenController());

  final PhoneNumberScreenController phoneNumberScreenController =
      Get.put(PhoneNumberScreenController());
  SideDrawerController sideDrawerController = Get.put(SideDrawerController());

  final AuthController authController = Get.find<AuthController>();
  String defaultPhoneNumber = " ";
  String userAddress = "";
  bool shouldFetchData = true;

  @override
  void initState() {
    super.initState();
    if (shouldFetchData) {
      fetchUserData(); // Call this when screen loads
    }
  }

  Future<void> fetchUserData() async {
    shouldFetchData = false; // Set this to prevent re-fetching after update
    // Call the function to get user data
    Map<String, dynamic>? userData = await authController.getUserData();
    if (userData != null) {
      setState(() {
        defaultPhoneNumber = userData['mobile'] ?? "N/A";
        userAddress = userData['location'] ?? "N/A";
        phoneNumberScreenController.defaultPhoneNumber =
            defaultPhoneNumber; // Update controller's phone number
        cheakOutScreenController.userAddress = userAddress;
      });
    }
  }
// 1. Get the instance of ServiceBookBottomSheetController using Get.find()
ServiceBookBottomSheetController serviceBookBottomSheetController = Get.find();


  Future<void> handleCheckout() async {
 // 2. Now, check the provider UID from the instance
if (serviceBookBottomSheetController.selectedProviderUid == null) {
  print("No provider selected.");
  return; // Handle this case as per your application's logic
}
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check if the user has updated their phone number in the PhoneNumberScreen
    String updatedPhoneNumber =
        phoneNumberScreenController.defaultPhoneNumber ?? defaultPhoneNumber;
    setState(() {
      defaultPhoneNumber = updatedPhoneNumber;
    });
  }

  backclick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    // Get the service name from the passed arguments
    final String serviceName =
        Get.arguments['serviceName'] ?? 'Service Name Not Found';

    initializeScreenSize(context);
    return GetBuilder<PayMentScreenController>(
        init: PayMentScreenController(),
        builder: (payMentScreenController) => GetBuilder<
                PhoneNumberScreenController>(
            init: PhoneNumberScreenController(),
            builder: (phoneNumberScreenController) => GetBuilder<
                    SideDrawerController>(
                init: SideDrawerController(),
                builder: (SideDrawerController) => WillPopScope(
                      onWillPop: () async {
                        backclick();
                        return false;
                      },
                      child: Scaffold(
                        backgroundColor: context.theme.scaffoldBackgroundColor,
                        body: SafeArea(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getVerSpace(24.h),
                                getCustomAppBar("Check Out", () {
                                  backclick();
                                }).paddingSymmetric(horizontal: 20.h),
                                getVerSpace(32.h),
                                Expanded(
                                    child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    getCustomFont(
                                            "Service", 16.sp, regularBlack, 1,
                                            fontWeight: FontWeight.w600)
                                        .paddingSymmetric(horizontal: 20.h),
                                    getVerSpace(20.h),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.h),
                                          border: Border.all(color: grey20)),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 60.h,
                                            width: 60.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.h),
                                                color: grey10),
                                            child: getSvgImage("bag_icon.svg")
                                                .paddingAll(10.h),
                                          ),
                                          getHorSpace(14.h),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              getCustomFont(serviceName, 16.sp,
                                                  context.theme.primaryColor, 1,
                                                  fontWeight: FontWeight.w400),
                                              getVerSpace(6.h),
                                              // getCustomFont("1 Ton-1.5 Ton X2", 13.sp,
                                              //     grey40, 1,
                                              //     fontWeight: FontWeight.w400)
                                            ],
                                          ),
                                        ],
                                      ).paddingAll(14.h),
                                    ).paddingSymmetric(horizontal: 20.h),
                                    getVerSpace(24.h),
                                    GetBuilder<
                                            ServiceBookBottomSheetController>(
                                        init:
                                            ServiceBookBottomSheetController(),
                                        builder:
                                            (serviceBookBottomSheetController) =>
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      getCustomFont(
                                                          "Date & Time & Provider",
                                                          16.sp,
                                                          regularBlack,
                                                          1,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      getVerSpace(20.h),
                                                      Container(
                                                        height: 50.h,
                                                        child: getTextField(
                                                            color: serviceBookBottomSheetController
                                                                        .selectedDate ==
                                                                    null
                                                                ? grey40
                                                                : regularBlack,
                                                            function: () {
                                                          serviceBookBottomSheetController
                                                              .selectDate(
                                                                  context);
                                                        },
                                                            type: TextInputType
                                                                .none,
                                                            serviceBookBottomSheetController
                                                                        .selectedDate ==
                                                                    null
                                                                ? "Select Date"
                                                                : "${DateFormat("dd-MMM-yyyy").format(serviceBookBottomSheetController.selectedDate!)}",
                                                            "calender_icon.svg",
                                                            suffixiconpermition:
                                                                true,
                                                            fillColor: grey10,
                                                            widget:
                                                                GestureDetector(
                                                              onTap: () {
                                                                serviceBookBottomSheetController
                                                                    .selectDate(
                                                                        context);
                                                              },
                                                              child: getSvgImage(
                                                                      "edit_icon.svg")
                                                                  .paddingOnly(
                                                                      top: 15.h,
                                                                      bottom:
                                                                          17.h,
                                                                      right:
                                                                          18.h),
                                                            )),
                                                      ),
                                                      getVerSpace(16.h),
                                                      Container(
                                                        height: 50.h,
                                                        child: getTextField(
                                                            color: serviceBookBottomSheetController
                                                                        .selectedTime ==
                                                                    null
                                                                ? grey40
                                                                : regularBlack,
                                                            function: () {
                                                          serviceBookBottomSheetController
                                                              .selectTime(
                                                                  context);
                                                        },
                                                            type: TextInputType
                                                                .none,
                                                            serviceBookBottomSheetController
                                                                        .selectedTime ==
                                                                    null
                                                                ? "Select Time"
                                                                : "${serviceBookBottomSheetController.selectedTime!.format(context)}",
                                                            "clock_icon.svg",
                                                            suffixiconpermition:
                                                                true,
                                                            fillColor: grey10,
                                                            widget:
                                                                GestureDetector(
                                                              onTap: () {
                                                                serviceBookBottomSheetController
                                                                    .selectTime(
                                                                        context);
                                                              },
                                                              child: getSvgImage(
                                                                      "edit_icon.svg")
                                                                  .paddingOnly(
                                                                      top: 15.h,
                                                                      bottom:
                                                                          17.h,
                                                                      right:
                                                                          18.h),
                                                            )),
                                                      ),
                                                      getVerSpace(16.h),
                                                      Container(
                                                        height: 50.h,
                                                        child: getTextField(
                                                            color: serviceBookBottomSheetController
                                                                        .provider ==
                                                                    null
                                                                ? grey40
                                                                : regularBlack,
                                                            function: () {
                                                          serviceBookBottomSheetController
                                                              .selectProvider(
                                                                  context);
                                                        },
                                                            type: TextInputType
                                                                .none,
                                                            serviceBookBottomSheetController
                                                                        .provider ==
                                                                    null
                                                                ? "Select Provider"
                                                                : "${serviceBookBottomSheetController.provider!}",
                                                            "profile_icon.svg",
                                                            suffixiconpermition:
                                                                true,
                                                            fillColor: grey10,
                                                            widget:
                                                                GestureDetector(
                                                              onTap: () {
                                                                serviceBookBottomSheetController
                                                                    .selectProvider(
                                                                        context);
                                                              },
                                                              child: getSvgImage(
                                                                      "edit_icon.svg")
                                                                  .paddingOnly(
                                                                      top: 15.h,
                                                                      bottom:
                                                                          17.h,
                                                                      right:
                                                                          18.h),
                                                            )),
                                                      ),
                                                      getVerSpace(20.h),
                                                      getCustomFont(
                                                          "Phone Number",
                                                          16.sp,
                                                          regularBlack,
                                                          1,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      getVerSpace(14.h),
                                                      Container(
                                                        height: 50.h,
                                                        child: getTextField(
                                                          "Enter your phone number",
                                                          "call_icon.svg",
                                                          color: regularBlack,
                                                          type: TextInputType
                                                              .none,
                                                          controller:
                                                              TextEditingController(
                                                                  text:
                                                                      defaultPhoneNumber), // Reflect the phone number
                                                          // controller:
                                                          //     phoneNumberController,
                                                          suffixiconpermition:
                                                              true,
                                                          fillColor: grey10,
                                                          widget:
                                                              GestureDetector(
                                                            onTap: () async {
                                                              // Navigate to the Phone Number editing screen
                                                              final newPhoneNumber =
                                                                  await Navigator
                                                                      .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            PhoneNumberScreen()),
                                                              );

                                                              // If a new phone number is returned, update the state
                                                              if (newPhoneNumber !=
                                                                      null &&
                                                                  newPhoneNumber
                                                                      .isNotEmpty) {
                                                                setState(() {
                                                                  defaultPhoneNumber =
                                                                      newPhoneNumber; // Update the displayed phone number
                                                                  phoneNumberScreenController
                                                                      .updatePhoneNumber(
                                                                          newPhoneNumber); // Update the controller
                                                                });
                                                                // Update Firestore with the new phone number
                                                                await authController
                                                                    .updateUserData(
                                                                        phoneNumber:
                                                                            newPhoneNumber);
                                                              }
                                                            },
                                                            child: getSvgImage(
                                                                    "edit_icon.svg")
                                                                .paddingOnly(
                                                                    top: 15.h,
                                                                    bottom:
                                                                        17.h,
                                                                    right:
                                                                        18.h),
                                                          ),
                                                        ),
                                                      ),
                                                      getVerSpace(20.h),
                                                      getCustomFont(
                                                          "Address",
                                                          16.sp,
                                                          regularBlack,
                                                          1,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      getVerSpace(14.h),
                                                      Container(
                                                        height: 50.h,
                                                        child: getTextField(
                                                          "Enter your address",
                                                          "unselected_address_icon_lt.svg",
                                                          color: regularBlack,
                                                          type: TextInputType
                                                              .none,
                                                          controller:
                                                              TextEditingController(
                                                            text: cheakOutScreenController
                                                                .userAddress, // Bind the user address
                                                          ),
                                                          suffixiconpermition:
                                                              true,
                                                          fillColor: grey10,
                                                          widget:
                                                              GestureDetector(
                                                            onTap: () async {
                                                              String?
                                                                  newselectedLocation =
                                                                  await Navigator
                                                                      .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          CurrentLocationScreen(
                                                                    onLocationSelected: (String
                                                                            placeName,
                                                                        double
                                                                            latitude,
                                                                        double
                                                                            longitude) {
                                                                      // Update the address in the controller
                                                                      cheakOutScreenController
                                                                              .userAddress =
                                                                          placeName;
                                                                      // Store latitude and longitude in the controller if needed
                                                                      cheakOutScreenController
                                                                              .latitude =
                                                                          latitude;
                                                                      cheakOutScreenController
                                                                              .longitude =
                                                                          longitude;
                                                                      setState(() {
                                                                        userAddress = placeName; // Update the local state variable
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                              if (newselectedLocation !=
                                                                  null) {
                                                                setState(() {
                                                                  cheakOutScreenController
                                                                          .userAddress =
                                                                      newselectedLocation; // Update state
                                                                  userAddress =
                                                                      newselectedLocation; // Update the local state variable
                                                                });
                                                              }
                                                            },
                                                            child: getSvgImage(
                                                                    "edit_icon.svg")
                                                                .paddingOnly(
                                                                    top: 15.h,
                                                                    bottom:
                                                                        17.h,
                                                                    right:
                                                                        18.h),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                  ],
                                )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.h,
                                        right: 20.h,
                                        top: 20.h,
                                        bottom: 30.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.h),
                                        border: Border.all(
                                            color:
                                                grey20), // Match the border style of other fields
                                        color:
                                            grey10, // Match the background color
                                      ),
                                      child: GestureDetector(
                                        onTap: () async {
                                          // Fetch user name from authController
                                          final customerName =
                                              await authController
                                                  .getUserData();
                                          final userName = customerName != null
                                              ? customerName['name'] ??
                                                  "Unknown User"
                                              : "Unknown User";

                                          // Get the service name from arguments
                                          final serviceName =
                                              Get.arguments['serviceName'] ??
                                                  'Service Name Not Found';

                                          // Access the ServiceBookBottomSheetController instance
                                          final serviceController = Get.find<
                                              ServiceBookBottomSheetController>();

                                          // Prepare the date and time
                                          final date =
                                              serviceController.selectedDate !=
                                                      null
                                                  ? DateFormat("dd-MMM-yyyy")
                                                      .format(serviceController
                                                          .selectedDate!)
                                                  : "Date Not Selected";

                                          final time = serviceController
                                                      .selectedTime !=
                                                  null
                                              ? serviceController.selectedTime!
                                                  .format(context)
                                              : "Time Not Selected";

                                          // Get user location and phone number
                                          final location =
                                              cheakOutScreenController
                                                      .userAddress ??
                                                  "Location Not Provided";
                                          final phoneNumber =
                                              defaultPhoneNumber;

                                          // Place the order
await cheakOutScreenController.addOrder(
  userName: userName,
  serviceName: serviceName,
  date: date,
  time: time,
  location: location,
  phoneNumber: phoneNumber ?? "No phone number",
  providerId: Get.find<ServiceBookBottomSheetController>().selectedProviderUid!, // Access through the existing instance
  providerName:  serviceController.provider ?? "No Provider Selected",  // Replace or fetch dynamically
);


                                          // Navigate to order confirmation screen
                                          Navigator.pushNamed(context,
                                              Routes.orderConfirmScreenRoute);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 13.h),
                                          child: Center(
                                            child: Text(
                                              "Place Order",
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    context.theme.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                              ]),
                        ),
                      ),
                    ))));
  }
}
