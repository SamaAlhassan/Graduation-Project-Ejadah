import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../provider_profile_tab/provider_Booking.dart';
class NewOrdersScreen extends StatelessWidget {
  final String providerId;

  NewOrdersScreen({required this.providerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Orders'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('new_orders')
        //    .where('provider_id', isEqualTo: providerId)
            .where('status', isEqualTo: 'new')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error fetching orders: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No new orders available.'));
          }

          final orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              var order = orders[index];
              var data = order.data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(data['service_name'] ?? 'No Service Name'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order Number : ${data['order_number'] ?? 'N/A'}'),
                      Text('User: ${data['user_name'] ?? 'No User'}'),
                      Text('Location: ${data['location'] ?? 'No Location'}'),
                      Text('Date: ${data['date'] ?? 'No Date'}'),
                      Text('Time: ${data['time'] ?? 'No Time'}'),
                    ],
                  ),
                  trailing: ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () => _updateOrderStatus(order.id, 'accepted'),
                        child: const Text('Accept', style: TextStyle(color: Colors.green)),
                      ),
                      TextButton(
                        onPressed: () => _updateOrderStatus(order.id, 'canceled'),
                        child: const Text('Reject', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _updateOrderStatus(String orderId, String newStatus) {
    FirebaseFirestore.instance.collection('new_orders').doc(orderId).update({
      'status': newStatus,
    }).then((_) {
      Get.snackbar('Success', 'Order has been $newStatus.');
    }).catchError((error) {
      Get.snackbar('Error', 'Failed to update order status: $error');
    });
  }
}
