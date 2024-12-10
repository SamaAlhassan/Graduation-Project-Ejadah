import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../../routes/app_routes.dart';

class ForgotPasswordEmptyState extends StatefulWidget {
  @override
  State<ForgotPasswordEmptyState> createState() =>
      _ForgotPasswordEmptyStateState();
}

backClick() {
  Constant.backToFinish();
}

class _ForgotPasswordEmptyStateState extends State<ForgotPasswordEmptyState> {
  TextEditingController emailController = TextEditingController();
  final emailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
        onWillPop: () async {
          backClick();
          return false;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: SafeArea(
              child: Form(
            key: emailKey,
            child: Column(
              children: [
                getVerSpace(30.h),
                getCustomAppBar("Forgot Password", () {
                  backClick();
                }),
                getVerSpace(30.h),
                getTextField("Email Address", "email_icon.svg",
                    controller: emailController, validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Please enter email address';
                  } else {
                    if (!RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(email)) {
                      return 'Please enter valid email address';
                    }
                  }
                  return null;
                }),
                getVerSpace(54.h),
                getCustomButton("Submit", () {
                  if (emailKey.currentState!.validate()) {
                    // PrefData.setIsSignIn(false);
                    Constant.sendToNext(
                        context, Routes.resetPasswordScreenRoute);
                  }
                })
              ],
            ).paddingSymmetric(horizontal: 20.h),
          )),
        ));
  }
}
