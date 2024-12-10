import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/models/categories_model.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constant.dart';
// import 'package:service_hub_app/view/home_tab/categories_screens/beauty_categories_screens/beaty_screen.dart';
// import 'package:service_hub_app/view/home_tab/categories_screens/cleaning_categories_screens/cleaning_service_screen.dart';
import '../../../controller/controller.dart';
import '../../../utils/constantWidget.dart';
import 'ac_repair_categories_screens/ac_repair_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// List categoriesClass = [
//   ACRepairScreen(),
//   BeautyScreen(),
//   ApplianceCategoriesScreen(),
//   PaintingScreen(),
//   CleaningServiceScreen(),
//   PlumbingScreen(),
//   ElectronicScreen(),
//   ShiftingScreen(),
//   MensSalonScreen()
// ];
List categoriesClass = [
  ACRepairScreen(),
  // BeautyScreen(),
  ACRepairScreen(),
  ACRepairScreen(),
  // CleaningServiceScreen(),
  ACRepairScreen(),
  ACRepairScreen(),
  ACRepairScreen(),
  ACRepairScreen()
];

backclick() {
  Constant.backToFinish();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesScreenController categoriesScreenController =
      Get.put(CategoriesScreenController());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
        onWillPop: () async {
          backclick();
          return false;
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                getVerSpace(32.h),
                getSearchField("Search...", fillColor: grey10),
                Expanded(
                    child: Container(
                        color: context.theme.focusColor,
                        child: Column(
                          children: [
                            getVerSpace(20.h),
                            GetBuilder<HomeScreenController>(
                              init: HomeScreenController(),
                              builder: (homeScreenController) => Expanded(
                                child: Container(
                                  child: GridView.builder(
                                    itemCount:
                                        homeScreenController.categories.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 24.h,
                                            crossAxisSpacing: 20.h,
                                            mainAxisExtent: 108.h),
                                    itemBuilder: (context, index) {
                                      Categories categories =
                                          homeScreenController
                                              .categories[index];
                                      return animation_function(
                                          index,
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(categoriesClass[index]);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.h),
                                                  color: grey10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      height: 60.h,
                                                      width: 60.h,
                                                      child: getAssetImage(
                                                          categories.icon!)),
                                                  getVerSpace(4.h),
                                                  getCustomFont(
                                                      categories.name!,
                                                      16.sp,
                                                      Color(0XFF41405D),
                                                      1,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      txtHeight: 1.5.h)
                                                ],
                                              ).paddingSymmetric(
                                                  vertical: 10.h),
                                            ),
                                          ));
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        )))
              ],
            ).paddingSymmetric(horizontal: 20.h),
          ),
        ));
  }
}
