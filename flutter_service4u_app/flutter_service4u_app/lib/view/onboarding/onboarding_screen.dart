import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../datafile/datafile.dart';
import '../../models/onbording_screen_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/color_category.dart';
import '../../utils/constant.dart';
import '../../utils/constantWidget.dart';
import '../../utils/pref_data.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OnBoardingScreenController onBoardingScreenController =
      Get.put(OnBoardingScreenController());
  PageController controller = PageController();
  List<OnBoarding> pages = DataFile.getOnbordingdata();

  backClick() {
    Constant.closeApp();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SafeArea(
            child: GetBuilder<OnBoardingScreenController>(
          init: OnBoardingScreenController(),
          builder: (onBoardingScreenController) => Stack(
            children: [
              generatepage(),
              indicator().paddingOnly(top: 720.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: getCustomButton(
                        onBoardingScreenController.currentPage ==
                                pages.length - 1
                            ? "Get Started"
                            : "Next",
                        onBoardingScreenController.currentPage ==
                                pages.length - 1
                            ? () {
                                PrefData.setIsIntro(false);
                                Constant.sendToNext(
                                    context, Routes.signInEmptyStateRoute);
                              }
                            : () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.bounceIn);
                              })
                    .paddingOnly(left: 20.h, right: 20.h, bottom: 30.h),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget generatepage() {
    return PageView.builder(
        itemCount: pages.length,
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (value) {
          onBoardingScreenController.onPageChange(value);
        },
        itemBuilder: (context, index) {
          print(controller.initialPage);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 544.h,
                  width: double.infinity,
                  child:
                      getAssetImage(pages[index].image!, boxFit: BoxFit.cover)),
              getVerSpace(20.h),
              getMultilineCustomFont(
                pages[index].title!,
                32.h,
                textColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w800,
              ).paddingSymmetric(horizontal: 71.h),
              getVerSpace(12.h),
              getMultilineCustomFont(
                pages[index].discription!,
                16.sp,
                grey40,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              getVerSpace(30.h),
            ],
          );
        });
  }

  Widget indicator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(pages.length, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 8.h,
            width: 8.h,
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 30.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.h),
                color: (index == onBoardingScreenController.currentPage)
                    ? darkYellow
                    : darkYellow.withOpacity(0.2)),
          );
        }));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
