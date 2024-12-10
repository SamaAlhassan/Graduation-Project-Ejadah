import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import 'package:service_hub_app/view/home_main_screen.dart';

class OrderCancelDialogue extends StatefulWidget {
  @override
  State<OrderCancelDialogue> createState() => _OrderCancelDialogueState();
}

class _OrderCancelDialogueState extends State<OrderCancelDialogue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
          child: cancel_confirm_order_format(
              context.theme.focusColor,
              "Order Cancelled!",
              context.theme.primaryColor,
              "There are plenty of service providers waiting to serve you, hope to see you soon",
              "Try Again", () {
        Get.off(HomeMainScreen());
      }, () {
        Get.off(HomeMainScreen());
      })),
    );
  }
}
