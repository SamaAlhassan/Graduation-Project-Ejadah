import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';
import '../routes/app_routes.dart';
import 'color_category.dart';
import 'constant.dart';
import 'constantWidget.dart';

class CheakOutScreenCommonWidget extends StatefulWidget {
  @override
  State<CheakOutScreenCommonWidget> createState() =>
      _CheakOutScreenCommonWidgetState();
}

class _CheakOutScreenCommonWidgetState
    extends State<CheakOutScreenCommonWidget> {
  CheakOutScreenController cheakOutScreenController =
      Get.put(CheakOutScreenController());
  //PromoCodeScreenController promoCodeScreenController =
   //   Get.put(PromoCodeScreenController());
  PhoneNumberScreenController phoneNumberScreenController =
      Get.put(PhoneNumberScreenController());
  SideDrawerController sideDrawerController = Get.put(SideDrawerController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return Column(
      children: [
        getVerSpace(24.h),
        address(),
        getVerSpace(24.h),
        phone_number(),
        getVerSpace(24.h),
//        promo_code(),
        getVerSpace(24.h),
        // Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(8.h),
        //     color: context.theme.focusColor,
        //   ),
        //   child: bill_detail(context.theme.primaryColor),
        // ).paddingSymmetric(
        //     horizontal: cheakOutScreenController.cheakOut ? 0.h : 0.h),
        getVerSpace(24.h),
        //pay_with()
      ],
    );
  }

  Widget address() {
    return GetBuilder<CheakOutScreenController>(
      init: CheakOutScreenController(),
      builder: (cheakOutScreenController) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.h),
                color: context.theme.focusColor,
              ),
              child: GetBuilder<SideDrawerController>(
                init: SideDrawerController(),
                builder: (sideDrawerController) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCustomFont("Address", 16.sp, regularBlack, 1,
                            fontWeight: FontWeight.w500),
                        sideDrawerController.selectAddressIndex == null
                            ? add_button("Add", "add_icon_black.svg", () {
                                sideDrawerController.addAddessScreen(true);
                                Constant.sendToNext(
                                    context, Routes.sideMenuAddressScreenRoute);
                              })
                            : SizedBox()
                      ],
                    ),
                    sideDrawerController.selectAddressIndex != null
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.h),
                                border: Border.all(color: grey20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                address_formate(
                                    sideDrawerController
                                        .addressData[sideDrawerController
                                            .selectAddressIndex!]
                                        .icon,
                                    sideDrawerController
                                        .addressData[sideDrawerController
                                            .selectAddressIndex!]
                                        .addressType,
                                    sideDrawerController
                                        .addressData[sideDrawerController
                                            .selectAddressIndex!]
                                        .address,
                                    () {},
                                    textContainerWidth: 176.h),
                                add_button("Change", "edit_icon.svg", () {
                                  Constant.sendToNext(context,
                                      Routes.sideMenuAddressScreenRoute);
                                })
                              ],
                            ).paddingSymmetric(horizontal: 16.h),
                          ).paddingOnly(top: 8.h)
                        : SizedBox(),
                  ],
                ),
              ))
          .paddingSymmetric(
              horizontal: cheakOutScreenController.cheakOut ? 0.h : 20.h),
    );
  }

  Widget phone_number() {
    return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.h),
              color: context.theme.focusColor,
            ),
            child: GetBuilder<PhoneNumberScreenController>(
              init: PhoneNumberScreenController(),
              builder: (phoneNumberScreenController) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getCustomFont("Phone number", 16.sp, regularBlack, 1,
                          fontWeight: FontWeight.w500),
                      phoneNumberScreenController.selectNumberIndex == null
                          ? add_button("Add", "add_icon_black.svg", () {
                              Constant.sendToNext(
                                  context, Routes.phoneNumberScreenRoute);
                            })
                          : SizedBox()
                    ],
                  ),
                  phoneNumberScreenController.selectNumberIndex != null
                      ? Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.h),
                              border: Border.all(color: grey20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              phone_number_formate(
                                  phoneNumberScreenController
                                      .phone[phoneNumberScreenController
                                          .selectNumberIndex!]
                                      .userImage,
                                  phoneNumberScreenController
                                      .phone[phoneNumberScreenController
                                          .selectNumberIndex!]
                                      .phoneNumber,
                                  phoneNumberScreenController
                                      .phone[phoneNumberScreenController
                                          .selectNumberIndex!]
                                      .category,
                                  () {},
                                  nuberContainerWidth: 109.h),
                              add_button("Change", "edit_icon.svg", () {
                                Constant.sendToNext(
                                    context, Routes.phoneNumberScreenRoute);
                              })
                            ],
                          ).paddingSymmetric(horizontal: 16.h),
                        ).paddingOnly(top: 8.h)
                      : SizedBox(),
                ],
              ),
            ))
        .paddingSymmetric(
            horizontal: cheakOutScreenController.cheakOut ? 0.h : 20.h);
  }

  Widget pay_with() {
    return GetBuilder<SideMenuPaymentMenuScreenController>(
      init: SideMenuPaymentMenuScreenController(),
      builder: (sideMenuPaymentMenuScreenController) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h),
            color: context.theme.focusColor,
          ),
          child: GetBuilder<PayMentScreenController>(
              init: PayMentScreenController(),
              builder: (payMentScreenController) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getCustomFont("Pay with", 16.sp, regularBlack, 1,
                              fontWeight: FontWeight.w500),
                          payMentScreenController.selectPaymentIndex == null
                              ? add_button("Add", "add_icon_black.svg", () {
                                  sideMenuPaymentMenuScreenController
                                      .setPaymentScreen(true);
                                  Constant.sendToNext(
                                      context, Routes.payMentScreenRoute);
                                })
                              : SizedBox()
                        ],
                      ),
                      payMentScreenController.selectPaymentIndex != null
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.h),
                                  border: Border.all(color: grey20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  card_formate(
                                          payMentScreenController
                                              .card[payMentScreenController
                                                  .selectPaymentIndex!]
                                              .bgColor,
                                          payMentScreenController
                                              .card[payMentScreenController
                                                  .selectPaymentIndex!]
                                              .icon,
                                          payMentScreenController
                                              .card[payMentScreenController
                                                  .selectPaymentIndex!]
                                              .title,
                                          payMentScreenController
                                              .card[payMentScreenController
                                                  .selectPaymentIndex!]
                                              .expiry,
                                          () {})
                                      .paddingOnly(top: 8.h),
                                  add_button("Change", "edit_icon.svg", () {
                                    sideMenuPaymentMenuScreenController
                                        .setPaymentScreen(true);
                                    Constant.sendToNext(
                                        context, Routes.payMentScreenRoute);
                                  })
                                ],
                              ).paddingOnly(right: 16.h),
                            ).paddingOnly(top: 8.h)
                          : SizedBox()
                    ],
                  ))).paddingSymmetric(
          horizontal: cheakOutScreenController.cheakOut ? 0.h : 16.h),
    );
  }
/*
  Widget promo_code() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.h),
          color: context.theme.focusColor,
        ),
       child: GetBuilder<PromoCodeScreenController>(
            init: PromoCodeScreenController(),
          builder: (promoCodeScreenController) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCustomFont("Promo code", 16.sp, regularBlack, 1,
                            fontWeight: FontWeight.w500),
                        promoCodeScreenController.selectPromoCodeIndex == null
                            ? add_button("Add", "add_icon_black.svg", () {
                                Constant.sendToNext(
                                    context, Routes.promoCodeScreenRoute);
                              })
                            : SizedBox()
                      ],
                    ),
                    promoCodeScreenController.selectPromoCodeIndex != null
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.h),
                                border: Border.all(color: grey20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                promo_code_formate(
                                    promoCodeScreenController
                                        .promocode[promoCodeScreenController
                                            .selectPromoCodeIndex!]
                                        .code,
                                    promoCodeScreenController
                                        .promocode[promoCodeScreenController
                                            .selectPromoCodeIndex!]
                                        .discription,
                                    () {}),
                                GestureDetector(
                                    onTap: () {
                                      promoCodeScreenController
                                          .removePromoCode();
                                    },
                                    child: getSvgImage("close_icon.svg",
                                        color: regularBlack))
                              ],
                            ).paddingAll(16.h),
                          ).paddingOnly(top: 8.h)
                        : SizedBox()
                  ],
                ))).paddingSymmetric(horizontal: 20.h); */
  }
//}
