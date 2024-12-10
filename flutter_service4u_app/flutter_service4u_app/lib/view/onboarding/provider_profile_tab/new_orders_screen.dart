import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../provider_profile_tab/provider_Booking.dart';

class NewOrdersScreen extends StatelessWidget {
  final String providerId;

  NewOrdersScreen({required this.providerId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVerSpace(24.h),
            getCustomFont("New Orders", 24.sp,
                    Get.isDarkMode ? regularWhite : regularBlack, 1,
                    fontWeight: FontWeight.w700)
                .paddingSymmetric(horizontal: 30.h),
            getVerSpace(20.h),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('new_orders')
                    // .where('provider_id', isEqualTo: providerId)
                    .where('status', isEqualTo: 'new')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                        child:
                            Text('Error fetching orders: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text('No new orders available.'));
                  }

                  final orders = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      var order = orders[index];
                      var data = order.data() as Map<String, dynamic>;

                      return Column(
                        children: [
                          getVerSpace(20.h),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.h),
                              border: Border.all(color: grey20),
                              color: Colors.grey.shade100,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    // Service Icon and Name in Same Row
                                    Container(
                                      height: 56.h,
                                      width: 56.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.h),
                                        color: const Color.fromARGB(
                                            148, 187, 222, 251),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.home_repair_service,
                                          color: const Color.fromARGB(
                                              255, 10, 145, 183),
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    getHorSpace(16.h),
                                    // Service Name Text in Same Row
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          getCustomFont(
                                            data['service_name'] ??
                                                'No Service Name',
                                            16.sp,
                                            context.theme.primaryColor,
                                            1,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          getVerSpace(8.h),
                                          // Order Number below Service Name
                                          Row(
                                            children: [
                                              // getHorSpace(8.h),
                                              Text(
                                                'Order Number: ${data['order_number'] ?? 'N/A'}',
                                                style:
                                                    TextStyle(fontSize: 14.sp),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).paddingAll(16.h),

                                // Second Row for Other Fields
                                getVerSpace(10.h),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person,
                                            size: 20, color: Colors.grey),
                                        getHorSpace(8.h),
                                        Text(
                                          'User: ${data['user_name'] ?? 'No User'}',
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                    getVerSpace(6.h),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,
                                            size: 20, color: Colors.grey),
                                        getHorSpace(8.h),
                                        Text(
                                          'Location: ${data['location'] ?? 'No Location'}',
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                    getVerSpace(6.h),
                                    Row(
                                      children: [
                                        Icon(Icons.schedule,
                                            size: 20, color: Colors.grey),
                                        getHorSpace(8.h),
                                        Text(
                                          'Schedule: ${data['date'] ?? 'No Date'}, ${data['time'] ?? 'No Time'}',
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ).paddingSymmetric(horizontal: 15.h),

                                // Accept and Reject Buttons
                                getVerSpace(10.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () => _updateOrderStatus(
                                          order.id,
                                          'accepted',
                                          data['order_number']),
                                      child: const Text('Accept',
                                          style:
                                              TextStyle(color: Colors.green)),
                                    ),
                                    TextButton(
                                      onPressed: () => _updateOrderStatus(
                                          order.id,
                                          'canceled',
                                          data['order_number']),
                                      child: const Text('Reject',
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ).paddingSymmetric(horizontal: 20.h),
                              ],
                            ),
                          ).paddingSymmetric(horizontal: 30.h),
                          getVerSpace(index == orders.length - 1 ? 0.h : 12.h),
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

  void _updateOrderStatus(
      String orderId, String newStatus, String orderNumber) {
    FirebaseFirestore.instance.collection('new_orders').doc(orderId).update({
      'status': newStatus,
    }).then((_) {
      // Send a notification with the updated status
      _sendNotification(newStatus, orderNumber);

      // Feedback to the user
      Get.snackbar('Success', 'Order has been $newStatus.');
    }).catchError((error) {
      Get.snackbar('Error', 'Failed to update order status: $error');
    });
  }

  void _sendNotification(String status, String orderNumber) {
    FirebaseFirestore.instance.collection('new_orders').add({
      'notification': 'Order $orderNumber has been $status.',
      'status': status,
      'provider_id': providerId,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
