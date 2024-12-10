import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/current_location_screen.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';

class SideMenuAddressScreen extends StatefulWidget {
  @override
  _SideMenuAddressScreenState createState() => _SideMenuAddressScreenState();
}

class _SideMenuAddressScreenState extends State<SideMenuAddressScreen> {
  String? userLocation;
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    _fetchUserLocation(); // Fetch location when the screen initializes
  }

  // Function to fetch user's location from Firestore
  Future<void> _fetchUserLocation() async {
    final User? user = FirebaseAuth.instance.currentUser; // Get current user
    if (user == null) {
      setState(() {
        userLocation = 'User not authenticated';
      });
      return;
    }

    String uid = user.uid; // Get the authenticated user's UID

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users_info')
        .doc(uid)
        .get();

    if (snapshot.exists) {
      setState(() {
        userLocation = snapshot['location']; // Get the location field
      });
    } else {
      setState(() {
        userLocation = 'Location not found';
      });
    }
  }

  // Function to handle location modification
  void _modifyLocation() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CurrentLocationScreen(
          onLocationSelected: (String placeName, double latitude, double longitude) {
            _updateLocationInFirebase(placeName, latitude, longitude);
            setState(() {
              userLocation = placeName; // Update the displayed location
              this.latitude = latitude;
              this.longitude = longitude;
            });
          },
        ),
      ),
    );
  }

  // Function to update location in Firestore
  Future<void> _updateLocationInFirebase(String placeName, double latitude, double longitude) async {
    final User? user = FirebaseAuth.instance.currentUser; // Get current user
    if (user == null) {
      print("User not authenticated");
      return; // Exit if the user is not authenticated
    }

    CollectionReference users =
        FirebaseFirestore.instance.collection('users_info');
    String uid = user.uid; // Use the authenticated user's UID

    await users.doc(uid).set({
      'location': placeName,
      'latitude': latitude,
      'longitude': longitude,
    }, SetOptions(merge: true));
  }

  backClick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVerSpace(24.h),
            getCustomAppBar("Address", () {
              backClick();
            }).paddingSymmetric(horizontal: 20.h),
            getVerSpace(40.h),
            Center(
              child: Column(
                children: [
                  // Card widget to display the address and icon with styling
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Color(0xFFE0E0E0), width: 1), // border color
                    ),
                    color: Colors.white, // background color
                    child: Container(
                      height: 115.h, // Fixed height for the card
                      padding: EdgeInsets.all(16.0), // Increase padding for more space inside the card
                      child: Row(
                        children: [
                          // Home icon
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(221, 242, 235, 190),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.home,
                              size: 24,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 16), // Space between icon and address
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getVerSpace(5.h),
                                Text(
                                  'Home',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                getVerSpace(6.h),
                                Text(
                                  userLocation ?? 'Loading address...',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          // Change button with edit icon inside it
                          ElevatedButton(
                            onPressed: _modifyLocation,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[100],
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: const Color.fromRGBO(245, 245, 245, 1), width: 1), // border color
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Change",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[900],
                                  ),
                                ),
                                SizedBox(width: 5), // Space between text and icon
                                Icon(
                                  Icons.edit,
                                  color: Colors.grey[800],
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
