import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';

class SignInEmptyState extends StatefulWidget {
  @override
  State<SignInEmptyState> createState() => _SignInEmptyStateState();
}

class _SignInEmptyStateState extends State<SignInEmptyState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final SignInEmptyStateController signInEmptyStateController =
      Get.put(SignInEmptyStateController());
  final GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());

  void backClick() {
    Constant.closeApp();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SignInEmptyStateController>(
      init: SignInEmptyStateController(),
      builder: (signInEmptyStateController) => WillPopScope(
        onWillPop: () async {
          backClick();
          return false;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Form(
              key: loginForm,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        children: [
                          getVerSpace(30.h),
                          getCustomFont(
                              "Sign in", 24.h, context.theme.primaryColor, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(30.h),
                          getTextField("Email", "email_icon.svg",
                              function: () {},
                              controller: emailController, validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please enter email address';
                            } else if (!RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(email)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          }),
                          getVerSpace(28.h),
                          getTextField("Password", "lock_icon.svg",
                              function: () {},
                              obsequrePermition:
                                  signInEmptyStateController.passVisibility,
                              suffixiconpermition: true,
                              controller: passWordController,
                              widget: GestureDetector(
                                  onTap: () {
                                    signInEmptyStateController
                                        .setPasswordVisibility();
                                  },
                                  child: getSvgImage(signInEmptyStateController
                                              .passVisibility
                                          ? "eye_icon.svg"
                                          : "selected_eye_icon.svg")
                                      .paddingOnly(
                                          top: 15.h,
                                          bottom: 17.h,
                                          right: 18.h)), validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          }),
                          getVerSpace(24.h),
                          GestureDetector(
                            onTap: () {
                              Constant.sendToNext(context,
                                  Routes.forgotPasswordEmptyStateRoute);
                            },
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: getCustomFont("Forgot Password?", 16.sp,
                                    context.theme.primaryColor, 1,
                                    fontWeight: FontWeight.w400)),
                          ),
                          getVerSpace(50.h),
                          getCustomButton("Sign In", () async {
                            if (loginForm.currentState!.validate()) {
                              String email = emailController.text.trim();
                              String password = passWordController.text.trim();
                              // Trigger sign-in and check if it's a provider
                              int isProvider = await authController
                                  .signInWithEmailAndPassword(email, password);

                              // Only navigate if authentication was successful
                              if (isProvider == 1) {
                                Get.snackbar('Success','Successfully signed in as Provider with email: $email');
                                Get.offAllNamed(
                                    Routes.ProviderServiceScreenRoute);
                              } else if (isProvider == 2) {
                                Get.snackbar('Success','Successfully signed in as User with email: $email');
                                Get.offAllNamed(Routes.homeMainScreenRoute);
                              } else {
                                // If null or any other unexpected case, show an error message
                                Get.snackbar('Error','Sign-in failed. Please try again.');
                              }
                            }
                          }),
                          getVerSpace(50.h),
                          Center(
                              child: getCustomFont("Sign in with", 16.sp,
                                  context.theme.primaryColor, 1,
                                  fontWeight: FontWeight.w400)),
                          getVerSpace(20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              google_facebook_ios_button("google_logo.svg"),
                              getHorSpace(30.h),
                              google_facebook_ios_button("facebook_logo.svg"),
                              getHorSpace(30.h),
                              google_facebook_ios_button("apple_logo.svg")
                            ],
                          ),
                          getVerSpace(30.h),
                          Center(
                            child: getRichtext(
                                "Don’t have an account?", " Sign up",
                                function: () {
                              Constant.sendToNext(
                                  context, Routes.sinUpEmptyStateRoute);
                            },
                                firstTextwidth: FontWeight.w400,
                                firsttextSize: 14.sp,
                                secondTextwidth: FontWeight.w500,
                                secondtextSize: 16.sp,
                                firsttextcolor: context.theme.primaryColor,
                                secondtextcolor: context.theme.primaryColor),
                          ),
                          getVerSpace(30.h),
                          Center(
                            child: getRichtext("New provider?", " Join us",
                                function: () {
                              Constant.sendToNext(
                                  context, Routes.SignUpProviderEmptyState);
                            },
                                firstTextwidth: FontWeight.w400,
                                firsttextSize: 14.sp,
                                secondTextwidth: FontWeight.w500,
                                secondtextSize: 16.sp,
                                firsttextcolor: context.theme.primaryColor,
                                secondtextcolor: context.theme.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
