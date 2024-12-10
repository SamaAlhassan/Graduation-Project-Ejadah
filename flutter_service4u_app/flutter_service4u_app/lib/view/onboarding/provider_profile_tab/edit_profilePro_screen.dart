import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';

import '../../../controller/controller.dart';
import '../../../utils/color_category.dart';

class EditProfileProSCreen extends StatefulWidget {
  const EditProfileProSCreen({Key? key}) : super(key: key);

  @override
  State<EditProfileProSCreen> createState() => _EditProfileSCreenProState();
}

backClick() {
  Constant.backToFinish();
}

class _EditProfileSCreenProState extends State<EditProfileProSCreen> {
  EditProfileProSCreenController editProfileSCreenProController =
      Get.put(EditProfileProSCreenController());
  // Define controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController haveCarController = TextEditingController();
  TextEditingController workingHourController = TextEditingController();

  // Define selected values
  String? selectedMajor;
  String? selectedWorkingHour;

  // List of specializations (major)
  final List<String> specializations = [
    'Plumber',
    'HVAC Technician',
    'Electrician',
  ];

  // List of working hours
  final List<String> workingHours = [
    'From 8 AM until 12 PM',
    'From 4 PM until 9 PM',
  ];

  // Fetch the auth controller
  final AuthController authController = Get.find<AuthController>();
  // Add a loading state
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Fetch and pre-fill user data
    loadProviderData();
  }

  // Function to load user data and pre-fill the form
  Future<void> loadProviderData() async {
    Map<String, dynamic>? userData = await authController.getProviderData();

    if (userData != null) {
      setState(() {
        // Pre-fill the fields with the user data
        nameController.text = userData['name'] ?? '';
        emailController.text = userData['email'] ?? '';
        mobileController.text = userData['mobile'] ?? '';
        nationalityController.text = userData['nationality'] ?? '';
        selectedMajor = userData['major'] ?? '';
        haveCarController.text = userData['have a car?'] ?? '';
        selectedWorkingHour = userData['preferred working hours'] ?? '';
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
      String nationality = nationalityController.text;
      String major = selectedMajor ?? '';
      String haveCar = haveCarController.text;
      String workingHour = selectedWorkingHour ?? '';

      // Get the current user ID
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String uid = currentUser.uid;

        // Update user data in Firestore
        await FirebaseFirestore.instance
            .collection('providers_info')
            .doc(uid)
            .update({
          'name': name,
          'mobile': mobile,
          'email': email,
          'nationality': nationality,
          'major': major,
          'have a car?': haveCar,
          'preferred working hours': workingHour,
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

// Function to show major selection dialog
  void showMajorSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Major',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              ...specializations.map((major) => RadioListTile<String>(
                    title: Text(major),
                    value: major,
                    groupValue: selectedMajor,
                    onChanged: (value) {
                      setState(() {
                        selectedMajor = value;
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  )),
            ],
          ),
        );
      },
    );
  }

// Function to show working hours selection dialog
  void showWorkingHoursSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Preferred Working Hours',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              ...workingHours.map((workingHour) => RadioListTile<String>(
                    title: Text(workingHour),
                    value: workingHour,
                    groupValue: selectedWorkingHour,
                    onChanged: (value) {
                      setState(() {
                        selectedWorkingHour = value;
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  )),
            ],
          ),
        );
      },
    );
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
              Expanded(
                // Use Expanded to make the column take up available space
                child: SingleChildScrollView(
                  // Allows scrolling
                  child: Column(
                    children: [
                      getVerSpace(24.h),
                      getCustomAppBar("Edit Profile", () {
                        Get.back(result: true);
                      }),
                      getVerSpace(30.h),
                      Stack(
                        children: [
                          getAssetImage("app_icon_user.png",
                              height: 100.h, width: 100.w),
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: buttonColor),
                            child: getSvgImage("edit_icon.svg",
                                    color: regularBlack,
                                    height: 30.h,
                                    width: 30.h)
                                .paddingAll(8.h),
                          ).paddingOnly(top: 82.h, left: 40.h),
                        ],
                      ),
                      getVerSpace(20.h),
                      // Use TextFormField for editing the profile
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      getVerSpace(10.h),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      getVerSpace(10.h),
                      TextFormField(
                        controller: mobileController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                        ),
                      ),
                      getVerSpace(10.h),
                      TextFormField(
                        controller: nationalityController,
                        decoration: InputDecoration(
                          labelText: 'Nationality',
                        ),
                      ),
                      getVerSpace(10.h),
                      // Tap to select major
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap:
                                  showMajorSelection, // Function to show selection
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Major',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  Text(
                                    selectedMajor ??
                                        "None", // Show selected major
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      getVerSpace(10.h),
                      // Line divider similar to other fields
                      Container(
                        height: 1, // Height of the line
                        color: Colors.grey[900], // Color of the line
                      ),
                      getVerSpace(10.h),
                      TextFormField(
                        controller: haveCarController,
                        decoration: InputDecoration(
                          labelText: 'Have a Car?',
                        ),
                      ),
                      getVerSpace(10.h),
                      // Tap to select preferred working hours
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap:
                                  showWorkingHoursSelection, // Function to show working hours selection
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Preferred Working Hours',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  Text(
                                    selectedWorkingHour ??
                                        "None", // Show selected working hours
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Move the loading indicator and button outside of the SingleChildScrollView
              if (isLoading)
                CircularProgressIndicator() // Show loading indicator when saving
              else
                getCustomButton("Save", () async {
                  // Save the updated profile
                  await saveProfile();
                  Get.snackbar('Success', 'Profile updated successfully.');
                  // Notify that the profile is updated and go back
                  Get.back(result: true);
                }).paddingOnly(bottom: 30.h),
            ],
          ).paddingSymmetric(horizontal: 20.h),
        ),
      ),
    );
  }
}
