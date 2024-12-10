import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderBookingScreen extends StatelessWidget {
  final String providerId;

  ProviderBookingScreen({required this.providerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('new_orders')
          //  .where('provider_id', isEqualTo: providerId)
            .where('status', whereIn: ['accepted', 'canceled'])
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No bookings found.'));
          }

          final bookings = snapshot.data!.docs;

          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              var booking = bookings[index];
              var data = booking.data() as Map<String, dynamic>;

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(data['service_name'] ?? 'No Service Name'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order #: ${data['order_number'] ?? 'N/A'}'),
                      Text('User: ${data['user_name'] ?? 'No User'}'),
                      Text('Location: ${data['location'] ?? 'No Location'}'),
                      Text('Date: ${data['date'] ?? 'No Date'}'),
                      Text('Time: ${data['time'] ?? 'No Time'}'),
                      Text('Status: ${data['status'] ?? 'Unknown'}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () => _makePhoneCall(data['phone_number']),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _makePhoneCall(String? phoneNumber) async {
    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      final url = 'tel:$phoneNumber';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
