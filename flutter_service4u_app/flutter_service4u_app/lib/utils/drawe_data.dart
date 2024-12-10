import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';

import '../controller/controller.dart';
import '../models/side_menu_data_model.dart';
import '../view/home_tab/categories_screens/ac_repair_categories_screens/add_new_card_screen.dart';
import '../view/home_tab/categories_screens/ac_repair_categories_screens/payment_screen.dart';
import '../view/home_tab/side_menu_screens/side_menu_address_screen.dart';
import '../view/home_tab/side_menu_screens/side_menu_calender_screen.dart';
import '../view/home_tab/side_menu_screens/side_menu_notification_screen.dart';
import '../view/home_tab/side_menu_screens/side_menu_support_screen.dart';

class DrawerData extends StatefulWidget {
  @override
  State<DrawerData> createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  SideDrawerController sideDrawerController = Get.put(SideDrawerController());
  List sideMenuClass = [
    CalendarScreen(),
    PayMentScreen(),
    SideMenuAddressScreen(),
    SideMenuNotificationScreen(),
    SideMenuSupportScreen(),
  ];

  String userName = "Loading...";
  String userEmail = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      Map<String, dynamic>? userData =
          await fetchUserData(currentUser.uid); // Fetch user data from Firestore

      if (userData != null) {
        setState(() {
          userName = userData['name'] ?? "User Name"; // Set user name
          userEmail = userData['email'] ?? "Email not available"; // Set email
        });
      }
    }
  }

  Future<Map<String, dynamic>?> fetchUserData(String uid) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users_info')
          .doc(uid)
          .get();

      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>; // Return user data
      } else {
        print("User not found in Firestore");
        return null;
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getVerSpace(17.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      height: 42.h,
                      width: 42.h,
                      child: getAssetImage("user-icon.png")),
                  getHorSpace(12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getCustomFont(userName, 16.sp, regularBlack, 1,
                          fontWeight: FontWeight.w400),
                      SizedBox(height: 8.h),
                      getCustomFont(userEmail, 12.sp, grey40, 1,
                          fontWeight: FontWeight.w400),
                    ],
                  )
                ],
              ),
              GestureDetector(
                  onTap: () {
                    backClick();
                  },
                  child: getSvgImage("close_icon.svg"))
            ],
          ),
          getVerSpace(24.h),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: sideDrawerController.sidemenu.length,
            itemBuilder: (context, index) {
              SideMenu side = sideDrawerController.sidemenu[index];
              return GetBuilder<SideDrawerController>(
                init: SideDrawerController(),
                builder: (sideDrawerController) =>
                    GetBuilder<SideMenuPaymentMenuScreenController>(
                  init: SideMenuPaymentMenuScreenController(),
                  builder: (sideMenuPaymentMenuScreenController) =>
                      GestureDetector(
                    onTap: () {
                      sideDrawerController.setSelectedId(side.id);
                      if (index == 2) {
                        sideDrawerController.addAddessScreen(false);
                      }
                      if (index == 1) {
                        sideMenuPaymentMenuScreenController
                            .setPaymentScreen(false);
                      }
                      Get.to(sideMenuClass[index]);
                    },
                    child: Container(
                      decoration: sideDrawerController.selectedID == side.id
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(15.h),
                              color: grey10)
                          : BoxDecoration(),
                      child: Row(
                        children: [
                          getSvgImage(sideDrawerController.selectedID == side.id
                              ? side.selectedicon!
                              : side.unselectedicon!),
                          getHorSpace(12.h),
                          getCustomFont(side.name!, 16.sp, regularBlack, 1,
                              fontWeight:
                                  sideDrawerController.selectedID == side.id
                                      ? FontWeight.w500
                                      : FontWeight.w400,
                              txtHeight: 1.5.h)
                        ],
                      ).paddingAll(16.h),
                    ).paddingSymmetric(vertical: 4.h),
                  ),
                ),
              );
            },
          ),
        ],
      ).paddingSymmetric(horizontal: 16.h),
    );
  }
}
