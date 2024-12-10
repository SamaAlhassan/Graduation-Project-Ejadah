
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/cheak_out_screen_common_widget.dart';
import '../../../../utils/color_category.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/constantWidget.dart';

class PlaceOrderScreen extends StatefulWidget {


  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

backclick() {
  Constant.backToFinish();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  PlaceOrderScreenController placeOrderScreenController =
      Get.put(PlaceOrderScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<CheakOutScreenController>(
      init: CheakOutScreenController(),
      builder: (cheakOutScreenController) => WillPopScope(
        onWillPop: () async {
          cheakOutScreenController.setChkoutScreenPosition(false);
          backclick();
          return false;
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: SafeArea(
              child: Column(
            children: [
              simple_app_bar(() {
                cheakOutScreenController.setChkoutScreenPosition(false);
                backclick();
              }),
              getVerSpace(16.h),
              Expanded(
                  child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  getVerSpace(16.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      color: context.theme.focusColor,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          color: Color(0XFFC2ECD5)),
                      child: Column(
                        children: [
                          Container(
                            height: 40.96.h,
                            width: 40.96.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFF93DCB4)),
                            child: getSvgImage("placed_order_true_icon.svg")
                                .paddingSymmetric(
                                    horizontal: 10.73.h, vertical: 13.2.h),
                          ),
                          getVerSpace(16.h),
                          getCustomFont("Your order has been Placed", 16.sp,
                              context.theme.primaryColor, 1,
                              fontWeight: FontWeight.w600),
                          getVerSpace(3.h),
                          getCustomFont("Reference Code: #D-571224", 13.sp,
                              Color(0XFF29303C), 1,
                              fontWeight: FontWeight.w500),
                          getVerSpace(17.h),
                          Container(
                            width: 131.h,
                            height: 25.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.h),
                                color: Color(0XFFAADFC2)),
                            child: Container(
                              height: 17.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  getSvgImage("date_icon.svg"),
                                  getHorSpace(5.h),
                                  getCustomFont("Add to Calendar", 12.sp,
                                      context.theme.primaryColor, 1,
                                      fontWeight: FontWeight.w500)
                                ],
                              ).paddingAll(4.h),
                            ),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 47.h, vertical: 24.h),
                    ).paddingAll(16.h),
                  ).paddingSymmetric(horizontal: 16.h),
                  getVerSpace(10.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      color: context.theme.focusColor,
                    ),
                    child: selected_service(
                            "ac_repair_icon.svg",
                            "AC Installation (Both Unit)",
                            context.theme.primaryColor,
                            "1 Ton-1.5 Ton x2")
                        .paddingAll(16.h),
                  ).paddingSymmetric(horizontal: 16.h),
                  getVerSpace(10.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      color: context.theme.focusColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        seeAll_button_formate(
                            "Order status",
                            context.theme.primaryColor,
                            () {},
                            "Track Order",
                            "location_icon.svg",
                            buttonWidth: 112.h,
                            buttonTextColor: blue),
                        getVerSpace(18.h),
                        Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0XFFB5E4CA)),
                              child: getSvgImage("placed_order_true_icon.svg")
                                  .paddingSymmetric(
                                      horizontal: 5.24.h, vertical: 6.48.h),
                            ),
                            getHorSpace(13.h),
                            getCustomFont("Order Has been place to", 14.sp,
                                Color(0XFF434355), 1,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                        getVerSpace(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 55.h,
                              width: 55.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color:
                                          Color(0XFFC4C4C4).withOpacity(0.30))),
                              child: getSvgImage("westing_house_icon.svg")
                                  .paddingSymmetric(
                                      horizontal: 13.44.h, vertical: 10.21.h),
                            ),
                            getHorSpace(10.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomFont("Westinghouse", 16.sp,
                                    context.theme.primaryColor, 1,
                                    fontWeight: FontWeight.w600),
                                getVerSpace(4.h),
                                getCustomFont(
                                    "Service Provider", 12.sp, greyTextColor, 1,
                                    fontWeight: FontWeight.w500),
                                getVerSpace(12.h),
                                Row(
                                  children: [
                                    getCustomButton("Massage", () {},
                                        color: greyButtonText,
                                        buttonwidth: 101.h,
                                        decoration: BoxDecoration(
                                            color: greyButton,
                                            borderRadius:
                                                BorderRadius.circular(10.h))),
                                    getHorSpace(10.h),
                                    getCustomButton("Call", () {},
                                        buttonwidth: 66.h)
                                  ],
                                )
                              ],
                            )
                          ],
                        ).paddingOnly(left: 40.h),
                        getVerSpace(16.h),
                        Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0XFFB5E4CA)),
                              child: getSvgImage("placed_order_true_icon.svg")
                                  .paddingSymmetric(
                                      horizontal: 5.24.h, vertical: 6.48.h),
                            ),
                            getHorSpace(13.h),
                            getCustomFont("Order Has been Confirmed", 14.sp,
                                Color(0XFF434355), 1,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                        getVerSpace(16.h),
                        Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0XFFB5E4CA)),
                              child: getSvgImage("placed_order_true_icon.svg")
                                  .paddingSymmetric(
                                      horizontal: 5.24.h, vertical: 6.48.h),
                            ),
                            getHorSpace(13.h),
                            getCustomFont("Expert has been assigned to", 14.sp,
                                Color(0XFF434355), 1,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                        getVerSpace(16.h),
                        Row(
                          children: [
                            Container(
                              height: 55.h,
                              width: 55.h,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: getAssetImage("order_user.png"),
                            ),
                            getHorSpace(15.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomFont("Ashfak Sayem", 16.sp,
                                    context.theme.primaryColor, 1,
                                    fontWeight: FontWeight.w600),
                                getVerSpace(4.h),
                                getCustomFont(
                                    "Service Expert", 12.sp, greyTextColor, 1,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                          ],
                        ).paddingOnly(left: 40.h),
                        getVerSpace(16.h),
                        Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0XFFB5E4CA)),
                              child: getSvgImage("placed_order_true_icon.svg")
                                  .paddingSymmetric(
                                      horizontal: 5.24.h, vertical: 6.48.h),
                            ),
                            getHorSpace(13.h),
                            getCustomFont("Expert has been assigned to", 14.sp,
                                Color(0XFF434355), 1,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                        getVerSpace(16.h),
                        CheakOutScreenCommonWidget()
                      ],
                    ).paddingAll(16.h),
                  ).paddingSymmetric(horizontal: 16.h),
                ],
              )),
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
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    bill_detail(context.theme.primaryColor,
                                        titleText: "Bill Details",
                                        buttonpermition: true),
                                    getVerSpace(16.h),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: getCustomButton(
                                                "Order Details", () {
                                          Constant.sendToNext(context,
                                              Routes.orderDetailScreenRoute);
                                        },
                                                color:
                                                    context.theme.primaryColor,
                                                buttonheight: 48.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.h),
                                                    border: Border.all(
                                                        color: greyButton,
                                                        width: 2.h),
                                                    color: Color(0XFFFCFCFC)))),
                                        getHorSpace(8.h),
                                        Expanded(
                                            child: getCustomButton(
                                                "Pay now", () {},
                                                buttonheight: 48.h)),
                                      ],
                                    ),
                                  ],
                                ).paddingSymmetric(
                                    horizontal: 32.h, vertical: 16.h);
                              },
                            );
                          },
                          child: Row(
                            children: [
                              getCustomFont(
                                  "Bill Details", 14.sp, Color(0XFFFC944D), 1,
                                  fontWeight: FontWeight.w500),
                              getHorSpace(7.h),
                              getSvgImage("up_arrow_icon.svg")
                            ],
                          ),
                        )
                      ],
                    ),
                    getVerSpace(20.h),
                    Row(
                      children: [
                        Expanded(
                            child: getCustomButton("Cancel Booking", () {
                          Constant.sendToNext(
                              context, Routes.calcelBookingScreenRoute);
                        },
                                color: context.theme.primaryColor,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.h),
                                    border: Border.all(
                                        color: greyButton, width: 2.h),
                                    color: Color(0XFFFCFCFC)))),
                        getHorSpace(8.h),
                        Expanded(child: getCustomButton("Pay now", () {
                          Constant.sendToNext(context, Routes.orderConfirmDialogueRoute);
                        })),
                      ],
                    ),
                    getVerSpace(16.h),
                  ],
                ).paddingSymmetric(horizontal: 16.h),
              )
            ],
          )),
        ),
      ),
    );
  }
}
