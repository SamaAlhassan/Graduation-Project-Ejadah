import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreTestPage extends StatefulWidget {
  @override
  FirestoreTestPageState createState() => FirestoreTestPageState();
}

class FirestoreTestPageState extends State<FirestoreTestPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> addUserData(String uid, String name, String email,
      String mobile, String location, String password) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('users_info');

    try {
      // Use uid as the document ID
      await users.doc(uid).set({
        'name': name,
        'email': email,
        'mobile': mobile,
        'location': location,
        'password': password,
      });
      print("User added successfully with UID: $uid");
    } catch (e) {
      print("Error adding user: $e");
    }
  }

  static Future<void> addProviderData(
      String uid,
      String name,
      String email,
      String mobile,
      String nationality,
      String? major,
      String location,
      String haveCar,
      String? workingHour,
      String password,
      double latitude,
      double longitude
      ) async {
    CollectionReference providers =
        FirebaseFirestore.instance.collection('providers_info');

    try {
      // Use uid as the document ID
      await providers.doc(uid).set({
        'name': name,
        'email': email,
        'mobile': mobile,
        'nationality': nationality,
        'major': major,
        'location': location,
        'have a car?': haveCar,
        'preferred working hours': workingHour,
        'password': password,
        'latitude': latitude,
        'longitude': longitude,
      });
      Get.snackbar('Success', 'Provider added successfully with UID: $uid');
    } catch (e) {
      print("Error adding user: $e");
    }
  }

  // New method for adding an order to the `new_orders` collection
  static Future<void> addOrderData(
    String customerName,
    String serviceName,
    String date,
    String time,
    String location,
    String phoneNumber,
    String providerId,
    String providerName,
  ) async {
    CollectionReference orders =
        FirebaseFirestore.instance.collection('new_orders');
  // Generate a unique order number using timestamp
  String orderNumber = 'D-${DateTime.now().millisecondsSinceEpoch}';

  try {
    await orders.add({
      'order_number': orderNumber, // Add generated order number
      'user_name': customerName,
      'service_name': serviceName,
      'date': date,
      'time': time,
      'location': location,
      'phone_number': phoneNumber,
      'provider_id': providerId,
      'provider_name': providerName,
      'status': 'new',
    });
      Get.snackbar('Order Success', 'New order added successfully');
      print("Order added successfully for: $customerName");
    } catch (e) {
      print("Error adding order: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firestore Test')),
      body: Center(child: Text('Check console for Firestore data')),
    );
  }
}
