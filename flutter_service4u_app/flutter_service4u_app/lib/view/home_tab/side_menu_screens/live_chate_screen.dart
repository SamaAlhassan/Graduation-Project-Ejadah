
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';

import '../../../utils/color_category.dart';

class LiveChateScreen extends StatefulWidget {


  @override
  State<LiveChateScreen> createState() => _LiveChateScreenState();
}

backclick() {
  Constant.backToFinish();
}

class _LiveChateScreenState extends State<LiveChateScreen> {
  TextEditingController messegeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () async {
        backclick();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simple_app_bar(() {
              backclick();
            }),
            Expanded(
              child: common_container(
                context.theme.focusColor,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              seeAll_button_formate(
                                  "Live Chat",
                                  context.theme.primaryColor,
                                  buttonPermition: false,
                                  () {},
                                  "",
                                  "",
                                  fontwidth: FontWeight.w600,
                                  fontsize: 18.sp),
                              getSvgImage("more_hor_rounded.svg")
                            ],
                          ),
                          getVerSpace(16.h),
                          door_hub_msg("11:59AM", "Hello, thank you for visiting DoorHub. How can we help you?"),
                          getVerSpace(24.h),
                          user_msg("11:59AM", "Hello, I have purchased the UI kit. I need help about the others service. I want to add more features."),
                          getVerSpace(24.h),
                          door_hub_msg("12:15PM", "We are glad that you have purchased our kit. Which features you would like to add?"),
                          getVerSpace(24.h),
                          user_msg("12:30PM", "Thank you so much for your quick response. Please take a look on this link. https://ui8.net/product-link"),


                        ],
                      ).paddingAll(16.h),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            getSvgImage("add_file_icon.svg"),
                            getHorSpace(24.h),
                            getSvgImage("emoji_icon.svg"),
                          ],
                        ),
                        getHorSpace(24.h),
                        Expanded(
                            child: getSearchTextField(messegeController, "Type your massage",borderRadius: 100.h,borderWidth: 2.h ,
                                prefixpermition: false,
                                suffixicon: Container(
                                  height: 40.h,
                                  width: 40.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: blue),
                                  child: getSvgImage("send_icon.svg")
                                      .paddingAll(10.h),
                                ).paddingAll(4.h)))
                      ],
                    ).paddingSymmetric(horizontal: 16.h)
                  ],
                ),
              ).paddingSymmetric(horizontal: 16.h, vertical: 16.h),
            ),
          ],
        )),
      ),
    );
  }

  Widget door_hub_msg(String time,String messege){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: blue.withOpacity(0.10),
              border:
              Border.all(color: Color(0XFFCABDFF))),
          child: getSvgImage("door_hub_logo.svg")
              .paddingSymmetric(
              horizontal: 11.66.h, vertical: 11.5.h),
        ),
        getHorSpace(16.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  getCustomFont("Door Hub", 15.sp,
                      context.theme.primaryColor, 1,
                      fontWeight: FontWeight.w600),
                  getHorSpace(12.h),
                  getCustomFont(time, 13.sp,
                      Color(0XFFBBBBBB), 1,
                      fontWeight: FontWeight.w500)
                ],
              ),
              getVerSpace(4.h),
              getMultilineCustomFont(
                  messege,
                  15.sp,
                  Color(0XFF29303C),
                  fontWeight: FontWeight.w500,
                  txtHeight: 1.7.h)
                  .paddingOnly(right: 70.h)
            ],
          ),
        ),
      ],
    );
  }

  Widget user_msg(String time,String messege){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  getCustomFont(time, 13.sp,
                      Color(0XFFBBBBBB), 1,
                      fontWeight: FontWeight.w500),
                  getHorSpace(16.h),
                  getCustomFont("You", 15.sp,
                      context.theme.primaryColor, 1,
                      fontWeight: FontWeight.w600),
                ],
              ),
              getVerSpace(4.h),
              getMultilineCustomFont(
                  messege,
                  15.sp,
                  Color(0XFF29303C),
                  fontWeight: FontWeight.w500,
                  txtHeight: 1.7.h,textAlign: TextAlign.right)
            ],
          ),
        ),
        getHorSpace(16.h),
        Container(
            height: 40.h,
            width: 40.h,
            child: getAssetImage(
                "live_chate_user_image.png")),
      ],
    );
  }
}
