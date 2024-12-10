import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/models/added_card_data_maodel.dart';
import '../../../../controller/controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/color_category.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/constantWidget.dart';

class PayMentScreen extends StatefulWidget {
  @override
  State<PayMentScreen> createState() => _PayMentScreenState();
}

backclick() {
  Constant.backToFinish();
}

class _PayMentScreenState extends State<PayMentScreen> {
  PayMentScreenController payMentScreenController =
      Get.put(PayMentScreenController());
  SideMenuPaymentMenuScreenController sideMenuPaymentMenuScreenController =
      Get.put(SideMenuPaymentMenuScreenController());

  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);

    return GetBuilder<PayMentScreenController>(
      init: PayMentScreenController(),
      builder: (payMentScreenController) => WillPopScope(
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
                  getVerSpace(24.h),
                  getCustomAppBar("Payment", () {
                    backclick();
                  }).paddingSymmetric(horizontal: 20.h),
                  getVerSpace(32.h),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.h),
                        border: Border.all(color: grey20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont(
                                "Added Card List", 16.sp, regularBlack, 1,
                                fontWeight: FontWeight.w500),
                            add_button(
                                payMentScreenController.card.length == 0
                                    ? "Add"
                                    : "Change",
                                payMentScreenController.card.length == 0
                                    ? "add_icon_black.svg"
                                    : "edit_icon.svg", () {
                              // Constant.sendToNext(
                              //     context, Routes.phoneNumberScreenRoute);
                            })
                          ],
                        ).paddingSymmetric(horizontal: 16.h),
                        card_formet()
                      ],
                    ).paddingOnly(top: 16.h),
                  ).paddingSymmetric(horizontal: 20.h),
                  getVerSpace(24.h),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.h),
                        border: Border.all(color: grey20)),
                    child: Column(
                      children: [
                        getVerSpace(16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont("Your Credit", 16.sp, regularBlack, 1,
                                fontWeight: FontWeight.w500),
                            add_button("Apply", "edit_icon.svg", () {})
                          ],
                        ).paddingSymmetric(horizontal: 16.h),
                        Row(
                          children: [
                            Container(
                              height: 50.h,
                              width: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.h),
                                  color: Color(0XFFFFE9D1)),
                              child: getSvgImage("credit_icon.svg")
                                  .paddingAll(13.h),
                            ),
                            getHorSpace(16.sp),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomFont(
                                    "USD \$300", 14.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w700),
                                getVerSpace(4.h),
                                getCustomFont("Exp 04/2023", 14.sp, grey40, 1,
                                    fontWeight: FontWeight.w400),
                              ],
                            )
                          ],
                        ).paddingSymmetric(horizontal: 16.h),
                        getVerSpace(16.h),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 20.h),
                  getVerSpace(32.h),
                  sideMenuPaymentMenuScreenController.showPaymentMethod
                      ? GestureDetector(
                          onTap: () {
                            Constant.sendToNext(
                                context, Routes.addNewCardScreenRoute);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.h),
                                color: grey10),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  getCustomFont(
                                      "Add Card", 13.sp, regularBlack, 1,
                                      fontWeight: FontWeight.w400),
                                  getSvgImage("add_icon_black.svg")
                                ],
                              ).paddingOnly(top: 8.h, bottom: 8.h),
                            ),
                          ).paddingSymmetric(horizontal: 143.h),
                        )
                      : SizedBox()
                ],
              ),
            ),
          )),
    );
  }

  Widget card_formet() {
    return GetBuilder<SideMenuPaymentMenuScreenController>(
      init: SideMenuPaymentMenuScreenController(),
      builder: (sideMenuPaymentMenuScreenController) =>
          GetBuilder<PayMentScreenController>(
              init: PayMentScreenController(),
              builder: (payMentScreenController) => ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: payMentScreenController.card.length,
                  itemBuilder: (context, index) {
                    PaymentCard payment = payMentScreenController.card[index];
                    return card_formate(
                        payment.bgColor,
                        payment.icon,
                        payment.title,
                        payment.expiry,
                        sideMenuPaymentMenuScreenController.showPaymentMethod
                            ? () {
                                payMentScreenController.setID(payment.id);
                                payMentScreenController.setPaymentIndex(index);
                              }
                            : () {},
                        radioButtonpermition:
                            sideMenuPaymentMenuScreenController
                                    .showPaymentMethod
                                ? true
                                : false,
                        radioWidget: getSvgImage(
                            payMentScreenController.paymentId == payment.id
                                ? "select_radio_icon.svg"
                                : "unselect_radio_icon.svg"));
                  })),
    );
  }
}
