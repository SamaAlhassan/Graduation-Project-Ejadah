import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';
import '../../utils/pref_data.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController splashScreenController =
      Get.put(SplashScreenController());

  void initState() {
    _getIsFirst();
    super.initState();
  }

  _getIsFirst() async {
    bool isSignIn = await PrefData.getIsSignIn();
    bool isIntro = await PrefData.getIsIntro();

    Timer(const Duration(seconds: 3), () {
      // Constant.sendToNext(context, Routes.onBoardingScreenRoute);
      // Get.toNamed(Routes.homeScreenRoute);
      if (isIntro) {
        Get.toNamed(Routes.onBoardingScreenRoute);
      } else if (isSignIn) {
        Get.toNamed(Routes.signInEmptyStateRoute);
      } else {
        Get.toNamed(Routes.homeMainScreenRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (splashScreenController) => Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 500,
                  width: 500,
                  child:  getAssetImage("Ejadah (1).png"))
            ],
          ),
        ),
      ),
    );
  }
}
