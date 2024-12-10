
/* import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../../controller/controller.dart';
import '../../models/booking_upcoming_data_model.dart';
import '../../utils/color_category.dart';

class DraftPage extends StatefulWidget {

  @override
  State<DraftPage> createState() => _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
  DraftPageController draftPageController = Get.put(DraftPageController());


        @override
        Widget build(BuildContext context) {
      return GetBuilder<DraftPageController>(
          init: DraftPageController(),
          builder:(draftPageController) => draftPageController.draftData.length==0?   booking_empty_formate(
              "booking_upcoming_icon.svg", "You have No Draft",
              context.theme.primaryColor,
              "Currently you don’t have any upcoming order. Place and track your orders from here.",
              Color(0XFF535763), (){}):ListView.builder(padding: EdgeInsets.symmetric(horizontal: 20.h),itemCount: draftPageController.draftData.length,itemBuilder: (context, index) {
            Booking draft = draftPageController.draftData[index];
            return draft.status!.toLowerCase()=="darft"?Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.h),
              border: Border.all(color:grey20 )),
              child:  Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.h,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16.h),color:grey10),
                        child: getAssetImage(draft.icon!).paddingAll(8.h),
                      ),
                      getHorSpace(16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomFont(draft.title!, 16.sp,  context.theme.primaryColor, 1,
                              fontWeight: FontWeight.w600),
                          getVerSpace(6.h),
                          getCustomFont( draft.quntity!, 14.sp, grey40, 1,
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
                            confirm_pending_button(draft.status!,darftButtonBgColor,darftButtonTextColor)

                          ],
                        ),
                        getVerSpace(12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont("Schedule", 14.sp, greyTextColor, 1,fontWeight: FontWeight.w500),
                            getCustomFont("${draft.scheduleTime!}, ${draft.scheduleDate}", 14.sp, Color(0XFF33383F), 1,fontWeight: FontWeight.w600),

                          ],
                        ),
                      ],
                    ),
                  )




                ],
              ).paddingAll(16.h),
            ).paddingSymmetric(vertical: 10.h):SizedBox();
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







//       ListView(children: [
//       Center(
//         child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//
//           ],
//         ),
//       )
//     ],);
  }
*/
