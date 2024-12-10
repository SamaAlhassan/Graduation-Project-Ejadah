import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import 'package:service_hub_app/view/home_tab/categories_screens/ac_repair_categories_screens/service_book_now_bottom_sheet.dart';
import '../../../../controller/controller.dart';
import '../../../../utils/constant.dart';

class AcRepairServiceDetailScreen extends StatefulWidget {
  @override
  State<AcRepairServiceDetailScreen> createState() =>
      _AcRepairServiceDetailScreenState();
}

backclick() {
  Constant.backToFinish();
}

class _AcRepairServiceDetailScreenState
    extends State<AcRepairServiceDetailScreen> {
  AcRepairServiceDetailScreenController acRepairServiceDetailScreenController =
      Get.put(AcRepairServiceDetailScreenController());

  @override
  Widget build(BuildContext context) {
    // Get the selected service from the arguments passed from the previous screen
    final arguments = Get.arguments;
    final String title = arguments['title'];
    final String price = arguments['price'];
    final String rating = arguments['rating'];

    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () async {
        backclick();
        return false;
      },
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 215.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.h),
                      image: DecorationImage(
                          image:
                              AssetImage(Constant.assetImagePath + "image.png"),
                          fit: BoxFit.fill)),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getVerSpace(24.h),
                        GestureDetector(
                            onTap: () {
                              backclick();
                            },
                            child: getSvgImage("arrow_left_white.svg")),
                      ],
                    ).paddingSymmetric(horizontal: 20.h),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.h),
                      color: regularWhite,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 22,
                            color: regularBlack.withOpacity(0.07))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      getCustomFont("${title}", 20.sp, regularBlack, 1,
                          fontWeight: FontWeight.w700),
                      getVerSpace(4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getCustomFont("\$${price}", 16.sp, regularBlack, 1,
                              fontWeight: FontWeight.w400),
                          Row(
                            children: [
                              getSvgImage("star_icon.svg",
                                  height: 16.h, width: 16.h),
                              getHorSpace(2.h),
                              getCustomFont("${rating}", 14.sp, regularBlack, 1,
                                  fontWeight: FontWeight.w400),
                            ],
                          )
                        ],
                      ),
                    ],
                  ).paddingAll(16.h),
                ).paddingOnly(top: 200.h, right: 20.h, left: 20.h)
              ],
            ),
            getVerSpace(24.h),
            Expanded(
                child: ListView(
              children: [
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCustomFont("Type Of Property", 16.sp, regularBlack, 1,
                        fontWeight: FontWeight.w500),
                    getVerSpace(16.h),
                    Row(
                      children: [
                        types_of_property_formate("store_icon.svg", "Store", 1),
                        getHorSpace(20.h),
                        types_of_property_formate(
                            "office_unselect_icon.svg", "Office", 2),
                        getHorSpace(20.h),
                        types_of_property_formate(
                            "vila_unselected_icon.svg", "Villa", 3),
                      ],
                    )
                  ],
                )).paddingSymmetric(horizontal: 20.h),
                getVerSpace(24.h),
                GetBuilder<AcRepairServiceDetailScreenController>(
                  init: AcRepairServiceDetailScreenController(),
                  builder: (acRepairServiceDetailScreenController) => Row(
                    children: [
                      units_badrooms_formate(
                          "Units",
                          acRepairServiceDetailScreenController.units
                              .toString(), () {
                        acRepairServiceDetailScreenController.removeUnit();
                      }, () {
                        acRepairServiceDetailScreenController.addUnits();
                      }),
                      getHorSpace(20.h),
                    ],
                  ).paddingSymmetric(horizontal: 20.h),
                ),
                getVerSpace(26.h),
                getCustomFont("Description", 16.sp, regularBlack, 1,
                        fontWeight: FontWeight.w500)
                    .paddingSymmetric(horizontal: 20.h),
                getVerSpace(14.h),
                Container(
                        width: 374.h,
                        child: getMultilineCustomFont(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          14.sp,
                          regularBlack,
                          fontWeight: FontWeight.w400,
                        ).paddingOnly(right: 20.h))
                    .paddingSymmetric(horizontal: 20.h)
              ],
            )),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.h),
                    topRight: Radius.circular(16.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(2, -6),
                        blurRadius: 22,
                        color: regularBlack.withOpacity(0.04))
                  ],
                  color: regularWhite),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          getCustomFont("Total :", 16.sp, grey40, 1,
                              fontWeight: FontWeight.w400),
                          getHorSpace(6.h),
                          getCustomFont("${price}", 20.sp, regularBlack, 1,
                              fontWeight: FontWeight.w700)
                        ],
                      ),
                    ],
                  ),
                  getVerSpace(30.h),
                  getCustomButton("Book Now", () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16.h),
                              topLeft: Radius.circular(16.h))),
                      builder: (context) =>
                          ServiceBookBottomSheet(serviceName: title),
                    );
                  })
                ],
              ).paddingOnly(left: 20.h, right: 20.h, top: 20.h, bottom: 30.h),
            )
          ],
        ),
      ),
    );
  }

  Widget types_of_property_formate(icon, title, id) {
    return GetBuilder<AcRepairServiceDetailScreenController>(
      init: AcRepairServiceDetailScreenController(),
      builder: (acRepairServiceDetailScreenController) => Expanded(
          child: GestureDetector(
        onTap: () {
          acRepairServiceDetailScreenController.setSelectProperty(id);
        },
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.h),
              color:
                  acRepairServiceDetailScreenController.selectedPropertyID == id
                      ? darkYellow
                      : grey10),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getSvgImage(icon,
                    color: acRepairServiceDetailScreenController
                                .selectedPropertyID ==
                            id
                        ? regularBlack
                        : grey40),
                getHorSpace(11.h),
                getCustomFont(
                    title,
                    16.sp,
                    acRepairServiceDetailScreenController.selectedPropertyID ==
                            id
                        ? regularBlack
                        : grey40,
                    1,
                    fontWeight: FontWeight.w400)
              ],
            ).paddingSymmetric(horizontal: 18.h, vertical: 8.h),
          ),
        ),
      )),
    );
  }

  Widget units_badrooms_formate(title, quntity, removeFunction, addFunction) {
    return GetBuilder<AcRepairServiceDetailScreenController>(
      init: AcRepairServiceDetailScreenController(),
      builder: (acRepairServiceDetailScreenController) => Expanded(
          child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.h),
            border: Border.all(color: grey40)),
        padding: EdgeInsets.all(10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getCustomFont(title, 16.sp, regularBlack, 1,
                fontWeight: FontWeight.w500),
            getVerSpace(16.h),
            Row(
              children: [
                add_remove_button("remove_icon.svg", removeFunction, grey10),
                getHorSpace(24.h),
                getCustomFont(quntity, 16.sp, regularBlack, 1,
                    fontWeight: FontWeight.w400),
                getHorSpace(24.h),
                add_remove_button(
                    "add_icon_black.svg", addFunction, darkYellow),
              ],
            ),
          ],
        ).paddingAll(16.h),
      )),
    );
  }

  Widget add_remove_button(icon, function, bgcolor) {
    return GetBuilder<AcRepairServiceDetailScreenController>(
      init: AcRepairServiceDetailScreenController(),
      builder: (acRepairServiceDetailScreenController) => GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.h), color: bgcolor),
          child: getSvgImage(icon).paddingAll(4.h),
        ),
      ),
    );
  }
}