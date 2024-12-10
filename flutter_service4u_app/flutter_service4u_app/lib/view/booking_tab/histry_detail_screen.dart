import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../utils/color_category.dart';
import '../../utils/constant.dart';
import '../../utils/constantWidget.dart';

class HistryDetailScreen extends StatefulWidget {
  @override
  State<HistryDetailScreen> createState() => _HistryDetailScreenState();
}

backclick() {
  Constant.backToFinish();
}

class _HistryDetailScreenState extends State<HistryDetailScreen> {
  HistryDetailScreenController histryDetailScreenController =
      Get.put(HistryDetailScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<HistryDetailScreenController>(
      init: HistryDetailScreenController(),
      builder: (histryDetailScreenController) => WillPopScope(
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
                getAppBar(() {
                  backclick();
                }),
                getVerSpace(16.h),
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        common_container(
                          context.theme.focusColor,
                          child: Row(
                            children: [
                              seeAll_button_formate("Reference :",
                                  context.theme.primaryColor, () {}, "", "",
                                  buttonPermition: false),
                              getHorSpace(10.h),
                              getCustomFont(
                                  "#D-571224", 16.sp, Color(0XFFFC944D), 1,
                                  fontWeight: FontWeight.w700)
                            ],
                          ).paddingAll(16.h),
                        ),
                        getVerSpace(10.h),
                        common_container(
                          context.theme.focusColor,
                          child: Column(
                            children: [
                              seeAll_button_formate(
                                  "Services Provider",
                                  context.theme.primaryColor,
                                  () {},
                                  "Timeline",
                                  "right_arrow_blue.svg",
                                  buttonWidth: 84.58.h,
                                  buttonTextColor: blue),
                              getVerSpace(10.h),
                              Row(
                                children: [
                                  Container(
                                    height: 55.h,
                                    width: 55.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color(0XFFC4C4C4)
                                                .withOpacity(0.30))),
                                    child: getSvgImage("westing_house_icon.svg")
                                        .paddingSymmetric(
                                            horizontal: 13.44.h,
                                            vertical: 10.21.h),
                                  ),
                                  getHorSpace(10.h),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getCustomFont("Westinghouse", 16.sp,
                                          context.theme.primaryColor, 1,
                                          fontWeight: FontWeight.w600),
                                      getVerSpace(4.h),
                                      getCustomFont("Air Conditioning", 12.sp,
                                          greyTextColor, 1,
                                          fontWeight: FontWeight.w500),
                                      getVerSpace(12.h),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ).paddingAll(16.h),
                        ),
                        getVerSpace(10.h),
                        common_container(
                          context.theme.focusColor,
                          child: selected_service(
                                  "ac_repair_icon.svg",
                                  "AC Installation (Both Unit)",
                                  context.theme.primaryColor,
                                  "1 Ton-1.5 Ton x2")
                              .paddingAll(16.h),
                        ),
                        getVerSpace(10.h),
                        detail_formet("Address", () {}),
                        getVerSpace(10.h),
                        detail_formet("Date and Time", () {}),
                        getVerSpace(10.h),
                        detail_formet("Phone number", () {}),
                        getVerSpace(10.h),
                        detail_formet("Promo Code", () {}),
                        getVerSpace(10.h),
                        detail_formet("Invoce Bill", () {}),
                        getVerSpace(10.h),
                        detail_formet("Instructions", () {}),
                        getVerSpace(10.h),
                        common_container(context.theme.focusColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                seeAll_button_formate("Payment Status",
                                    context.theme.primaryColor, () {}, "", "",
                                    fontsize: 18.sp,
                                    fontwidth: FontWeight.w600,
                                    buttonPermition: false),
                                getVerSpace(14.h),
                                Container(
                                  height: 41.h,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: greyButton))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      getCustomFont("Payment Status", 14.sp,
                                          Color(0XFF33383F), 1,
                                          fontWeight: FontWeight.w600),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.h),
                                            color: Color(0XFF8BE275)
                                                .withOpacity(0.24)),
                                        child: getCustomFont("Paid", 14.sp,
                                                Color(0XFF8CDC78), 1,
                                                fontWeight: FontWeight.w700)
                                            .paddingSymmetric(
                                                horizontal: 10.h,
                                                vertical: 2.h),
                                      ),
                                    ],
                                  ).paddingOnly(bottom: 14.h),
                                ),
                                getVerSpace(14.h),
                                getCustomFont("Payment Method", 14.sp,
                                    Color(0XFF33383F), 1,
                                    fontWeight: FontWeight.w600),
                                getVerSpace(12.h),
                                // GetBuilder<PayMentScreenController>(
                                //     init: PayMentScreenController(),
                                //     builder: (payMentScreenController) => payMentScreenController.selectPayment!=null?card_formate(
                                //         payMentScreenController.selectPayment!.icon,
                                //         payMentScreenController.selectPayment!.bgColor,
                                //         payMentScreenController.selectPayment!.title,
                                //         payMentScreenController.selectPayment!.expiry):SizedBox())
                              ],
                            ).paddingAll(16.h))
                      ],
                    )
                  ],
                )),
                common_container(
                  context.theme.focusColor,
                  child: getCustomButton(
                    "Re-Order",
                    () {},
                  ).paddingAll(16.h),
                )
              ],
            )),
          )),
    );
  }

  Widget card_formate(icon, color, title, expiry) {
    return GetBuilder<CheakOutScreenController>(
        init: CheakOutScreenController(),
        builder: (cheakOutScreenController) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 56.h,
                      width: 56.h,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: color),
                      child: getSvgImage(icon).paddingSymmetric(
                          horizontal: 8.72.h, vertical: 15.08.h),
                    ),
                    getHorSpace(16.sp),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont(
                            title, 16.sp, context.theme.primaryColor, 1,
                            fontWeight: FontWeight.w700),
                        getVerSpace(4.h),
                        getCustomFont(
                            "Exp ${expiry}", 13.sp, Color(0XFF888C97), 1,
                            fontWeight: FontWeight.w500),
                      ],
                    )
                  ],
                ),
              ],
            ));
  }

  Widget detail_formet(title, Function function) {
    return common_container(context.theme.focusColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            seeAll_button_formate(
                title, context.theme.primaryColor, () {}, "", "",
                fontsize: 18.sp,
                fontwidth: FontWeight.w600,
                buttonPermition: false),
            Container(
                height: 36.h,
                width: 36.h,
                child: GestureDetector(
                    onTap: () {
                      function();
                    },
                    child: getSvgImage("down_arrow_icon_blue.svg")
                        .paddingAll(8.h)))
          ],
        ).paddingSymmetric(horizontal: 16.h, vertical: 16.h));
  }
}
