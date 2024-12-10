import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';

import '../../../../controller/controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/color_category.dart';

class AddCardBottomSheet extends StatefulWidget {


  @override
  State<AddCardBottomSheet> createState() => _AddCardBottomSheetState();
}

class _AddCardBottomSheetState extends State<AddCardBottomSheet> {
  AddCardBottomSheetController addCardBottomSheetController = Get.put(AddCardBottomSheetController());
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<AddCardBottomSheetController>(
      init: AddCardBottomSheetController(),
      builder:(addCardBottomSheetController) =>  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              seeAll_button_formate("Add New Card", context.theme.primaryColor, () {
                Constant.sendToNext(context, Routes.cardScaneScreenRoute);
              },
                  fontsize: 18.sp,fontwidth: FontWeight.w600,buttonTextColor: blue,
                  "Scan", "scanner_icon.svg",
                  buttonWidth: 74.h),
              getVerSpace(16.h),
              // getTextField("3571 399507 50832",fillColor: Color(0XFFF4F4F4),),
              getVerSpace(20.h),
              Row(
                children: [
                  Expanded(child: Column(
                    children: [
                      Row(
                        children: [
                          getCustomFont("Expires End", 14.sp, Color(0XFF33383F), 1,fontWeight: FontWeight.w500),
                          getHorSpace(4.h),
                          getSvgImage("substract_icon.svg")
                        ],
                      ),
                      getVerSpace(10.h),
                      // getTextField("07/22",fillColor: Color(0XFFF4F4F4),),
                    ],
                  )),
                  getHorSpace(8.h),
                  Expanded(child: Column(
                    children: [
                      Row(
                        children: [
                          getCustomFont("CVV", 14.sp, Color(0XFF33383F), 1,fontWeight: FontWeight.w500),
                          getHorSpace(4.h),
                          getSvgImage("substract_icon.svg")
                        ],
                      ),
                      getVerSpace(10.h),
                      // getTextField("483",fillColor: Color(0XFFF4F4F4),),
                    ],
                  ))
                ],
              ),
              getVerSpace(20.h),
              GestureDetector(
                onTap: (){
                  addCardBottomSheetController.setCheakButtonPosition();
                },
                child: Row(
                  children: [
                    getSvgImage(addCardBottomSheetController.cheak?"select_cheak_button.svg":"unselect_cheak_button.svg"),
                    getHorSpace(10.h),
                    getCustomFont("Save as a primary card", 15.sp, context.theme.primaryColor, 1,fontWeight: FontWeight.w600)
                  ],
                ),
              ),

            ],
          ).paddingSymmetric(horizontal: 16.h,vertical: 16.h),
          Container(
            color: textFieldHint,
            child:getCustomButton("Add Card", color: greyButtonText,(){},decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.h),
            color: greyButton)).paddingAll(16.h)
          )
        ],
      ),
    );
  }
}
