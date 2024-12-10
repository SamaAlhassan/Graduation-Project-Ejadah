import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';

import '../../../controller/controller.dart';
import '../../../routes/app_routes.dart';
// ignore: unused_import
import '../../../utils/color_category.dart';

class SettingScreens extends StatefulWidget {
  const SettingScreens({Key? key}) : super(key: key);

  @override
  State<SettingScreens> createState() => _SettingScreensState();
}

backClick() {
  Constant.backToFinish();
}

class _SettingScreensState extends State<SettingScreens> {
  SettingScreensController settingScreensController =
      Get.put(SettingScreensController());
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              getVerSpace(24.h),
              getCustomAppBar("Settings", () {
                backClick();
              }),
              Expanded(
                  child: ListView(
                children: [
                  getVerSpace(30.h),
                  getProfileOption("help_support_icon.svg", "Help Center", () {
                    Constant.sendToNext(context, Routes.helpCenterScreenRoute);
                  }, height: 24.h, width: 24.h),
                  getVerSpace(20.h),
                  getProfileOption("lock_icon.svg", "Privacy Policy", () {
                    Constant.sendToNext(
                        context, Routes.privacyPolicyScreenRoute);
                  }, height: 24.h, width: 24.h),
                  getVerSpace(20.h),
                  getProfileOption("security_icon.svg", "Security", () {
                    Constant.sendToNext(context, Routes.securityScreenRoute);
                  }, height: 24.h, width: 24.h),
                  getVerSpace(20.h),
                  getProfileOption("settings_icon.svg", "Terms And Conditions",
                      () {
                    Constant.sendToNext(
                        context, Routes.termsAndConditionScreenRoute);
                  }, height: 24.h, width: 24.h),
                  getVerSpace(20.h)
                ],
              ))
            ],
          ).paddingSymmetric(horizontal: 20.h),
        ),
      ),
    );
  }
}
