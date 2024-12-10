import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/view/notification_tab/notification_screen.dart';
import 'package:service_hub_app/view/profile_tab/profile_screen.dart';

import '../controller/controller.dart';
import '../utils/constant.dart';
import '../utils/constantWidget.dart';
import '../utils/drawe_data.dart';
import 'booking_tab/booking_tab_screen.dart';
import 'home_tab/home_screen.dart';


class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);


  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>(); // Unique key for this instance
  closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemNavigator.pop();
    });
  }
HomeMainScreenController homeMainScreenController = Get.find<HomeMainScreenController>();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<HomeMainScreenController>(
      init: HomeMainScreenController(),
      builder: (homeMainScreenController) => WillPopScope(
        onWillPop: () async{
          closeApp();
          return false;
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          key: drawerKey,
          drawer: Drawer(
            child: DrawerData()
          ),
          body: _body(),
          bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 27),
                      color: regularBlack.withOpacity(0.04),
                      spreadRadius: -4,
                      blurRadius: 12),
                ],
              ),
              child: ClipRRect(

                child: BottomNavigationBar(
                    backgroundColor: const Color(0XFFFFFFFF),
                    currentIndex: homeMainScreenController.position.value,
                    onTap: (index) {
                      // setState(() {
                      //   currentvalue = index;
                      // });
                      homeMainScreenController.onChange(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [


                              getSvgImage("selected_home_icon.svg"),
                              getVerSpace(4.h),
                              getSvgImage("blue_line_hor.svg"),
                            ],
                          ),
                          icon:  getSvgImage("unselected_home_icon.svg"),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [


                              getSvgImage("select_booking_icon.svg"),
                              getVerSpace(4.h),
                              getSvgImage("blue_line_hor.svg"),
                            ],
                          ),
                          icon:  getSvgImage("unselect_booking_icon.svg"),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [


                              getSvgImage("selected_notification_icon.svg"),
                              getVerSpace(4.h),
                              getSvgImage("blue_line_hor.svg"),
                            ],
                          ),
                          icon: getSvgImage("unselected_notification_icon.svg"),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [


                              getSvgImage("selected_profile_icon.svg"),
                              getVerSpace(4.h),
                              getSvgImage("blue_line_hor.svg"),
                            ],
                          ),
                          icon: getSvgImage("profile_icon.svg"),
                          label: ''),
                    ]),
              )),
        ),
      ),
    );
  }

  _body() {
    switch (homeMainScreenController.position.value) {
      case 0:
        return HomeScreen();
      case 1:
        return BookingScreen();
    //FavouriteItemScreen();

      case 2:
        return NotificationScreen();
    //NoCartItemScreen();
      case 3:
        return ProfileScreen();
      default:
        return const Center(
          child: Text("inavalid"),
        );
    }
  }
}
