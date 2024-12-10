import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/controller/controller.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/view/sign_in/sign_in_empty_state.dart';
import '../../routes/app_routes.dart';
import '../../utils/color_category.dart';
import '../../utils/constantWidget.dart';
import '../../utils/pref_data.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

backClick() {
  Constant.closeApp();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SideMenuProfifileScreenController sideMenuProfifileScreenController =
      Get.put(SideMenuProfifileScreenController());
  // Fetch the AuthController using GetX
  final AuthController authController = Get.find<AuthController>();

  // Variables to hold user data
  String userName = "";
  String userEmail = "";

  @override
  void initState() {
    super.initState();
    // Fetch user data when the screen loads
    fetchUserData();
  }

  // Function to fetch user data
  Future<void> fetchUserData() async {
    Map<String, dynamic>? userData = await authController.getUserData();

    if (userData != null) {
      setState(() {
        // Update the UI with user data
        userName = userData['name'] ?? "N/A";
        userEmail = userData['email'] ?? "N/A";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideMenuNotificationScreenController>(
      init: SideMenuNotificationScreenController(),
      builder: (sideMenuNotificationScreenController) => SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Column(
              children: [
                getVerSpace(40.h),
                getAssetImage("app_icon_user.png", height: 100.h, width: 100.w),
                getVerSpace(10.h),
                getCustomFont(userName, 18.sp, Color(0XFF000000), 1,
                    fontWeight: FontWeight.w600, txtHeight: 1.5.h),
                getVerSpace(8.h),
                getCustomFont(
                    userEmail, 16.sp, Color(0XFF808080), 1,
                    fontWeight: FontWeight.w500),
                getVerSpace(20.h),
                getProfileOption("profile_icon.svg", "My Profile", () async {
                  var result = await Get.toNamed(Routes.myProfileScreenRoute);
                  if (result == true) {
                    fetchUserData(); // Re-fetch the data after returning from profile edit
                  }
                }),
                getVerSpace(20.h),
                GetBuilder<SideDrawerController>(
                  init: SideDrawerController(),
                  builder: (sideDrawerController) => getProfileOption(
                      "unselected_address_icon_lt.svg", "My Address", () {
                    sideDrawerController.addAddessScreen(false);
                    Constant.sendToNext(
                        context, Routes.sideMenuAddressScreenRoute);
                    // Get.to(MyAddress());
                  }),
                ),
                // getVerSpace(20.h),
                // GetBuilder<SideMenuPaymentMenuScreenController>(
                //   init: SideMenuPaymentMenuScreenController(),
                //   builder: (sideMenuPaymentMenuScreenController) =>
                //       getProfileOption("card_icon.svg", "My Card", () {
                //     sideMenuPaymentMenuScreenController.setPaymentScreen(false);
                //     Constant.sendToNext(context, Routes.payMentScreenRoute);
                //     // Get.to(MyCard());
                //   }),
                // ),
                getVerSpace(20.h),
                getProfileOption("setting_icon.svg", "Settings", () {
                  Constant.sendToNext(context, Routes.settingScreensRoute);
                }),
                getVerSpace(41.h),
              ],
            ),
            getVerSpace(20.h),
            getCustomButton(
              "Logout",
              () {
                Get.defaultDialog(
                    barrierDismissible: false,
                    title: '',
                    content: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Column(
                        children: [
                          getCustomFont("Are you sure you want to Logout!",
                              24.sp, Color(0XFF000000), 2,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h, bottom: 13.h),
                            child: Row(
                              children: [
                                Expanded(
                                    child: getCustomButton("Yes", () {
                                  PrefData.setIsSignIn(true);
                                  Get.off(SignInEmptyState());
                                }, buttonheight: 50.h)),
                                SizedBox(width: 10.w),
                                Expanded(
                                    child: getCustomButton("No", () {
                                  Get.back();
                                },
                                        color: buttonColor,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: buttonColor,
                                            style: BorderStyle.solid,
                                            width: 1.0.w,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.h),
                                        ),
                                        buttonheight: 50.h)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            )
          ],
        ).paddingSymmetric(horizontal: 20.h),
      )),
    );
  }
}
