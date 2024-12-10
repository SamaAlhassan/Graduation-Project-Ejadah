import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/view/notification_tab/provider_notification_screen.dart';
import 'package:service_hub_app/view/onboarding/provider_profile_tab/provider_profile_screen.dart';
import 'package:service_hub_app/view/onboarding/provider_profile_tab/new_orders_screen.dart';
import '../controller/controller.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../utils/drawe_data.dart';
import 'onboarding/provider_profile_tab/provider_Booking.dart';

class ProviderServiceScreen extends StatefulWidget {
  const ProviderServiceScreen({Key? key}) : super(key: key);

  @override
  State<ProviderServiceScreen> createState() => _ProviderServiceScreenState();
}

class _ProviderServiceScreenState extends State<ProviderServiceScreen> {
  final ProviderServiceScreenController providerServiceScreenController =
      Get.put(ProviderServiceScreenController());

  @override
  void initState() {
    super.initState();
    _listenForNotifications();
  }

  void closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemNavigator.pop();
    });
  }

  void _listenForNotifications() {
    // Listen for new order notifications for the specific provider
    FirebaseFirestore.instance
        .collection('new_orders')
        .where('provider_id', isEqualTo: providerServiceScreenController.providerId.value)
        .where('status', isEqualTo: 'new')
        .snapshots()
        .listen((snapshot) {
      // Update the controller's notification flag based on query result
      providerServiceScreenController.hasNewNotifications.value = snapshot.docs.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<ProviderServiceScreenController>(
      init: ProviderServiceScreenController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          closeApp();
          return false;
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          key: ProviderServiceScreenController.drawerKey,
          drawer: Drawer(child: DrawerData()), // Ensure DrawerData is implemented
          body: _body(),
          bottomNavigationBar: Obx(
            () => Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 27),
                    color: regularBlack.withOpacity(0.04),
                    spreadRadius: -4,
                    blurRadius: 12,
                  ),
                ],
              ),
              child: ClipRRect(
                child: BottomNavigationBar(
                  backgroundColor: const Color(0XFFFFFFFF),
                  currentIndex: controller.position.value,
                  onTap: (index) {
                    controller.onChange(index);
                  },
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: Column(
                        children: [
                          getSvgImage("selected_order.svg",
                              width: 24, height: 24, color: Colors.blue[900]),
                          getVerSpace(4.h),
                          getSvgImage("blue_line_hor.svg"),
                        ],
                      ),
                      icon: getSvgImage("unselected_order.svg", width: 24, height: 24),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Column(
                        children: [
                          getSvgImage("select_booking_icon.svg"),
                          getVerSpace(4.h),
                          getSvgImage("blue_line_hor.svg"),
                        ],
                      ),
                      icon: getSvgImage("unselect_booking_icon.svg"),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Stack(
                        children: [
                          Column(
                            children: [
                              getSvgImage("selected_notification_icon.svg"),
                              getVerSpace(4.h),
                              getSvgImage("blue_line_hor.svg"),
                            ],
                          ),
                          if (controller.hasNewNotifications.value)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                        ],
                      ),
                      icon: Stack(
                        children: [
                          getSvgImage("unselected_notification_icon.svg"),
                          if (controller.hasNewNotifications.value)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                        ],
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Column(
                        children: [
                          getSvgImage("selected_profile_icon.svg"),
                          getVerSpace(4.h),
                          getSvgImage("blue_line_hor.svg"),
                        ],
                      ),
                      icon: getSvgImage("profile_icon.svg"),
                      label: '',
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

  Widget _body() {
    switch (providerServiceScreenController.position.value) {
      case 0:
        return NewOrdersScreen(providerId: providerServiceScreenController.providerId.value);
      case 1:
        return ProviderBookingScreen(providerId: providerServiceScreenController.providerId.value);
      case 2:
        // Notification screen with the providerId passed
        return ProviderNotificationScreen(providerId: providerServiceScreenController.providerId.value);
      case 3:
        return ProviderProfileScreen();
      default:
        return const Center(
          child: Text("Invalid"),
        );
    }
  }
}

