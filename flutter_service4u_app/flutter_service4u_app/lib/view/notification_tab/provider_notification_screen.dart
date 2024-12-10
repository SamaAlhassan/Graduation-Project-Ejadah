import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_hub_app/utils/constant.dart';
import '../../utils/color_category.dart';
import '../../utils/constantWidget.dart';

class ProviderNotificationScreen extends StatelessWidget {
  final String providerId;

  const ProviderNotificationScreen({required this.providerId, Key? key})
      : super(key: key);

  backClick() {
    Constant.closeApp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVerSpace(24.h),
            getCustomFont("Notifications", 24.sp,
                    Get.isDarkMode ? regularWhite : regularBlack, 1,
                    fontWeight: FontWeight.w700)
                .paddingSymmetric(horizontal: 30.h),
            getVerSpace(20.h),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('new_orders')
                    .where('provider_id',
                        isEqualTo: providerId) // Filter by provider ID
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getSvgImage(
                            "no_notifications_icon.svg",
                            height: 100.h,
                            width: 100.h,
                          ),
                          getVerSpace(32.h),
                          getCustomFont(
                            "No notifications found",
                            20.sp,
                            regularBlack,
                            1,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    );
                  }

                  final notifications = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: notifications.length,
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.h),
                    itemBuilder: (context, index) {
                      var notification = notifications[index];
                      var data = notification.data() as Map<String, dynamic>;

                      print('Notification Data: $data');

                      // Determine the message based on the status
                      String orderNumber = data['order_number'] ?? 'N/A';
                      String status = data['status'] ?? 'unknown';
                      String message;

                      if (status == 'new') {
                        message =
                            "You have a new order!\nOrder Number: $orderNumber";
                      } else if (status == 'accepted') {
                        message = data['notification']?.isNotEmpty == true
                            ? data['notification']
                            : "You accepted the order '$orderNumber'!";
                      } else if (status == 'canceled') {
                        message = data['notification']?.isNotEmpty == true
                            ? data['notification']
                            : "You rejected the order '$orderNumber'!";
                      } else {
                        message = "Order '$orderNumber' has an unknown status.";
                      }

                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.h),
                              border: Border.all(color: grey20),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 56.h,
                                  width: 56.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.h),
                                    color: status == 'new'
                                        ? Colors.blue.shade100
                                        : status == 'accepted'
                                            ? Colors.green.shade100
                                            : Colors.red.shade100,
                                  ),
                                  child: getSvgImage(
                                    status == 'new'
                                        ? "new_order_icon.svg"
                                        : status == 'accepted'
                                            ? "true_icon.svg"
                                            : "close_icon.svg",
                                  ).paddingAll(15.h),
                                ),
                                getHorSpace(16.h),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getNotificationtext(
                                        message,
                                        "",
                                        "",
                                        secondtextcolor: Color(0XFF9A9FA5),
                                        firsttextcolor:
                                            context.theme.primaryColor,
                                      ),
                                      getVerSpace(8.h),
                                      getCustomFont(
                                        "Status: $status",
                                        12.sp,
                                        Color(0XFF535763),
                                        1,
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  ).paddingOnly(right: 40.h),
                                ),
                              ],
                            ).paddingAll(16.h),
                          ),
                          getVerSpace(
                              index == notifications.length - 1 ? 0.h : 12.h),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}