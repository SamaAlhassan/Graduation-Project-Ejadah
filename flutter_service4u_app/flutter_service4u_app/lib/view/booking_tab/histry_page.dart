
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';

import '../../controller/controller.dart';
import '../../models/booking_upcoming_data_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/color_category.dart';
import '../../utils/constantWidget.dart';

class HistryPage extends StatefulWidget {


  @override
  State<HistryPage> createState() => _HistryPageState();
}

class _HistryPageState extends State<HistryPage> {
  HistryPageController histryPageController  = Get.put(HistryPageController());



  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistryPageController>(
        init: HistryPageController(),
        builder:(histryPageController) => histryPageController.histryData.length==0? booking_empty_formate(
            "booking_histry.svg", "No Order History",
            context.theme.primaryColor,
            "Currently you don’t have any upcoming order. Place and track your orders from here.",
            Color(0XFF535763),(){} ):ListView.builder(padding: EdgeInsets.symmetric(horizontal: 20.h),itemCount: histryPageController.histryData.length,itemBuilder: (context, index) {
          Booking upcoming = histryPageController.histryData[index];
          return upcoming.status!.toLowerCase()=="complete"?GestureDetector(
onTap: (){
  Constant.sendToNext(context, Routes.histryDetailScreenRoute);
},
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.h),
                  border:Border.all(color: grey20) ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.h,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16.h), color: grey10),
                        child: getAssetImage(upcoming.icon!).paddingAll(8.h),
                      ),
                      getHorSpace(16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomFont(upcoming.title!, 16.sp,  context.theme.primaryColor, 1,
                              fontWeight: FontWeight.w600),
                          getVerSpace(6.h),
                          getCustomFont( "Reference Code: ${upcoming.referenceCode}", 14.sp, neutralShades, 1,
                              fontWeight: FontWeight.w500)
                        ],
                      ),getVerSpace(10.h),

                    ],
                  ),
                  getVerSpace(12.h),
                  Divider(color: greyButton,),
                  Container(
                    child: Column(
                      children: [
                        getVerSpace(2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont("Status", 14.sp, greyTextColor, 1,fontWeight: FontWeight.w500),
                            confirm_pending_button(upcoming.status!,completedButtonColor,completedButtonTextColor)

                          ],
                        ),
                        getVerSpace(12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont("Service Provider", 14.sp, greyTextColor, 1,fontWeight: FontWeight.w500),
                            getCustomFont(upcoming.serviceOroviderTitle!, 14.sp, Color(0XFF33383F), 1,fontWeight: FontWeight.w600),

                          ],
                        ),
                        getVerSpace(12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont("Schedule", 14.sp, greyTextColor, 1,fontWeight: FontWeight.w500),
                            getCustomFont("${upcoming.scheduleTime!}, ${upcoming.scheduleDate}", 14.sp, Color(0XFF33383F), 1,fontWeight: FontWeight.w600),

                          ],
                        ),
                      ],
                    ),
                  )




                ],
              ).paddingAll(16.h),
            ).paddingSymmetric(vertical: 10.h),
          ):SizedBox();
        },)
    );
    //   ListView(children: [
    //   Text("data"),
    // ],);
  }

  Widget confirm_pending_button(status,buttonbgColor,buttonTextColor){
    return   Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.h),
          color: buttonbgColor),
      child: getCustomFont(status, 14.sp, buttonTextColor, 1,fontWeight: FontWeight.w600).paddingSymmetric(horizontal: 8.h),
    );
  }


  }

