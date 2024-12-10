import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../../../controller/controller.dart';
import '../../../utils/color_category.dart';

class RewardsPointScreen extends StatefulWidget {
  @override
  State<RewardsPointScreen> createState() => _RewardsPointScreenState();
}

backClick() {
  Constant.backToFinish();
}

class _RewardsPointScreenState extends State<RewardsPointScreen> {
  RewardsPointScreenController rewardsPointScreenController =
      Get.put(RewardsPointScreenController());

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
              getAppBar(() {
                backClick();
              }),
              getVerSpace(15.87.h),
              common_container(
                context.theme.focusColor,
                child: Container(
                    height: 168.46.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.h),
                        ),
                        color: blue,
                        image: DecorationImage(
                            image: AssetImage(
                              Constant.assetImagePath +
                                  "rewards_point_banner.png",
                            ),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        getVerSpace(15.46.h),
                        getSvgImage("point_icon.svg"),
                        getVerSpace(4.39.h),
                        getCustomFont("2,400", 32.sp, regularWhite, 1,
                            fontWeight: FontWeight.w700),
                        getVerSpace(12.94.h),
                        getCustomFont("Current Points", 12.sp, regularWhite, 1,
                            fontWeight: FontWeight.w500),
                      ],
                    )).paddingAll(16.h),
              ).paddingSymmetric(horizontal: 16.h),
              getVerSpace(16.54.h),
              common_container(context.theme.focusColor,
                      child: Column(
                        children: [
                          seeAll_button_formate("Rewards Points Offers",
                              context.theme.primaryColor, () {}, "", "",
                              buttonPermition: false),
                          getVerSpace(16.h),
                          rewards_point_formate(
                              "percentage_icon.svg",
                              "5% Off Entire Order",
                              "1000 Points",
                              acServiceColor),
                          getVerSpace(12.h),
                          rewards_point_formate(
                              "dollor_icon.svg",
                              "USD \$10 Cash Back",
                              "2000 Points",
                              plumbingServiceColor),
                          getVerSpace(12.h),
                          rewards_point_formate("percentage_icon.svg",
                              "5% Off Entire Order", "1000 Points", greyButton),
                          getVerSpace(12.h),
                          rewards_point_formate("dollor_icon.svg",
                              "USD \$30 Cash Back", "4000 Points", greyButton),
                        ],
                      ).paddingAll(16.h))
                  .paddingSymmetric(
                horizontal: 16.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget rewards_point_formate(
      String icon, String offer, String points, Color color) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.h)), color: color),
      child: Row(
        children: [
          Container(
            height: 50.h,
            width: 50.h,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: regularWhite),
            child: getSvgImage(icon).paddingAll(13.h),
          ),
          getHorSpace(16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomFont(offer, 16.sp, context.theme.primaryColor, 1,
                  fontWeight: FontWeight.w600),
              getVerSpace(6.h),
              getCustomFont(points, 14.sp, Color(0XFF29303C), 1,
                  fontWeight: FontWeight.w500),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 16.h, vertical: 15.59.h),
    );
  }
}
