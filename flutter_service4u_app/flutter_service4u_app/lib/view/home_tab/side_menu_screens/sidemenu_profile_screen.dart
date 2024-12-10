import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../../../controller/controller.dart';
import '../../../utils/constant.dart';

class SideMenuProfifileScreen extends StatefulWidget {
  @override
  State<SideMenuProfifileScreen> createState() =>
      _SideMenuProfifileScreenState();
}

class _SideMenuProfifileScreenState extends State<SideMenuProfifileScreen> {
  SideMenuProfifileScreenController sideMenuProfifileScreenController =
      Get.put(SideMenuProfifileScreenController());

  backclick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SideMenuProfifileScreenController>(
      init: SideMenuProfifileScreenController(),
      builder: (sideMenuProfifileScreenController) => WillPopScope(
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
                          child: Row(
                            children: [
                              Container(
                                  height: 50.h,
                                  width: 50.h,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: getAssetImage("user_image.png")),
                              getHorSpace(12.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomFont("Ashfak Sayem", 15.sp,
                                      context.theme.primaryColor, 1,
                                      fontWeight: FontWeight.w600,
                                      txtHeight: 1.5.h),
                                  getCustomFont(
                                      "ashfaksayem@gmail.com",
                                      12.sp,
                                      Get.isDarkMode
                                          ? Color(0XFF6F767E)
                                          : neutralShades,
                                      1,
                                      fontWeight: FontWeight.w500,
                                      txtHeight: 1.6.h)
                                ],
                              ),
                            ],
                          ).paddingAll(16.h),
                        ),
                        getVerSpace(16.h),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.h),
                            color: context.theme.focusColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomFont("Phone Number", 15.sp,
                                  context.theme.primaryColor, 1,
                                  fontWeight: FontWeight.w600,
                                  txtHeight: 1.6.h),
                              getVerSpace(8.h),
                              Container(
                                height: 45.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.h),
                                    color: Get.isDarkMode
                                        ? greyButtonText
                                        : fillTextField),
                                child: Row(
                                  children: [
                                    Container(
                                        height: 24.h,
                                        width: 24.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        child:
                                            getAssetImage("country_flag.png")),
                                    getHorSpace(8.h),
                                    getCustomFont("+1", 14.sp,
                                        context.theme.primaryColor, 1,
                                        fontWeight: FontWeight.w600),
                                    getHorSpace(12.h),
                                    getCustomFont("64 012 3456", 14.sp,
                                        context.theme.primaryColor, 1,
                                        fontWeight: FontWeight.w600),
                                  ],
                                ).paddingSymmetric(
                                    vertical: 10.5.h, horizontal: 12.h),
                              ),
                              getVerSpace(24.h),
                              profile_detail_formate(
                                  "Email", "ashfaksayem@gmail.com"),
                              getVerSpace(24.h),
                              profile_detail_formate("Gender", "Male"),
                              getVerSpace(24.h),
                              profile_detail_formate(
                                  "Date of Birth", "Not Set"),
                            ],
                          ).paddingAll(16.h),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )),
    );
  }

  Widget profile_detail_formate(title, detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getCustomFont(title, 15.sp, context.theme.primaryColor, 1,
            fontWeight: FontWeight.w600, txtHeight: 1.6.h),
        getVerSpace(8.h),
        Container(
          height: 45.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.h),
              color: Get.isDarkMode ? greyButtonText : fillTextField),
          child: Row(
            children: [
              getCustomFont(detail, 14.sp, context.theme.primaryColor, 1,
                  fontWeight: FontWeight.w600),
            ],
          ).paddingSymmetric(vertical: 10.5.h, horizontal: 12.h),
        )
      ],
    );
  }
}
