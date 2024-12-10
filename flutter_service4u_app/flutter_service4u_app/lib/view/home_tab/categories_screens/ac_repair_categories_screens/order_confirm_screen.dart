import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/view/home_main_screen.dart';
import '../../../../utils/constantWidget.dart';

class OrderConfirmScreen extends StatefulWidget {
  @override
  State<OrderConfirmScreen> createState() => _OrderConfirmScreenState();
}

backClick() {
  Constant.backToFinish();
}

class _OrderConfirmScreenState extends State<OrderConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            body: SafeArea(
                child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 100.h,
                  width: 100.h,
                  child: getAssetImage("order_confirm.png")),
              getVerSpace(30.h),
              getCustomFont("Booking Confirmed", 22.sp, regularBlack, 1,
                  fontWeight: FontWeight.w700),
              getVerSpace(10.h),
              Container(
                width: 292.h,
                child: getMultilineCustomFont(
                    "Your booking has been successfully confirmed!",
                    16.sp,
                    regularBlack,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center),
              ),
              getVerSpace(30.h),
              getCustomButton("Ok", () {
                Get.offAll(() => HomeMainScreen()); 
              }).paddingSymmetric(horizontal: 50.h)
            ],
          ),
        ))));
  }
}
