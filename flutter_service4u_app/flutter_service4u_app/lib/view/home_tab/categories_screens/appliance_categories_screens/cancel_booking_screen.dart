import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:service_hub_app/models/cancel_order_reason_model.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import 'package:service_hub_app/view/booking_tab/histry_detail_screen.dart';
import '../../../../controller/controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/color_category.dart';

class CalcelBookingScreen extends StatefulWidget {
  @override
  State<CalcelBookingScreen> createState() => _CalcelBookingScreenState();
}

class _CalcelBookingScreenState extends State<CalcelBookingScreen> {
  HtmlEditorController controller = HtmlEditorController();
  CalcelBookingScreenController calcelBookingScreenController =
      Get.put(CalcelBookingScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<CalcelBookingScreenController>(
        init: CalcelBookingScreenController(),
        builder: (calcelBookingScreenController) => WillPopScope(
              onWillPop: () async {
                backclick();
                return false;
              },
              child: Scaffold(
                backgroundColor: context.theme.scaffoldBackgroundColor,
                body: SafeArea(
                    child: Column(
                  children: [
                    simple_app_bar(() {
                      backclick();
                    }),
                    getVerSpace(16.h),
                    Expanded(
                        child: ListView(
                      children: [
                        Container(
                          child: common_container(context.theme.focusColor,
                              child: Column(
                                children: [
                                  seeAll_button_formate(
                                      "Do you want to cancel Order?",
                                      context.theme.primaryColor,
                                      () {},
                                      "Timeline",
                                      "right_arrow_blue.svg",
                                      buttonWidth: 84.58.h,
                                      buttonTextColor: blue,
                                      buttonPermition: false),
                                  getVerSpace(11.h),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.h),
                                        color: context.theme.focusColor,
                                      ),
                                      child: reason_list()),
                                ],
                              ).paddingAll(16.h)),
                        ).paddingOnly(
                          left: 16.h,
                          right: 16.h,
                          bottom: 16.h,
                        ),
                        common_container(context.theme.focusColor,
                                child: Column(
                                  children: [
                                    seeAll_button_formate(
                                      "Others",
                                      context.theme.primaryColor,
                                      () {},
                                      "Recent",
                                      Get.isDarkMode
                                          ? "down_arrow_icon_white.svg"
                                          : "down_arrow_icon_blue.svg",
                                      fontsize: 18.sp,
                                      fontwidth: FontWeight.w600,
                                      buttonPermition: false,
                                    ).paddingAll(16.h),
                                    HtmlEditor(
                                      controller: controller, //required
                                      htmlEditorOptions: HtmlEditorOptions(
                                        hint: "Your text here...",
                                        initialText:
                                            "text content initial, if any",
                                      ),
                                      htmlToolbarOptions: HtmlToolbarOptions(),
                                      otherOptions: OtherOptions(
                                          height: 160.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.h),
                                              border: Border.all(
                                                  color: Color(0XFF9A9FA5)
                                                      .withOpacity(0.25),
                                                  width: 2.h))),
                                    ).paddingSymmetric(horizontal: 16.h),
                                  ],
                                ).paddingOnly(bottom: 20.h))
                            .paddingSymmetric(horizontal: 16.h)
                      ],
                    )),
                    Container(
                        color: regularWhite,
                        child: getCustomButton("Submit", () {
                          Constant.sendToNext(
                              context, Routes.orderCancelDialogueRoute);
                        }).paddingAll(16.h)),
                  ],
                )),
              ),
            ));
  }

  Widget reason_list() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: calcelBookingScreenController.reason.length,
      itemBuilder: (context, index) {
        CancelReason reason = calcelBookingScreenController.reason[index];
        return Container(
          height: 41.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.h),
              color: Color(0XFFF5F5F5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getCustomFont(
                reason.reason!,
                14.sp,
                Color(0XFF535763),
                1,
                fontWeight: FontWeight.w600,
              ),
            ],
          ).paddingSymmetric(horizontal: 12.h),
        ).paddingSymmetric(vertical: 5.h);
      },
    );
  }
}
