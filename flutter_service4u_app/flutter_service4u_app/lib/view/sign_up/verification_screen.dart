import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/color_category.dart';
import '../../utils/constant.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../utils/constantWidget.dart';
import '../../utils/pref_data.dart';

class VerificationScreen extends StatefulWidget {
  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  VerificationScreenController verificationScreenController =
      Get.put(VerificationScreenController());

  backClick() {
    Constant.backToFinish();
  }

  String otp = '';

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<VerificationScreenController>(
      init: VerificationScreenController(),
      builder: (verificationScreenController) => WillPopScope(
          onWillPop: () async {
            backClick();
            return false;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerSpace(30.h),
                getCustomAppBar("Verification", () {
                  backClick();
                }),
                getVerSpace(30.h),
                Container(
                  height: 59.h,
                  child: OtpTextField(
                    onSubmit: (value) {
                      setState(() {
                        otp = '';
                        otp = value;
                      });
                    },
                    filled: true,
                    fillColor: fillTextField,
                    cursorColor: buttonColor,
                    borderColor: fillTextField,
                    numberOfFields: 5,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    enabledBorderColor: fillTextField,
                    showFieldAsBox: true,
                    borderRadius: BorderRadius.circular(4.h),
                    borderWidth: 1,
                    focusedBorderColor: buttonColor,
                    fieldWidth: 59.h,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                    ),
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                getVerSpace(50.h),
                getCustomButton(
                  "Verify",
                  () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            insetPadding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.h)),
                            backgroundColor: regularWhite,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32.h),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(-4, 5),
                                        blurRadius: 16,
                                        color:
                                            Color(0XFF23408F).withOpacity(0.08))
                                  ]),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  getAssetImage("account_created_icon.png",
                                      height: 130.h, width: 130.h),
                                  getVerSpace(24.h),
                                  getCustomFont("Account Created", 22.sp,
                                      context.theme.primaryColor, 1,
                                      fontWeight: FontWeight.w700),
                                  getVerSpace(10.h),
                                  Container(
                                    width: 292.h,
                                    child: getMultilineCustomFont(
                                        "Your account has been successfully created!",
                                        16.sp,
                                        context.theme.primaryColor,
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.center),
                                  ),
                                  getVerSpace(30.h),
                                  getCustomButton("Ok", buttonheight: 60.h, () {
                                    PrefData.setIsSignIn(false);
                                    Constant.sendToNext(
                                        context, Routes.homeMainScreenRoute);
                                  }).paddingSymmetric(horizontal: 30.h),
                                ],
                              ).paddingSymmetric(vertical: 40.h),
                            ),
                          ).paddingSymmetric(horizontal: 20.h);
                        });
                    // Get.defaultDialog(
                    //     contentPadding: EdgeInsets.zero,
                    //     title: '',
                    //     content: Column(
                    //       children: [
                    //         getAssetImage("account_created_icon.png"),
                    //         getVerSpace(24.h),
                    //         getCustomFont("", 22.sp,
                    //             context.theme.primaryColor, 1,
                    //             fontWeight: FontWeight.w700),
                    //         getVerSpace(10.h),
                    //         getCustomFont(
                    //             "",
                    //             16.sp,
                    //             context.theme.primaryColor,
                    //             1,
                    //             fontWeight: FontWeight.w400,
                    //             textAlign: TextAlign.center),
                    //         getVerSpace(30.h),
                    //         getCustomButton("Ok", () {

                    //         })
                    //             .paddingSymmetric(horizontal: 30.h),
                    //         getVerSpace(20.h),
                    //       ],
                    //     ));
                    //
                  },
                ),
                getVerSpace(50.h),
                Center(
                  child: getRichtext("Didn’t recieve code?", " Resend",
                      function: () {
                    // Constant.sendToNext(context, Routes.sinUpEmptyStateRoute);
                  },
                      firstTextwidth: FontWeight.w400,
                      firsttextSize: 14.sp,
                      secondTextwidth: FontWeight.w500,
                      secondtextSize: 16.sp,
                      firsttextcolor: context.theme.primaryColor,
                      secondtextcolor: context.theme.primaryColor),
                )
              ],
            ).paddingSymmetric(horizontal: 20.h)),
          )),
    );
  }
}
