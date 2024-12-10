// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../../../controller/controller.dart';
// import '../../../../models/cleaninng_service_offer_model.dart';
// import '../../../../routes/app_routes.dart';
// import '../../../../utils/color_category.dart';
// import '../../../../utils/constant.dart';
// import '../../../../utils/constantWidget.dart';

// class CleaningServiceScreen extends StatefulWidget {
//   @override
//   State<CleaningServiceScreen> createState() => _CleaningServiceScreenState();
// }

// class _CleaningServiceScreenState extends State<CleaningServiceScreen> {
//   CleaningServiceScreenController cleaningServiceScreenController =
//       Get.put(CleaningServiceScreenController());
//   TextEditingController searchController = TextEditingController();

//   backclick() {
//     Constant.backToFinish();
//   }

//   @override
//   Widget build(BuildContext context) {
//     initializeScreenSize(context);
//     return GetBuilder<CleaningServiceScreenController>(
//         init: CleaningServiceScreenController(),
//         builder: (cleaningServiceScreenController) => WillPopScope(
//             onWillPop: () async {
//               backclick();
//               return false;
//             },
//             child: Scaffold(
//               body: SafeArea(
//                 child: all_service_categories_screen_formate(
//                     "Cleaning",
//                     () {
//                       cleaningServiceScreenController.setList();
//                     },
//                     cleaningServiceScreenController.list,
//                     () {
//                       cleaningServiceScreenController.setGrid();
//                     },
//                     cleaningServiceScreenController.grid,
//                     GridView.builder(
//                       physics: BouncingScrollPhysics(),
//                       itemCount:
//                           cleaningServiceScreenController.claningData.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount:
//                               cleaningServiceScreenController.list ? 1 : 2,
//                           mainAxisSpacing: 24.h,
//                           crossAxisSpacing:
//                               cleaningServiceScreenController.list ? 0 : 20.h,
//                           mainAxisExtent: cleaningServiceScreenController.list
//                               ? 110
//                               : 203.h),
//                       itemBuilder: (BuildContext context, int index) {
//                         CleaningServiceOffer service =
//                             cleaningServiceScreenController.claningData[index];
//                         return cleaningServiceScreenController.list
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
//                                         Row(
//                                           children: [
//                                             Container(
//                                               height: 102.h,
//                                               width: 101.h,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           16.h),
//                                                   image: DecorationImage(
//                                                       image: AssetImage(Constant
//                                                               .assetImagePath +
//                                                           service.image!),
//                                                       fit: BoxFit.fill)),
//                                             ),
//                                             getHorSpace(10.h),
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 getCustomFont(service.title!,
//                                                     14.sp, regularBlack, 1,
//                                                     fontWeight:
//                                                         FontWeight.w700),
//                                                 getVerSpace(4.h),
//                                                 getCustomFont(
//                                                     "\$${service.price}",
//                                                     14.sp,
//                                                     regularBlack,
//                                                     1,
//                                                     fontWeight:
//                                                         FontWeight.w400),
//                                                 getVerSpace(12.h),
//                                                 Row(
//                                                   children: [
//                                                     getSvgImage(
//                                                         "star_icon.svg"),
//                                                     getHorSpace(6.h),
//                                                     getCustomFont(
//                                                         service.rating!,
//                                                         14.sp,
//                                                         regularBlack,
//                                                         1,
//                                                         fontWeight:
//                                                             FontWeight.w400),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
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
//   }
// }
