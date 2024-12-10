import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/models/booking_upcoming_data_model.dart';
import '../../controller/controller.dart';
import '../../utils/color_category.dart';
import '../../utils/constantWidget.dart';

class UpcomingPage extends StatefulWidget {
  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  UpcomingPageController upcomingPageController =
      Get.put(UpcomingPageController());

  //
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpcomingPageController>(
        init: UpcomingPageController(),
        builder: (upcomingPageController) => upcomingPageController
                    .bookingData.length ==
                0
            ? booking_empty_formate(
                "booking_upcoming_icon.svg",
                "No Upcoming Order",
                context.theme.primaryColor,
                "Currently you don’t have any upcoming order. Place and track your orders from here.",
                Color(0XFF535763),
                () {})
            : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                primary: true,
                shrinkWrap: false,
                physics: BouncingScrollPhysics(),
                itemCount: upcomingPageController.bookingData.length,
                itemBuilder: (context, index) {
                  Booking upcoming = upcomingPageController.bookingData[index];
                  return upcoming.status!.toLowerCase() == "complete"
                      ? SizedBox()
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.h),
                              border: Border.all(color: grey20)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 60.h,
                                      width: 60.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.h),
                                          color: grey10),
                                      child: getAssetImage(upcoming.icon!)
                                          .paddingAll(8.h)),
                                  getHorSpace(16.h),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getCustomFont(upcoming.title!, 16.sp,
                                          context.theme.primaryColor, 1,
                                          fontWeight: FontWeight.w600),
                                      getVerSpace(6.h),
                                      getCustomFont(
                                          "Reference Code: ${upcoming.referenceCode}",
                                          14.sp,
                                          grey40,
                                          1,
                                          fontWeight: FontWeight.w500)
                                    ],
                                  ),
                                  getVerSpace(10.h),
                                ],
                              ),
                              getVerSpace(12.h),
                              Divider(
                                color: greyButton,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    getVerSpace(2.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        getCustomFont(
                                            "Status", 14.sp, greyTextColor, 1,
                                            fontWeight: FontWeight.w500),
                                        if (upcoming.status?.toLowerCase() ==
                                            'confirmed') ...[
                                          confirm_pending_button(
                                              upcoming.status!,
                                              confermButtonBgColor,
                                              confermButtonTextColor)
                                        ],
                                        if (upcoming.status?.toLowerCase() ==
                                            'pending') ...[
                                          confirm_pending_button(
                                              upcoming.status!,
                                              pendingButtonBgColor,
                                              pendingButtonTextColor)
                                        ]
                                      ],
                                    ),
                                    getVerSpace(10.h),
                                    Row(
                                      children: [
                                        Container(
                                          height: 40.h,
                                          width: 40.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Color(0XFFC4C4C4)
                                                      .withOpacity(0.30))),
                                          child: getSvgImage("date_icon.svg",
                                                  color: greyTextColor)
                                              .paddingAll(9.h),
                                        ),
                                        getHorSpace(10.h),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            getCustomFont(
                                                "${upcoming.scheduleTime!}, ${upcoming.scheduleDate}",
                                                14.sp,
                                                context.theme.primaryColor,
                                                1,
                                                fontWeight: FontWeight.w600),
                                            getVerSpace(6.h),
                                            getCustomFont("Schedule", 12.sp,
                                                greyTextColor, 1,
                                                fontWeight: FontWeight.w500),
                                          ],
                                        )
                                      ],
                                    ),
                                    getVerSpace(10.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 40.h,
                                              width: 40.h,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Color(0XFFC4C4C4)
                                                          .withOpacity(0.30))),
                                              child: getSvgImage(upcoming
                                                      .serviceOroviderIcon!)
                                                  .paddingSymmetric(
                                                      horizontal: 9.43.h,
                                                      vertical: 7.22.h),
                                            ),
                                            getHorSpace(10.h),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                getCustomFont(
                                                    upcoming
                                                        .serviceOroviderTitle!,
                                                    14.sp,
                                                    context.theme.primaryColor,
                                                    1,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                getVerSpace(6.h),
                                                getCustomFont(
                                                   upcoming.providerName!,
                                                    12.sp,
                                                    greyTextColor,
                                                    1,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ],
                                            )
                                          ],
                                        ),
                                        Container(
                                          // height: 44.h,
                                          // width: 81.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.h),
                                              color: buttonColor),
                                          child: Row(
                                            children: [
                                              getSvgImage(
                                                  "call_icon_border.svg"),
                                              getHorSpace(8.h),
                                              getCustomFont("Call", 14.sp,
                                                  Color(0XFFFCFCFC), 1,
                                                  fontWeight: FontWeight.w600)
                                            ],
                                          ).paddingSymmetric(
                                              horizontal: 11.5.h,vertical: 8.h),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ).paddingAll(16.h),
                        ).paddingSymmetric(vertical: 10.h);
                },
              ));
    //   ListView(children: [
    //   Text("data"),
    // ],);
  }

  Widget confirm_pending_button(status, buttonbgColor, buttonTextColor) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.h), color: buttonbgColor),
      child: getCustomFont(status, 14.sp, buttonTextColor, 1,
              fontWeight: FontWeight.w600)
          .paddingSymmetric(horizontal: 8.h),
    );
  }
}
