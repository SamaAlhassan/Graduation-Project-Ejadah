import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/controller.dart';
import '../../../utils/color_category.dart';
import '../../../utils/constant.dart';
import '../../../utils/constantWidget.dart';

class SideMenuPaymentMenuScreen extends StatefulWidget {
  @override
  State<SideMenuPaymentMenuScreen> createState() =>
      _SideMenuPaymentMenuScreenState();
}

class _SideMenuPaymentMenuScreenState extends State<SideMenuPaymentMenuScreen> {
  backclick() {
    Constant.backToFinish();
  }

  SideMenuPaymentMenuScreenController sideMenuPaymentMenuScreenController =
      Get.put(SideMenuPaymentMenuScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SideMenuPaymentMenuScreenController>(
      init: SideMenuPaymentMenuScreenController(),
      builder: (sideMenuPaymentMenuScreenController) => WillPopScope(
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
                  simple_app_bar(() {
                    backclick();
                  }),
                  getVerSpace(16.87.h),
                  seeAll_button_formate(
                          "Profile",
                          context.theme.primaryColor,
                          () {},
                          "Edit Profile",
                          Get.isDarkMode
                              ? "edit_icon_white.svg"
                              : "edit_icon.svg",
                          buttonWidth: 98.h,
                          buttonTextColor: Get.isDarkMode ? regularWhite : blue,
                          fontsize: 24.sp,
                          fontwidth: FontWeight.w700,
                          buttonFontSize: 12.sp,
                          buttonFontWidth: FontWeight.w500,
                          boxdecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.h),
                              color: Get.isDarkMode
                                  ? greyButtonText
                                  : regularWhite))
                      .paddingSymmetric(horizontal: 15.h),
                  getVerSpace(20.h),
                  Expanded(
                      child: Container(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.h),
                            color: context.theme.focusColor,
                          ),
                        ),
                        getVerSpace(16.h),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
