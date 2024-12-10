import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/view/sign_in/sign_in_empty_state.dart';
import '../../controller/controller.dart';
import '../../utils/constant.dart';
import '../../utils/constantWidget.dart';

class ResetPasswordScreen extends StatefulWidget {

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

backClick() {
  Constant.backToFinish();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordScreenController resetPasswordScreenController = Get.put(ResetPasswordScreenController());
  TextEditingController oldPassordController = TextEditingController();
  TextEditingController newPassordController = TextEditingController();
  TextEditingController confirmPassordController = TextEditingController();
  final passwordKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<ResetPasswordScreenController>(
      init:ResetPasswordScreenController() ,
      builder:(resetPasswordScreenController) =>  WillPopScope(
          onWillPop: () async {
            backClick();
            return false;
          },
          child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: SafeArea(
                child: Form(
              key: passwordKey,
              child: Column(
                children: [
                  getVerSpace(30.h),
                  getCustomAppBar("Reset Password", () {
                    backClick();
                  }),
                  getVerSpace(30.h),
                  getTextField(function: (){},obsequrePermition: resetPasswordScreenController.oldpassVisibility,"Old Password","lock_icon.svg",suffixiconpermition: true,controller: oldPassordController,widget: GestureDetector(onTap: (){
                    resetPasswordScreenController.setOldPasswordVisibility();
                  },child: getSvgImage(resetPasswordScreenController.oldpassVisibility?"eye_icon.svg":"selected_eye_icon.svg").paddingOnly(top: 15.h,bottom: 17.h,right: 18.h)),
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter valid password';
                        }
                        return null;
                      }),
                  getVerSpace(28.h),
                  getTextField(function: (){},obsequrePermition: resetPasswordScreenController.newpassVisibility,"New Password","lock_icon.svg",suffixiconpermition: true,controller: newPassordController,widget: GestureDetector(onTap: (){
                    resetPasswordScreenController.setNewPasswordVisibility();
                  },child: getSvgImage(resetPasswordScreenController.newpassVisibility?"eye_icon.svg":"selected_eye_icon.svg").paddingOnly(top: 15.h,bottom: 17.h,right: 18.h)),
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter valid password';
                        }
                        return null;
                      }),
                  getVerSpace(28.h),
                  getTextField(function: (){},obsequrePermition: resetPasswordScreenController.newpassVisibility,"Confirm Password","lock_icon.svg",suffixiconpermition: true,controller: confirmPassordController,widget: GestureDetector(onTap: (){
                    resetPasswordScreenController.setConfirmPasswordVisibility();
                  },child: getSvgImage(resetPasswordScreenController.confirmpassVisibility?"eye_icon.svg":"selected_eye_icon.svg").paddingOnly(top: 15.h,bottom: 17.h,right: 18.h)),
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter valid password';
                        }
                        return null;
                      }),
                  getVerSpace(54.h),
                  getCustomButton("Submit", () {
                    if (passwordKey.currentState!.validate()) {
                      if (confirmPassordController.text ==
                          newPassordController.text) {
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
                                            color: Color(0XFF23408F)
                                                .withOpacity(0.08))
                                      ]),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      getAssetImage("password_change_icon.png",
                                          height: 130.h, width: 130.h),
                                      getVerSpace(24.h),
                                      getCustomFont("Password Changed", 22.sp,
                                          context.theme.primaryColor, 1,
                                          fontWeight: FontWeight.w700),
                                      getVerSpace(10.h),
                                      Container(
                                        width: 292.h,
                                        child: getMultilineCustomFont(
                                            "Your password has been successfully changed!",
                                            16.sp,
                                            context.theme.primaryColor,
                                            fontWeight: FontWeight.w400,
                                            textAlign: TextAlign.center),
                                      ),
                                      getVerSpace(30.h),
                                      getCustomButton("Ok", buttonheight: 60.h,
                                          () {
                                        Get.off(SignInEmptyState());
                                      }).paddingSymmetric(horizontal: 30.h),
                                    ],
                                  ).paddingSymmetric(vertical: 40.h),
                                ),
                              ).paddingSymmetric(horizontal: 20.h);
                            });
                      } else {
                        Fluttertoast.showToast(

                          msg: "Not match Confirm password and New password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: buttonColor,
                          textColor: Colors.red,
                          fontSize: 16.sp,
                        );
                      }
                    }
                  })
                ],
              ).paddingSymmetric(horizontal: 20.h),
            )),
          )),
    );
  }
}
