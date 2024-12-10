import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/models/appliance_categories_data_model.dart';
import 'package:service_hub_app/utils/color_category.dart';
import '../../../../controller/controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/constantWidget.dart';

class ApplianceScreen extends StatefulWidget {
  @override
  State<ApplianceScreen> createState() => _ApplianceScreenState();
}

class _ApplianceScreenState extends State<ApplianceScreen> {
  ApplianceRepairScreenController applianceScreenController =
      Get.put(ApplianceRepairScreenController());
  TextEditingController searchController = TextEditingController();

  backclick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<ApplianceRepairScreenController>(
        init: ApplianceRepairScreenController(),
        builder: (applianceScreenController) => WillPopScope(
            onWillPop: () async {
              backclick();
              return false;
            },
            child: Scaffold(
              body: SafeArea(
                child: all_service_categories_screen_formate(
                    "Appliance Repair",
                    () {
                      applianceScreenController.setList();
                    },
                    applianceScreenController.list,
                    () {
                      applianceScreenController.setGrid();
                    },
                    applianceScreenController.grid,
                    GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount:
                          applianceScreenController.allApplianceService.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              applianceScreenController.list ? 1 : 2,
                          mainAxisSpacing: 24.h,
                          crossAxisSpacing:
                              applianceScreenController.list ? 0 : 20.h,
                          mainAxisExtent:
                              applianceScreenController.list ? 110 : 203.h),
                      itemBuilder: (BuildContext context, int index) {
                        ApplianceService service = applianceScreenController
                            .allApplianceService[index];
                        return applianceScreenController.list
                            ? animation_function(
                                index,
                                GestureDetector(
                                  onTap: () {
                                    Constant.sendToNext(context,
                                        Routes.acRepairServiceDetailScreenRoute,
                                        arguments: {
                                          // service.title
                                          'title': service.title,
                                          'price': service.price,
                                          'rating': service.rating
                                          });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.h),
                                        border: Border.all(color: grey20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 102.h,
                                              width: 101.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.h),
                                                  image: DecorationImage(
                                                      image: AssetImage(Constant
                                                              .assetImagePath +
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
                                                getCustomFont(service.title!,
                                                    14.sp, regularBlack, 1,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                getVerSpace(4.h),
                                                getCustomFont(
                                                    "\$${service.price}",
                                                    14.sp,
                                                    regularBlack,
                                                    1,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                getVerSpace(12.h),
                                                Center(
                                                  child: Row(
                                                    children: [
                                                      getSvgImage(
                                                          "star_icon.svg"),
                                                      getHorSpace(6.h),
                                                      Center(
                                                        child: getCustomFont(
                                                            service.rating!,
                                                            14.sp,
                                                            regularBlack,
                                                            1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        service.discount == ""
                                            ? SizedBox()
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(),
                                                  getCustomFont(
                                                      "Off ${service.discount}%",
                                                      14.sp,
                                                      grey40,
                                                      1,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ],
                                              ).paddingOnly(
                                                right: 12.h, bottom: 24.h)
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
                                    Constant.sendToNext(context,
                                        Routes.acRepairServiceDetailScreenRoute,
                                        arguments: {
                                          'title': service.title,
                                          'price': service.price,
                                          'rating': service.rating
                                          });
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
  }
}