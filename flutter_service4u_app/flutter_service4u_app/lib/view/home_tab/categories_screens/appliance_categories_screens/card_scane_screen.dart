import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../../../../utils/color_category.dart';

class CardScaneScreen extends StatefulWidget {
  @override
  State<CardScaneScreen> createState() => _CardScaneScreenState();
}

backClick() {
  Constant.backToFinish();
}

class _CardScaneScreenState extends State<CardScaneScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          backClick();
          return false;
        },
        child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: SafeArea(
                child: Column(
              children: [
                getAppBar(() {
                  backClick();
                }),
                getVerSpace(17.87.h),
                Expanded(
                  child: common_container(context.theme.focusColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getMultilineCustomFont(
                                      "Please hold the card inside the frame to start scaning",
                                      15.sp,
                                      Color(0XFF747688),
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.center)
                                  .paddingSymmetric(horizontal: 39.h),
                              getVerSpace(29.52.h),
                              getAssetImage("card_image.png")
                            ],
                          ).paddingSymmetric(horizontal: 16.h))
                      .paddingSymmetric(horizontal: 16.h),
                ),
                getVerSpace(10.h),
                Container(
                    color: context.theme.focusColor,
                    child: getCustomButton(
                            "Scaning",
                            color: greyButtonText,
                            () {},
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.h),
                                color: greyButton))
                        .paddingAll(16.h))
              ],
            ))));
  }
}
