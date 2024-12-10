import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/view/home_tab/categories_screens/ac_repair_categories_screens/add_new_card_screen.dart';

import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';
import '../../utils/constantWidget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  MyProfileScreenController myProfileScreenController =
      Get.put(MyProfileScreenController());

  final AuthController authController = Get.find<AuthController>();
  // Variables to store user data
  String name = "";
  String email = "";
  String mobile = "";

  @override
  void initState() {
    super.initState();
    // Fetch user data when the screen initializes
    fetchUserData();
  }

  // This function is marked async to allow awaiting the user data
  Future<void> fetchUserData() async {
    // Call the function to get user data
    Map<String, dynamic>? userData = await authController.getUserData();
    if (userData != null) {
      setState(() {
        name = userData['name'] ?? "N/A";
        email = userData['email'] ?? "N/A";
        mobile = userData['mobile'] ?? "N/A";
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
      child: GetBuilder<MyProfileScreenController>(
        init: MyProfileScreenController(),
        builder: (myProfileScreenController) => Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    getVerSpace(24.h),
                    getCustomAppBar("My Profile", () {
                      Get.back(result:true); // This should trigger the refresh in MyProfileScreen
                    }),
                    getVerSpace(30.h),
                    getAssetImage("app_icon_user.png",
                        height: 100.h, width: 100.h),
                    getVerSpace(20.h),
                    getVerSpace(40.h),
                    getMyprofileDetailFormate("profile_icon.svg", "Name", name),
                    getVerSpace(20.h),
                    getDivider(),
                    getVerSpace(20.h),
                    getMyprofileDetailFormate("email_icon.svg", "Email", email),
                    getVerSpace(20.h),
                    getDivider(),
                    getVerSpace(20.h),
                    getMyprofileDetailFormate(
                        "call_icon.svg", "Phone Number", mobile),
                    getVerSpace(30.h),
                  ],
                ).paddingSymmetric(horizontal: 20.h),
                getCustomButton("Edit Profile", () async {
                  // Navigate to Edit Profile and await the result
                  var result = await Get.toNamed(Routes.editProfileSCreenRoute);
                  // If the result is true, refresh the user data
                  if (result == true) {
                    fetchUserData();
                  }
                }).paddingSymmetric(horizontal: 20.h),
              ],
            ).paddingOnly(bottom: 30.h),
          ),
        ),
      ),
    );
  }
}
