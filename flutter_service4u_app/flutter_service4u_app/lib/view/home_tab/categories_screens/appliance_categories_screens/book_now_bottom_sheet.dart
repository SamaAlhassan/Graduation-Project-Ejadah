import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../controller/controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/color_category.dart';
import '../../../../utils/constantWidget.dart';

class BookNowBottomSheet extends StatefulWidget {


  @override
  State<BookNowBottomSheet> createState() => _BookNowBottomSheetState();
}

class _BookNowBottomSheetState extends State<BookNowBottomSheet> {
  BookNowBottomSheetController bookNowBottomSheetController =
      Get.put(BookNowBottomSheetController());
  List time = [
    "12:00 PM",
    "12:30 PM",
    "1:00 PM",
    "1:30 PM",
    "2:00 PM",
    "2:30 PM",
    "3:00 PM",
    "3:30 PM",
    "4:00 PM",
    "4:30 PM"
  ];

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<BookNowBottomSheetController>(
      init: BookNowBottomSheetController(),
      builder: (bookNowBottomSheetController) => Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                seeAll_button_formate(
                  "Select your Date & Time?",
                  context.theme.primaryColor,
                  () {},
                  "Recent",
                  Get.isDarkMode
                      ? "down_arrow_icon_white.svg"
                      : "down_arrow_icon_blue.svg",
                  fontsize: 18.sp,
                  fontwidth: FontWeight.w600,
                  buttonPermition: false,
                ).paddingSymmetric(horizontal: 16.h),
                Container(
                  height: 36.h,
                  width: 36.h,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: greyButton),
                  child: getSvgImage("close_icon.svg", color: Color(0XFF33383F))
                      .paddingAll(8.h),
                )
              ],
            ),
            getVerSpace(20.h),
            GetBuilder<BookNowBottomSheetController>(
                init: BookNowBottomSheetController(),
                builder: (bookNowBottomSheetController) => GestureDetector(
                    onTap: () {
                      bookNowBottomSheetController.setCalenderPosition();
                    },
                    child: select_date_time_button("Select your Date", "DATE",
                        Color(0XFFFFBC99), "date_icon.svg", () {}))),
            getVerSpace(16.h),
            bookNowBottomSheetController.calender
                ? TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 20),
                    lastDay: DateTime.utc(2040, 10, 20),
                    focusedDay: DateTime.now(),
                  )
                : SizedBox(),
            GetBuilder<BookNowBottomSheetController>(
                init: BookNowBottomSheetController(),
                builder: (bookNowBottomSheetController) => GestureDetector(
                    onTap: () {
                      bookNowBottomSheetController.setTimeSelectionPosition();
                    },
                    child: select_date_time_button(
                        bookNowBottomSheetController.currentTime == null
                            ? "Select your Time"
                            : bookNowBottomSheetController.currentTime,
                        "TIME",
                        Color(0XFFB5E4CA),
                        "watch_border_icon.svg",
                        () {}))),
            getVerSpace(20.h),
            bookNowBottomSheetController.timeSelecter ? timeList() : SizedBox(),
            Container(
              color: context.theme.focusColor,
              child: Column(
                children: [
                  getVerSpace(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          getRichtext("Total:", " USD 150.50",
                              firsttextcolor: Color(0XFF6F767E),
                              secondtextcolor: context.theme.primaryColor,
                              firsttextSize: 14.sp,
                              firstTextwidth: FontWeight.w600,
                              secondtextSize: 14.sp,
                              secondTextwidth: FontWeight.w600)
                        ],
                      ),
                      Row(
                        children: [
                          getCustomFont(
                              "View Details", 14.sp, Color(0XFFFC944D), 1,
                              fontWeight: FontWeight.w500),
                          getHorSpace(7.h),
                          getSvgImage("up_arrow_icon.svg")
                        ],
                      )
                    ],
                  ),
                  getVerSpace(20.h),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: getCustomButton("Continue", () {
                        Constant.sendToNext(context, Routes.cheakOutScreenRoute);
                      },
                          newbuttonColor:
                              bookNowBottomSheetController.currentTime == null
                                  ? greyButton
                                  : buttonColor,
                          color: bookNowBottomSheetController.currentTime == null
                              ? textColor
                              : regularWhite)),
                ],
              ).paddingSymmetric(horizontal: 16.h),
            ),
          ],
        ),
      ).paddingOnly(top:16.h),
    );
  }

  Widget timeList() {
    return GetBuilder<BookNowBottomSheetController>(
      init: BookNowBottomSheetController(),
      builder: (bookNowBottomSheetController) => Container(
        height: 360.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.h), color: Color(0XFFFCFCFC)),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.h),
          itemCount: bookNowBottomSheetController.time.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                bookNowBottomSheetController.setTime(index);
              },
              child: Container(
                  height: 40.h,
                  decoration: bookNowBottomSheetController.timeIndex == index
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(4.h),
                          color: greyButton)
                      : BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getCustomFont(time[index], 15.sp, greyTextColor, 1,
                          fontWeight: FontWeight.w600),
                    ],
                  ).paddingSymmetric(horizontal: 16.h)),
            );
          },
        ),
      ).paddingSymmetric(horizontal: 16.h),
    );
  }

  Widget select_date_time_button(name, title, color, icon, Function function) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.h), color: color),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSvgImage(icon),
          getHorSpace(12.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  getCustomFont(title, 12.sp, greyTextColor, 1,
                      fontWeight: FontWeight.w500, txtHeight: 1.h),
                ],
              ),
              getVerSpace(4.h),
              GestureDetector(
                  onTap: () {
                    function();
                  },
                  child: getCustomFont(
                      name, 15.sp, context.theme.primaryColor, 1,
                      fontWeight: FontWeight.w600, txtHeight: 1.6.h)),
            ],
          ),
          getVerSpace(16.h),
        ],
      ).paddingAll(16.h),
    ).paddingSymmetric(horizontal: 16.h);
  }
}
