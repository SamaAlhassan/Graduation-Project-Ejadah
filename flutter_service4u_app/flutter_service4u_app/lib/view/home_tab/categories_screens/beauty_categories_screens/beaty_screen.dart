// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:service_hub_app/models/beauty_category_data_model.dart';
// import '../../../../controller/controller.dart';
// import '../../../../routes/app_routes.dart';
// import '../../../../utils/color_category.dart';
// import '../../../../utils/constant.dart';
// import '../../../../utils/constantWidget.dart';

// class BeautyScreen extends StatefulWidget {
//   @override
//   State<BeautyScreen> createState() => _BeautyScreenState();
// }

// class _BeautyScreenState extends State<BeautyScreen> {
//   BeautyScreenController beautyScreenController =
//       Get.put(BeautyScreenController());
//   TextEditingController searchController = TextEditingController();

//   backclick() {
//     Constant.backToFinish();
//   }

//   @override
//   Widget build(BuildContext context) {
//     initializeScreenSize(context);
//     return GetBuilder<BeautyScreenController>(
//         init: BeautyScreenController(),
//         builder: (beautyScreenController) => WillPopScope(
//             onWillPop: () async {
//               backclick();
//               return false;
//             },
//             child: Scaffold(
//               body: SafeArea(
//                 child: all_service_categories_screen_formate(
//                     "Beauty",
//                     () {
//                       beautyScreenController.setList();
//                     },
//                     beautyScreenController.list,
//                     () {
//                       beautyScreenController.setGrid();
//                     },
//                     beautyScreenController.grid,
//                     GridView.builder(
//                       physics: BouncingScrollPhysics(),
//                       itemCount: beautyScreenController.beautyData.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: beautyScreenController.list ? 1 : 2,
//                           mainAxisSpacing: 24.h,
//                           crossAxisSpacing:
//                               beautyScreenController.list ? 0 : 20.h,
//                           mainAxisExtent:
//                               beautyScreenController.list ? 110 : 203.h),
//                       itemBuilder: (BuildContext context, int index) {
//                         BeautyData service =
//                             beautyScreenController.beautyData[index];
//                         return beautyScreenController.list
//                             ? animation_function(
//                                 index,
//                                 GestureDetector(
//                                   onTap: () {
//                                     Constant.sendToNext(
//                                         context,
//                                         Routes
//                                             .acRepairServiceDetailScreenRoute);
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(16.h),
//                                         border: Border.all(color: grey20)),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(children: [
//                                           Container(
//                                             height: 102.h,
//                                             width: 101.h,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(16.h),
//                                                 image: DecorationImage(
//                                                     image: AssetImage(Constant
//                                                             .assetImagePath +
//                                                         service.image!),
//                                                     fit: BoxFit.fill)),
//                                           ),
//                                           getHorSpace(10.h),
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               getCustomFont(service.title!,
//                                                   14.sp, regularBlack, 1,
//                                                   fontWeight: FontWeight.w700),
//                                               getVerSpace(4.h),
//                                               getCustomFont(
//                                                   "\$${service.price}",
//                                                   14.sp,
//                                                   regularBlack,
//                                                   1,
//                                                   fontWeight: FontWeight.w400),
//                                               getVerSpace(12.h),
//                                               Row(
//                                                 children: [
//                                                   getSvgImage("star_icon.svg"),
//                                                   getHorSpace(6.h),
//                                                   getCustomFont(service.rating!,
//                                                       14.sp, regularBlack, 1,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ]),
//                                         service.discount == ""
//                                             ? SizedBox()
//                                             : Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   SizedBox(),
//                                                   getCustomFont(
//                                                       "Off ${service.discount}%",
//                                                       14.sp,
//                                                       grey40,
//                                                       1,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                 ],
//                                               ).paddingOnly(
//                                                 bottom: 24.h, right: 12.h)
//                                       ],
//                                     ).paddingSymmetric(
//                                         vertical: 4.h, horizontal: 4.h),
//                                   ),
//                                 ),
//                               )
//                             : animation_function(
//                                 index,
//                                 GestureDetector(
//                                   onTap: () {
//                                     Constant.sendToNext(
//                                         context,
//                                         Routes
//                                             .acRepairServiceDetailScreenRoute);
//                                   },
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         height: 146.h,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(16.h),
//                                             image: DecorationImage(
//                                                 image: AssetImage(
//                                                     Constant.assetImagePath +
//                                                         service.image!),
//                                                 fit: BoxFit.fill)),
//                                       ),
//                                       getVerSpace(12.h),
//                                       getCustomFont(service.title!, 14.sp,
//                                           regularBlack, 1,
//                                           fontWeight: FontWeight.w700),
//                                       getVerSpace(4.h),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           getCustomFont("\$${service.price}",
//                                               14.sp, regularBlack, 1,
//                                               fontWeight: FontWeight.w400),
//                                           Container(
//                                             height: 21.h,
//                                             child: Row(
//                                               children: [
//                                                 getSvgImage("star_icon.svg",
//                                                     height: 16.h, width: 16.h),
//                                                 getHorSpace(2.h),
//                                                 getCustomFont(service.rating!,
//                                                     14.sp, regularBlack, 1,
//                                                     fontWeight:
//                                                         FontWeight.w400),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                       },
//                     )),
//               ),
//             )));

//     // WillPopScope(
//     //   onWillPop: () async {
//     //     backclick();
//     //     return false;
//     //   },
//     //   child: GetBuilder<BeautyScreenController>(
//     //     init: BeautyScreenController(),
//     //     builder: (beautyScreenController) => Scaffold(
//     //       backgroundColor: context.theme.scaffoldBackgroundColor,
//     //       body: SafeArea(
//     //         child: Column(
//     //           children: [
//     //             Container(
//     //               color: context.theme.focusColor,
//     //               child:
//     //               getSearchTextField(prefixFunction: (){backclick();},searchController, "Search Category")
//     //                   .paddingSymmetric(horizontal: 16.h, vertical: 12.h),
//     //             ),
//     //             Expanded(
//     //                 child: Container(
//     //                   color: context.theme.focusColor,
//     //                   child: Column(
//     //                     children: [
//     //                       Row(
//     //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //                         children: [
//     //                           Row(
//     //                             children: [
//     //                               getSvgImage("cleaning_service_tag.svg"),
//     //                               getHorSpace(10.h),
//     //                               getCustomFont("Appliance Repair", 18.sp,
//     //                                   context.theme.primaryColor, 1,
//     //                                   fontWeight: FontWeight.w600, txtHeight: 1.h)
//     //                             ],
//     //                           ),
//     //                           Row(
//     //                             children: [
//     //                               list_grid_button(() {
//     //                                 beautyScreenController
//     //                                     .setGrid(false);
//     //                               },
//     //                                   beautyScreenController.grid
//     //                                       ? "inactive_list_icon.svg"
//     //                                       : "active_list_icon.svg",
//     //                                   beautyScreenController.grid
//     //                                       ? BoxDecoration(
//     //                                       borderRadius:
//     //                                       BorderRadius.circular(8.h),
//     //                                       color: Color(0XFFF7F7F7))
//     //                                       : BoxDecoration(
//     //                                       borderRadius:
//     //                                       BorderRadius.circular(8.h),
//     //                                       boxShadow: [
//     //                                         BoxShadow(
//     //                                             offset: Offset(0, 8),
//     //                                             blurRadius: 8,
//     //                                             spreadRadius: -4,
//     //                                             color: regularBlack
//     //                                                 .withOpacity(0.10)),
//     //                                       ])),
//     //                               getHorSpace(8.h),
//     //                               list_grid_button(() {
//     //                                 beautyScreenController
//     //                                     .setGrid(true);
//     //                               },
//     //                                   beautyScreenController.grid
//     //                                       ? "active_grid_icon.svg"
//     //                                       : "inactive_grid_icon.svg",
//     //                                   beautyScreenController.grid
//     //                                       ? BoxDecoration(
//     //                                       borderRadius:
//     //                                       BorderRadius.circular(8.h),
//     //                                       boxShadow: [
//     //                                         BoxShadow(
//     //                                             offset: Offset(0, 8),
//     //                                             blurRadius: 8,
//     //                                             spreadRadius: -4,
//     //                                             color: regularBlack
//     //                                                 .withOpacity(0.10))
//     //                                       ])
//     //                                       : BoxDecoration(
//     //                                       borderRadius:
//     //                                       BorderRadius.circular(8.h),
//     //                                       color: Color(0XFFF7F7F7))),
//     //                             ],
//     //                           )
//     //                         ],
//     //                       ),
//     //                       getVerSpace(20.h),
//     //                       Expanded(
//     //                         child: Container(
//     //                           child: GridView.builder(
//     //                             itemCount: beautyScreenController
//     //                                 .beautyData.length,
//     //                             gridDelegate:
//     //                             SliverGridDelegateWithFixedCrossAxisCount(
//     //                                 crossAxisCount:
//     //                                 beautyScreenController
//     //                                     .grid
//     //                                     ? 2
//     //                                     : 1,
//     //                                 mainAxisSpacing:
//     //                                 beautyScreenController
//     //                                     .grid
//     //                                     ? 24.h
//     //                                     : 12.h,
//     //                                 crossAxisSpacing:
//     //                                 beautyScreenController
//     //                                     .grid
//     //                                     ? 14.4.h
//     //                                     : 0,
//     //                                 mainAxisExtent:
//     //                                 beautyScreenController
//     //                                     .grid
//     //                                     ? 236.92.h
//     //                                     : 127.h),
//     //                             itemBuilder: (context, index) {
//     //                               BeautyData beauty =
//     //                               beautyScreenController
//     //                                   .beautyData[index];
//     //                               return beautyScreenController.grid
//     //                                   ? GestureDetector(
//     //                                 onTap: (){
//     //                                   Constant.sendToNext(context, Routes.beautyServiceDetailRoute);
//     //                                 },
//     //                                 child: Container(
//     //                                   child: Column(
//     //                                     crossAxisAlignment:
//     //                                     CrossAxisAlignment.start,
//     //                                     children: [
//     //                                       Container(
//     //                                         width: double.infinity,
//     //                                         height: 165.21.h,
//     //                                         decoration: BoxDecoration(
//     //                                           borderRadius:
//     //                                           BorderRadius.circular(14.h),
//     //                                         ),
//     //                                         child: getAssetImage(
//     //                                             beauty.image!,
//     //                                             boxFit: BoxFit.fill),
//     //                                       ),
//     //                                       getVerSpace(8.h),
//     //                                       getCustomFont(
//     //                                           beauty.serviceName!,
//     //                                           15.sp,
//     //                                           context.theme.primaryColor,
//     //                                           1,
//     //                                           fontWeight: FontWeight.w600),
//     //                                       getVerSpace(2.h),
//     //                                       getCustomFont("Starts From", 12.sp,
//     //                                           Color(0XFF9A9FA5), 1,
//     //                                           fontWeight: FontWeight.w500),
//     //                                       getVerSpace(6.h),
//     //                                       Row(
//     //                                         mainAxisAlignment:
//     //                                         MainAxisAlignment
//     //                                             .spaceBetween,
//     //                                         children: [
//     //                                           Container(
//     //                                             height: 24.h,
//     //                                             width: 41.h,
//     //                                             decoration: BoxDecoration(
//     //                                                 borderRadius:
//     //                                                 BorderRadius.circular(
//     //                                                     6.h),
//     //                                                 color: Color(0XFFB5E4CA)),
//     //                                             child: Center(
//     //                                                 child: getCustomFont(
//     //                                                     "\$${beauty.rate!}",
//     //                                                     12.sp,
//     //                                                     context.theme
//     //                                                         .primaryColor,
//     //                                                     1,
//     //                                                     fontWeight:
//     //                                                     FontWeight.w700)),
//     //                                           ),
//     //                                           Container(
//     //                                               height: 24.h,
//     //                                               width: 51.h,
//     //                                               decoration: BoxDecoration(
//     //                                                   borderRadius:
//     //                                                   BorderRadius
//     //                                                       .circular(
//     //                                                       100.h),
//     //                                                   color: Color(0XFFFFC554)
//     //                                                       .withOpacity(0.10)),
//     //                                               child: Row(
//     //                                                 mainAxisAlignment:
//     //                                                 MainAxisAlignment
//     //                                                     .center,
//     //                                                 children: [
//     //                                                   getSvgImage(
//     //                                                       "star_icon.svg"),
//     //                                                   getHorSpace(5.h),
//     //                                                   getCustomFont(
//     //                                                       beauty.ratting!,
//     //                                                       12.sp,
//     //                                                       context.theme
//     //                                                           .primaryColor,
//     //                                                       1,
//     //                                                       fontWeight:
//     //                                                       FontWeight.w700)
//     //                                                 ],
//     //                                               ))
//     //                                         ],
//     //                                       )
//     //                                     ],
//     //                                   ),
//     //                                 ),
//     //                               )
//     //                                   : GestureDetector(
//     //                                 onTap: (){
//     //                                   Constant.sendToNext(context, Routes.beautyServiceDetailRoute);
//     //                                 },
//     //                                 child: Container(
//     //                                   decoration: BoxDecoration(
//     //                                       border: Border(
//     //                                           bottom: BorderSide(
//     //                                               color: index ==
//     //                                                   beautyScreenController
//     //                                                       .beautyData
//     //                                                       .length -
//     //                                                       1
//     //                                                   ? context
//     //                                                   .theme.focusColor
//     //                                                   : greyButton))),
//     //                                   child: Row(
//     //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //                                     children: [
//     //                                       Row(
//     //                                         children: [
//     //                                           Container(
//     //                                             width: 105.h,
//     //                                             height: 116.h,
//     //                                             decoration: BoxDecoration(
//     //                                               borderRadius:
//     //                                               BorderRadius.circular(
//     //                                                   14.h),
//     //                                             ),
//     //                                             child: getAssetImage(
//     //                                                 beauty.image!,
//     //                                                 boxFit: BoxFit.fill),
//     //                                           ),
//     //                                           getHorSpace(16.h),
//     //                                           Column(
//     //                                             crossAxisAlignment:
//     //                                             CrossAxisAlignment.start,
//     //                                             children: [
//     //                                               Row(
//     //                                                 children: [
//     //                                                   getSvgImage(
//     //                                                       "star_icon.svg"),
//     //                                                   getHorSpace(5.h),
//     //                                                   getCustomFont(
//     //                                                       beauty.ratting!,
//     //                                                       12.sp,
//     //                                                       context.theme
//     //                                                           .primaryColor,
//     //                                                       1,
//     //                                                       fontWeight:
//     //                                                       FontWeight
//     //                                                           .w700),
//     //                                                   getCustomFont(
//     //                                                       "(87)",
//     //                                                       12.sp,
//     //                                                       Color(0XFF6F767E),
//     //                                                       1,
//     //                                                       fontWeight:
//     //                                                       FontWeight
//     //                                                           .w700),
//     //                                                 ],
//     //                                               ),
//     //                                               getVerSpace(8.h),
//     //                                               getCustomFont(
//     //                                                   beauty.serviceName!,
//     //                                                   14.sp,
//     //                                                   context
//     //                                                       .theme.primaryColor,
//     //                                                   1,
//     //                                                   fontWeight:
//     //                                                   FontWeight.w600),
//     //                                               getVerSpace(7.h),
//     //                                               getCustomFont("Starts From", 12.sp, neutralShades, 1,fontWeight: FontWeight.w500),
//     //                                               getVerSpace(10.h),
//     //                                               Container(
//     //                                                 height: 24.h,
//     //                                                 width: 41.h,
//     //                                                 decoration: BoxDecoration(
//     //                                                     borderRadius:
//     //                                                     BorderRadius.circular(
//     //                                                         6.h),
//     //                                                     color: Color(0XFFB5E4CA)),
//     //                                                 child: Center(
//     //                                                     child: getCustomFont(
//     //                                                         "\$${beauty.rate!}",
//     //                                                         12.sp,
//     //                                                         context.theme
//     //                                                             .primaryColor,
//     //                                                         1,
//     //                                                         fontWeight:
//     //                                                         FontWeight.w700)),
//     //                                               ),
//     //                                             ],
//     //                                           )
//     //                                         ],
//     //                                       ),
//     //                                       getSvgImage("more_hor_rounded.svg")
//     //                                     ],
//     //                                   ).paddingOnly(bottom: 10.h),
//     //                                 ),
//     //                               );
//     //                             },
//     //                           ),
//     //                         ),
//     //                       ),
//     //                     ],
//     //                   ).paddingAll(16.h),
//     //                 ).paddingSymmetric(horizontal: 17.h, vertical: 17.h))
//     //           ],
//     //         ),
//     //       ),
//     //     ),
//     //   ));
//   }

//   Widget list_grid_button(function, icon, Decoration boxdecoration) {
//     return GestureDetector(
//       onTap: () {
//         function();
//         //
//       },
//       child: Container(
//         height: 36.h,
//         width: 36.h,
//         decoration: boxdecoration,
//         child: getSvgImage(icon).paddingAll(8.h),
//       ),
//     );
//   }
// }
