import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/controller/controller.dart';
import '../../utils/constant.dart';
import '../../utils/constantWidget.dart';

class VerificationProviderScreen extends StatefulWidget {
  @override
  State<VerificationProviderScreen> createState() => _VerificationProviderScreenState();
}



class _VerificationProviderScreenState extends State<VerificationProviderScreen> {
 VerificationScreenController verificationProviderScreenController  =
      Get.put(VerificationScreenController());
  TextEditingController otpController = TextEditingController();
  final formKeyV = GlobalKey<FormState>();

  backClick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<VerificationProviderScreenController>(
      init: VerificationProviderScreenController(),
      builder: (verificationProviderController) => WillPopScope(
        onWillPop: () async {
          backClick();
          return false;
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Form(
              key: formKeyV,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(30.h),
                  getCustomAppBar("Verification", () {
                    backClick();
                  }),
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          getVerSpace(30.h),
                          getTextField("Enter OTP", "otp_icon.svg",
                              controller: otpController, validator: (otp) {
                            if (otp == null || otp.isEmpty) {
                              return 'Please enter OTP';
                            }
                            return null;
                          }),
                          getVerSpace(28.h),
                          getCustomButton("Verify OTP", () {
                            if (formKeyV.currentState!.validate()) {
                              // Perform OTP verification logic for the provider
                              // Navigate to the next screen upon successful verification
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ).paddingOnly(left: 20.h, right: 20.h),
            ),
          ),
        ),
      ),
    );
  }
}

