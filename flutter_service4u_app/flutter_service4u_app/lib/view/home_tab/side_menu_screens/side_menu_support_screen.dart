import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/color_category.dart';
import '../../../utils/constant.dart';
import '../../../utils/constantWidget.dart';

class SideMenuSupportScreen extends StatefulWidget {
  @override
  State<SideMenuSupportScreen> createState() => _SideMenuSupportScreenState();
}

class _SideMenuSupportScreenState extends State<SideMenuSupportScreen> {
  backclick() {
    Constant.backToFinish();
  }

  SideMenuSupportScreenController sideMenuSupportScreenController =
      Get.put(SideMenuSupportScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SideMenuSupportScreenController>(
      init: SideMenuSupportScreenController(),
      builder: (sideMenuSupportScreenController) => WillPopScope(
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
                  getCustomAppBar("Support", () {
                    backclick();
                  }).paddingSymmetric(horizontal: 20.h),
                  getVerSpace(20.h),
                  Expanded(
                      child: Container(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      children: [
                        support_option(
                            acServiceColor,
                            13.92.h,
                            15.02.h,
                            12.38.h,
                            12.84.h,
                            "live_chat_icon.svg",
                            "Live Chat",
                            "Chat time 9am- 9pm", () {
                          Constant.sendToNext(
                              context, Routes.liveChateScreenRoute);
                        }),
                        getVerSpace(10.h),
                        support_option(
                            beautyServiceColor,
                            13.92.h,
                            15.02.h,
                            12.38.h,
                            12.84.h,
                            "call_icon.svg",
                            "Phone Call",
                            "Calling hour 9am- 9pm",
                            () {}),
                        getVerSpace(10.h),
                        support_option(
                            paintingServiceColor,
                            13.92.h,
                            15.02.h,
                            12.38.h,
                            12.84.h,
                            "what's_app_icon.svg",
                            "Whatsapp Call",
                            "Calling hour 9am- 9pm",
                            () {}),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )),
    );
  }

  Widget support_option(Color bgcolor, double top, double bottom, double left,
      double right, String icon, String title, String time, Function function) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: common_container(context.theme.focusColor,
          child: Row(
            children: [
              Container(
                height: 55.05.h,
                width: 55.05.h,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: bgcolor),
                child: getSvgImage(icon).paddingOnly(
                    top: top, bottom: bottom, left: left, right: right),
              ),
              getHorSpace(16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomFont(title, 16.sp, context.theme.primaryColor, 1,
                      fontWeight: FontWeight.w600),
                  getVerSpace(8.h),
                  getCustomFont(
                      time,
                      14.sp,
                      Get.isDarkMode ? subTitleColorDarkTheme : neutralShades,
                      1,
                      fontWeight: FontWeight.w500)
                ],
              )
            ],
          ).paddingAll(15.h)),
    );
  }
}
