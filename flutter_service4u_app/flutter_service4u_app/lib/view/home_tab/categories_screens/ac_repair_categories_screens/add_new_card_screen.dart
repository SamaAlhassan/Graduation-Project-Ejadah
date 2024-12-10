import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../../../../controller/controller.dart';
import '../../../../utils/color_category.dart';

class AddNewCardScreen extends StatefulWidget {
  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

backClick() {
  Constant.backToFinish();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  AddNewCardScreenController addNewCardScreenController =
      Get.put(AddNewCardScreenController());
  TextEditingController cardMonthYearController = TextEditingController();
  TextEditingController cardCVVController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<AddNewCardScreenController>(
      init: AddNewCardScreenController(),
      builder: (addNewCardScreenController) => WillPopScope(
          onWillPop: () async {
            backClick();
            return false;
          },
          child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    getVerSpace(24.h),
                    getCustomAppBar("Add Card", () {
                      backClick();
                    }),
                    getVerSpace(38.h),
                    getCustomFont("Add New Card", 16.sp, regularBlack, 1,
                        fontWeight: FontWeight.w500),
                    getVerSpace(26.h),
                    getTextField("Card Number", "card_icon.svg"),
                    getVerSpace(24.h),
                    Row(
                      children: [
                        Expanded(
                            child: getSimpleTextField(
                                "MM/YY", cardMonthYearController)),
                        getHorSpace(24.h),
                        Expanded(
                            child:
                                getSimpleTextField("CVV", cardCVVController)),
                      ],
                    ),
                    getVerSpace(24.h),
                    GestureDetector(
                      onTap: () {
                        addNewCardScreenController.setCardSaveCheakButton();
                      },
                      child: Row(
                        children: [
                          getSvgImage(addNewCardScreenController.cardsave
                              ? "select_cheak_button.svg"
                              : "unselect_cheak_button.svg"),
                          getHorSpace(10.h),
                          getCustomFont("Save Card", 16.sp, regularBlack, 1,
                              fontWeight: FontWeight.w400)
                        ],
                      ),
                    ),
                  ],
                )),
                getCustomButton(
                        "Add Card",
                        newbuttonColor: (cardMonthYearController.text.isEmpty ||
                                cardCVVController.text.isEmpty ||
                                addNewCardScreenController.cardsave == false)
                            ? grey20
                            : buttonColor,
                        () {})
                    .paddingOnly(bottom: 30.h)
                // Row(
                //   children: [
                //     Expanded(child: getTextField("hint", "")),
                //     Expanded(child: getTextField("hint", ""))
                //   ],
                // )
              ],
            ).paddingSymmetric(horizontal: 20.h)),
          )),
    );
  }

  @override
  void dispose() {
    cardCVVController.dispose();
    cardMonthYearController.dispose();
    super.dispose();
  }
}
