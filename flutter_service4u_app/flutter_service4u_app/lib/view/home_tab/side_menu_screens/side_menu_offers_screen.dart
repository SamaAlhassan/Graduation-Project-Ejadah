import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/color_category.dart';
import '../../../utils/constant.dart';
import '../../../utils/constantWidget.dart';

class SideMenuOfferScreen extends StatefulWidget {
  @override
  State<SideMenuOfferScreen> createState() => _SideMenuOfferScreenState();
}

class _SideMenuOfferScreenState extends State<SideMenuOfferScreen> {
  backclick() {
    Constant.backToFinish();
  }

  // SideMenuOfferScreenController sideMenuOfferScreenController =
  //  Get.put(SideMenuOfferScreenController());
  // TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
        onWillPop: () async {
          backclick();
          return false;
        },
        child: Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              getVerSpace(24.h),
              getCustomAppBar("Offers", () {
                backclick();
              }),
              getVerSpace(200.h),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getSvgImage("selected_offers_icon_lt.svg",
                          height: 100.h, width: 100.h),
                      getCustomFont("No Upcoming Offer", 20.sp, regularBlack, 1,
                          fontWeight: FontWeight.w700)
                    ],
                  ))
            ],
          ).paddingSymmetric(horizontal: 20.h)),
        ));
    // GetBuilder<SideMenuOfferScreenController>(
    //   init: SideMenuOfferScreenController(),
    //   builder: (sideMenuOfferScreenController) => Scaffold(
    //     backgroundColor: context.theme.scaffoldBackgroundColor,
    //     body: SafeArea(
    //       child: Column(
    //         children: [
    //           Container(
    //               color: context.theme.focusColor,
    //               child: getAppBar(() {
    //                 backclick();
    //               })),
    //           Expanded(
    //               child: Container(
    //             color: context.theme.focusColor,
    //             child: Column(
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         getSvgImage("cleaning_service_tag.svg"),
    //                         getHorSpace(10.h),
    //                         getCustomFont("Offers For You", 18.sp,
    //                             context.theme.primaryColor, 1,
    //                             fontWeight: FontWeight.w600, txtHeight: 1.h)
    //                       ],
    //                     ),
    //                     Row(
    //                       children: [
    //                         list_grid_button(() {
    //                           sideMenuOfferScreenController.setGrid(false);
    //                         },
    //                             sideMenuOfferScreenController.grid
    //                                 ? "inactive_list_icon.svg"
    //                                 : "active_list_icon.svg",
    //                             sideMenuOfferScreenController.grid
    //                                 ? BoxDecoration(
    //                                     borderRadius:
    //                                         BorderRadius.circular(8.h),
    //                                     color: Color(0XFFF7F7F7))
    //                                 : BoxDecoration(
    //                                     borderRadius:
    //                                         BorderRadius.circular(8.h),
    //                                     boxShadow: [
    //                                         BoxShadow(
    //                                             offset: Offset(0, 8),
    //                                             blurRadius: 8,
    //                                             spreadRadius: -4,
    //                                             color: regularBlack
    //                                                 .withOpacity(0.10)),
    //                                       ])),
    //                         getHorSpace(8.h),
    //                         list_grid_button(() {
    //                           sideMenuOfferScreenController.setGrid(true);
    //                         },
    //                             sideMenuOfferScreenController.grid
    //                                 ? "active_grid_icon.svg"
    //                                 : "inactive_grid_icon.svg",
    //                             sideMenuOfferScreenController.grid
    //                                 ? BoxDecoration(
    //                                     borderRadius:
    //                                         BorderRadius.circular(8.h),
    //                                     boxShadow: [
    //                                         BoxShadow(
    //                                             offset: Offset(0, 8),
    //                                             blurRadius: 8,
    //                                             spreadRadius: -4,
    //                                             color: regularBlack
    //                                                 .withOpacity(0.10))
    //                                       ])
    //                                 : BoxDecoration(
    //                                     borderRadius:
    //                                         BorderRadius.circular(8.h),
    //                                     color: Color(0XFFF7F7F7))),
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //                 getVerSpace(20.h),
    //                 Expanded(
    //                   child: Container(
    //                     child: GridView.builder(
    //                       itemCount: sideMenuOfferScreenController
    //                           .offerData.length,
    //                       gridDelegate:
    //                           SliverGridDelegateWithFixedCrossAxisCount(
    //                               crossAxisCount:
    //                                   sideMenuOfferScreenController.grid
    //                                       ? 2
    //                                       : 1,
    //                               mainAxisSpacing:
    //                                   sideMenuOfferScreenController.grid
    //                                       ? 24.h
    //                                       : 12.h,
    //                               crossAxisSpacing:
    //                                   sideMenuOfferScreenController.grid
    //                                       ? 14.4.h
    //                                       : 0,
    //                               mainAxisExtent:
    //                                   sideMenuOfferScreenController.grid
    //                                       ? 236.92.h
    //                                       : 127.h),
    //                       itemBuilder: (context, index) {
    //                         OfferData offer = sideMenuOfferScreenController
    //                             .offerData[index];
    //                         return sideMenuOfferScreenController.grid
    //                             ? GestureDetector(
    //                                 onTap: () {
    //                                   Constant.sendToNext(
    //                                       context,
    //                                       Routes
    //                                           .AcRepairServiceDetailScreenRoute);
    //                                 },
    //                                 child: Container(
    //                                   child: Column(
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.start,
    //                                     children: [
    //                                       Stack(
    //                                         children: [
    //                                           Container(
    //                                             width: double.infinity,
    //                                             height: 165.21.h,
    //                                             decoration: BoxDecoration(
    //                                               borderRadius:
    //                                                   BorderRadius.circular(
    //                                                       14.h),
    //                                             ),
    //                                             child: getAssetImage(
    //                                                 offer.image!,
    //                                                 boxFit: BoxFit.fill),
    //                                           ),
    //                                           GestureDetector(
    //                                               onTap: () {
    //                                                 sideMenuOfferScreenController
    //                                                     .setLike(index);
    //                                               },
    //                                               child: Align(
    //                                                   alignment: Alignment
    //                                                       .centerRight,
    //                                                   child: getSvgImage(
    //                                                     offer.like
    //                                                               ? "heart_icon_white_fill.svg"
    //                                                               : "heart_icon_white_border.svg")
    //                                                       .paddingOnly(
    //                                                           top: 10.09.h,
    //                                                           right:
    //                                                               9.83.h)))
    //                                         ],
    //                                       ),
    //                                       getVerSpace(8.h),
    //                                       getCustomFont(
    //                                           offer.serviceName!,
    //                                           15.sp,
    //                                           context.theme.primaryColor,
    //                                           1,
    //                                           fontWeight: FontWeight.w600),
    //                                       getVerSpace(2.h),
    //                                       getCustomFont(
    //                                           "Vaild till: ${offer.offerValid}",
    //                                           12.sp,
    //                                           Color(0XFF9A9FA5),
    //                                           1,
    //                                           fontWeight: FontWeight.w500),
    //                                       getVerSpace(6.h),
    //                                       Row(
    //                                         mainAxisAlignment:
    //                                             MainAxisAlignment
    //                                                 .spaceBetween,
    //                                         children: [
    //                                           Container(
    //                                             height: 24.h,
    //                                             decoration: BoxDecoration(
    //                                                 borderRadius:
    //                                                     BorderRadius
    //                                                         .circular(6.h),
    //                                                 color:
    //                                                     Color(0XFFB5E4CA)),
    //                                             child: Center(
    //                                                 child: getCustomFont(
    //                                                         "${offer.offer!} OFF",
    //                                                         12.sp,
    //                                                         context.theme
    //                                                             .primaryColor,
    //                                                         1,
    //                                                         fontWeight:
    //                                                             FontWeight
    //                                                                 .w700)
    //                                                     .paddingSymmetric(
    //                                                         horizontal:
    //                                                             6.h)),
    //                                           ),
    //                                           SizedBox(),
    //                                         ],
    //                                       )
    //                                     ],
    //                                   ),
    //                                 ),
    //                               )
    //                             : GestureDetector(
    //                                 onTap: () {
    //                                   Constant.sendToNext(
    //                                       context,
    //                                       Routes
    //                                           .AcRepairServiceDetailScreenRoute);
    //                                 },
    //                                 child: Container(
    //                                   decoration: BoxDecoration(
    //                                       border: Border(
    //                                           bottom: BorderSide(
    //                                               color: index ==
    //                                                       sideMenuOfferScreenController
    //                                                               .offerData
    //                                                               .length -
    //                                                           1
    //                                                   ? context
    //                                                       .theme.focusColor
    //                                                   : greyButton))),
    //                                   child: Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceBetween,
    //                                     children: [
    //                                       Row(
    //                                         children: [
    //                                           Container(
    //                                             width: 105.h,
    //                                             height: 116.h,
    //                                             decoration: BoxDecoration(
    //                                               borderRadius:
    //                                                   BorderRadius.circular(
    //                                                       14.h),
    //                                             ),
    //                                             child: getAssetImage(
    //                                                 offer.image!,
    //                                                 boxFit: BoxFit.fill),
    //                                           ),
    //                                           getHorSpace(16.h),
    //                                           Column(
    //                                             crossAxisAlignment:
    //                                                 CrossAxisAlignment
    //                                                     .start,
    //                                             children: [
    //                                               getCustomFont(
    //                                                   offer.serviceName!,
    //                                                   14.sp,
    //                                                   context.theme
    //                                                       .primaryColor,
    //                                                   1,
    //                                                   fontWeight:
    //                                                       FontWeight.w600),
    //                                               getVerSpace(7.h),
    //                                               getCustomFont(
    //                                                   "Vaild till: ${offer.offerValid}",
    //                                                   12.sp,
    //                                                   Color(0XFF9A9FA5),
    //                                                   1,
    //                                                   fontWeight:
    //                                                       FontWeight.w500),
    //                                               getVerSpace(10.h),
    //                                               Container(
    //                                                 height: 24.h,
    //                                                 decoration: BoxDecoration(
    //                                                     borderRadius:
    //                                                         BorderRadius
    //                                                             .circular(
    //                                                                 6.h),
    //                                                     color: Color(
    //                                                         0XFFB5E4CA)),
    //                                                 child: Center(
    //                                                     child: getCustomFont(
    //                                                             "${offer.offer!} OFF",
    //                                                             12.sp,
    //                                                             context
    //                                                                 .theme
    //                                                                 .primaryColor,
    //                                                             1,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .w700)
    //                                                         .paddingSymmetric(
    //                                                             horizontal:
    //                                                                 6.h)),
    //                                               ),
    //                                             ],
    //                                           )
    //                                         ],
    //                                       ),
    //                                       getSvgImage(
    //                                           "more_hor_rounded.svg")
    //                                     ],
    //                                   ).paddingOnly(bottom: 10.h),
    //                                 ),
    //                               );
    //                       },
    //                     ),
    //                   ),
    //                 ),
    //                 getCustomButton("point", (){
    //                   Constant.sendToNext(context, Routes.rewardsPointScreenRoute);
    //                 })
    //               ],
    //             ).paddingAll(16.h),
    //           ).paddingSymmetric(horizontal: 17.h, vertical: 17.h))
    //         ],
    //       ),
    //     ),
    //   ),
    // )
    // );
  }

  Widget list_grid_button(function, icon, Decoration boxdecoration) {
    return GestureDetector(
      onTap: () {
        function();
        //
      },
      child: Container(
        height: 36.h,
        width: 36.h,
        decoration: boxdecoration,
        child: getSvgImage(icon).paddingAll(8.h),
      ),
    );
  }
}
