import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../models/recommended_data_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/color_category.dart';
import '../../utils/constant.dart';
import '../../utils/constantWidget.dart';
import '../booking_tab/histry_detail_screen.dart';

class RecommendedServiceScreen extends StatefulWidget {
  @override
  State<RecommendedServiceScreen> createState() =>
      _RecommendedServiceScreenState();
}

class _RecommendedServiceScreenState extends State<RecommendedServiceScreen> {
  RecommendedServiceScreenController recommendedServiceScreenController =
      Get.put(RecommendedServiceScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<RecommendedServiceScreenController>(
        init: RecommendedServiceScreenController(),
        builder: (recommendedServiceScreenController) => WillPopScope(
            onWillPop: () async {
              backclick();
              return false;
            },
            child: Scaffold(
              body: SafeArea(
                child: all_service_categories_screen_formate(
                    "Ac Repair",
                    () {
                      recommendedServiceScreenController.setList();
                    },
                    recommendedServiceScreenController.list,
                    () {
                      recommendedServiceScreenController.setGrid();
                    },
                    recommendedServiceScreenController.grid,
                    GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount:
                          recommendedServiceScreenController.recommnded.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              recommendedServiceScreenController.list ? 1 : 2,
                          mainAxisSpacing: 24.h,
                          crossAxisSpacing:
                              recommendedServiceScreenController.list
                                  ? 0
                                  : 20.h,
                          mainAxisExtent:
                              recommendedServiceScreenController.list
                                  ? 110
                                  : 203.h),
                      itemBuilder: (BuildContext context, int index) {
                        RecommendedData service =
                            recommendedServiceScreenController
                                .recommnded[index];
                        return recommendedServiceScreenController.list
                            ? animation_function(
                                index,
                                GestureDetector(
                                  onTap: () {
                                    Constant.sendToNext(
                                        context,
                                        Routes
                                            .acRepairServiceDetailScreenRoute);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.h),
                                        border: Border.all(color: grey20)),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 102.h,
                                          width: 101.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.h),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      Constant.assetImagePath +
                                                          service.image!),
                                                  fit: BoxFit.fill)),
                                        ),
                                        getHorSpace(10.h),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            getCustomFont(service.title!, 14.sp,
                                                regularBlack, 1,
                                                fontWeight: FontWeight.w700),
                                            getVerSpace(4.h),
                                            getCustomFont("\$${service.price}",
                                                14.sp, regularBlack, 1,
                                                fontWeight: FontWeight.w400),
                                            getVerSpace(12.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    getSvgImage(
                                                        "star_icon.svg"),
                                                    getHorSpace(6.h),
                                                    getCustomFont(
                                                        service.rating!,
                                                        14.sp,
                                                        regularBlack,
                                                        1,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ],
                                                ),
                                                getHorSpace(176.h),
                                                service.discount == ""
                                                    ? SizedBox()
                                                    : getCustomFont(
                                                        "Off ${service.discount}%",
                                                        14.sp,
                                                        grey40,
                                                        1,
                                                        fontWeight:
                                                            FontWeight.w400)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ).paddingSymmetric(
                                        vertical: 4.h, horizontal: 4.h),
                                  ),
                                ),
                              )
                            : animation_function(
                                index,
                                GestureDetector(
                                  onTap: () {
                                    Constant.sendToNext(
                                        context,
                                        Routes
                                            .acRepairServiceDetailScreenRoute);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 146.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.h),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    Constant.assetImagePath +
                                                        service.image!),
                                                fit: BoxFit.fill)),
                                      ),
                                      getVerSpace(12.h),
                                      getCustomFont(service.title!, 14.sp,
                                          regularBlack, 1,
                                          fontWeight: FontWeight.w700),
                                      getVerSpace(4.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getCustomFont("\$${service.price}",
                                              14.sp, regularBlack, 1,
                                              fontWeight: FontWeight.w400),
                                          Container(
                                            height: 21.h,
                                            child: Row(
                                              children: [
                                                getSvgImage("star_icon.svg",
                                                    height: 16.h, width: 16.h),
                                                getHorSpace(2.h),
                                                getCustomFont(service.rating!,
                                                    14.sp, regularBlack, 1,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    )),
              ),
            )));

    // WillPopScope(
    //   onWillPop: () async {
    //     backclick();
    //     return false;
    //   },
    //   child: GetBuilder<ACRepairScreenController>(
    //     init: ACRepairScreenController(),
    //     builder: (acRepairScreenController) => Scaffold(
    //       backgroundColor: context.theme.scaffoldBackgroundColor,
    //       body: SafeArea(
    //         child: Column(
    //           children: [
    //             getVerSpace(24.h),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 getCustomAppBar("Ac Repair", () {
    //                   backclick();
    //                 }),
    //                 Row(
    //                   children: [
    //                     GestureDetector(
    //                         onTap: () {
    //                           acRepairScreenController.setList();
    //                         },
    //                         child: getSvgImage(acRepairScreenController.list
    //                             ? "selected_list_icon.svg"
    //                             : "unselected_list_icon.svg")),
    //                     getHorSpace(10.h),
    //                     GestureDetector(
    //                         onTap: () {
    //                           acRepairScreenController.setGrid();
    //                         },
    //                         child: getSvgImage(acRepairScreenController.grid
    //                             ? "selected_grid_icon.svg"
    //                             : "unselected_grid_icon.svg")),
    //                   ],
    //                 )
    //               ],
    //             ),
    //             getVerSpace(32.h),
    //             getSearchField("Search...", fillColor: grey10),
    //             getVerSpace(32.h),
    //             Expanded(
    //               child: Container(
    //                 child: GridView.builder(
    //                   physics: BouncingScrollPhysics(),
    //                   itemCount: acRepairScreenController.allacservice.length,
    //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                       crossAxisCount: acRepairScreenController.list?1:2,
    //                       mainAxisSpacing: 24.h,
    //                       crossAxisSpacing: acRepairScreenController.list?0:20.h,
    //                       mainAxisExtent: acRepairScreenController.list?110:203.h),
    //                   itemBuilder: (BuildContext context, int index) {
    //                     AllacService service =
    //                         acRepairScreenController.allacservice[index];
    //                     return acRepairScreenController.list?GestureDetector(
    //                       onTap: (){
    //                         Constant.sendToNext(context, Routes.acRepairServiceDetailScreenRoute);
    //                       },
    //                       child: Container(
    //                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.h),border: Border.all(color: grey20)),
    //                         child: Row(
    //                           children: [
    //                             Container(
    //                               height: 102.h,
    //                               width: 101.h,
    //                               decoration: BoxDecoration(
    //                                   borderRadius:
    //                                   BorderRadius.circular(16.h),
    //                                   image: DecorationImage(image: AssetImage(Constant.assetImagePath+service.image!),fit: BoxFit.fill )),
    //
    //                             ),
    //                             getHorSpace(10.h),
    //                             Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               children: [
    //                                 getCustomFont(service.title!, 14.sp, regularBlack, 1,fontWeight: FontWeight.w700),
    //                                 getVerSpace(4.h),
    //                                 getCustomFont("\$${service.price}", 14.sp, regularBlack, 1,fontWeight: FontWeight.w400),
    //                                 getVerSpace(12.h),
    //                                 Row(
    //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                   children: [
    //                                     Row(
    //                                       children: [
    //                                         getSvgImage("star_icon.svg"),
    //                                         getHorSpace(6.h),
    //                                         getCustomFont(service.rating!, 14.sp, regularBlack, 1,fontWeight: FontWeight.w400),
    //                                       ],
    //                                     ),
    //                                     getHorSpace(176.h),
    //
    //                                     service.discount==""?SizedBox():getCustomFont("Off ${service.discount}%", 14.sp, grey40, 1,fontWeight: FontWeight.w400)
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         ).paddingSymmetric(vertical: 4.h,horizontal: 4.h),
    //                       ),
    //                     )
    //                         :
    //                     GestureDetector(
    //                       onTap: (){
    //                         Constant.sendToNext(context, Routes.acRepairServiceDetailScreenRoute);
    //                       },
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Container(
    //                             height: 146.h,
    //                             decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(16.h),
    //                                 image: DecorationImage(
    //                                     image: AssetImage(
    //                                         Constant.assetImagePath +
    //                                             service.image!),
    //                                     fit: BoxFit.fill)),
    //                           ),
    //                           getVerSpace(12.h),
    //                           getCustomFont(
    //                               service.title!, 14.sp, regularBlack, 1,
    //                               fontWeight: FontWeight.w700),
    //                           getVerSpace(4.h),
    //                           Row(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               getCustomFont("\$${service.price}", 14.sp,
    //                                   regularBlack, 1,
    //                                   fontWeight: FontWeight.w400),
    //                               Container(
    //                                 height: 21.h,
    //                                 child: Row(
    //                                   children: [
    //                                     getSvgImage("star_icon.svg",
    //                                         height: 16.h, width: 16.h),
    //                                     getHorSpace(2.h),
    //                                     getCustomFont(service.rating!, 14.sp,
    //                                         regularBlack, 1,
    //                                         fontWeight: FontWeight.w400),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     );
    //                   },
    //                 ),
    //               ),
    //             )
    //           ],
    //         ).paddingSymmetric(horizontal: 20.h),
    //       ),
    //     ),
    //   ));
  }
}
