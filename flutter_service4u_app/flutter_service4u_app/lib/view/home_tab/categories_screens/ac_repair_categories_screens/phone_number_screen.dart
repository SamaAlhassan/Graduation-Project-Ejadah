import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/controller.dart';
import '../../../../utils/color_category.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/constantWidget.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final PhoneNumberScreenController phoneNumberScreenController = Get.put(PhoneNumberScreenController());
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the phone number in the controller
    phoneNumberController.text = phoneNumberScreenController.defaultPhoneNumber ?? "";
  }

  void backClick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVerSpace(24.h),
            getCustomAppBar("Change Phone Number", () {
              backClick();
            }),
            getVerSpace(24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  TextField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter new phone number",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  getVerSpace(24.h),
                  ElevatedButton(
                    onPressed: () {
                      // Get the new phone number from the text field
                      String newPhoneNumber = phoneNumberController.text;

                      // Update phone number in the controller
                      phoneNumberScreenController.updatePhoneNumber(newPhoneNumber);

                      // Return to the previous screen and pass back the new phone number
                      Navigator.of(context).pop(newPhoneNumber);
                    },
                    child: Text("Save"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 114, 181, 236),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
