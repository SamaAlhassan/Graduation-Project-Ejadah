import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';

import '../../controller/controller.dart';
import '../../utils/color_category.dart';

class EditProfileSCreen extends StatefulWidget {
  const EditProfileSCreen({Key? key}) : super(key: key);

  @override
  State<EditProfileSCreen> createState() => _EditProfileSCreenState();
}

backClick() {
  Constant.backToFinish();
}

class _EditProfileSCreenState extends State<EditProfileSCreen> {
  EditProfileSCreenController editProfileSCreenController =
      Get.put(EditProfileSCreenController());
  // Define controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  // Fetch the auth controller
  final AuthController authController = Get.find<AuthController>();
  // Add a loading state
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Fetch and pre-fill user data
    loadUserData();
  }

  // Function to load user data and pre-fill the form
  Future<void> loadUserData() async {
    Map<String, dynamic>? userData = await authController.getUserData();

    if (userData != null) {
      setState(() {
        // Pre-fill the fields with the user data
        nameController.text = userData['name'] ?? '';
        emailController.text = userData['email'] ?? '';
        mobileController.text = userData['mobile'] ?? '';
      });
    }
  }

// Function to save the updated profile to Firestore
  Future<void> saveProfile() async {
    setState(() {
      isLoading = true;
    });

    try {
      String name = nameController.text;
      String mobile = mobileController.text;
      String email = emailController.text;

      // Get the current user ID
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String uid = currentUser.uid;

        // Update user data in Firestore
        await FirebaseFirestore.instance
            .collection('users_info')
            .doc(uid)
            .update({
          'name': name,
          'mobile': mobile,
          'email': email,
        });
        Get.snackbar('Success', 'Profile updated successfully.');
      }
    } catch (e) {
      // Show error if something goes wrong
      Get.snackbar('Error', 'Failed to update profile. Please try again.');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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
            body: SafeArea(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                getVerSpace(24.h),
                getCustomAppBar("Edit Profile", () {
                  Get.back(result:true); // This should trigger the refresh in MyProfileScreen
                }),
                getVerSpace(30.h),
                Stack(children: [
                  getAssetImage("app_icon_user.png",
                      height: 100.h, width: 100.w),
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: buttonColor),
                    child: getSvgImage("edit_icon.svg",
                            color: regularBlack, height: 30.h, width: 30.h)
                        .paddingAll(8.h),
                  ).paddingOnly(top: 82.h, left: 40.h),
                ]),
                getVerSpace(40.h),
                // Use TextFormField for editing the profile
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                getVerSpace(20.h),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                getVerSpace(20.h),
                TextFormField(
                  controller: mobileController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
              ],
            ),
            isLoading
                ? CircularProgressIndicator() // Show loading indicator when saving
                : getCustomButton("Save", () async {
              // Save the updated profile
              await saveProfile();
              Get.snackbar('Success', 'Profile updated successfully.');
              // Notify that the profile is updated and go back
              Get.back(result:true); // This should trigger the refresh in MyProfileScreen
            }).paddingOnly(bottom: 30.h)
          ],
        ).paddingSymmetric(horizontal: 20.h))));
  }
}
