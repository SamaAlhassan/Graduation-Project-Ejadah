import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/view/home_main_screen.dart';
import '../../../utils/constantWidget.dart';

class OrderConfirmDialogue extends StatefulWidget {
  @override
  State<OrderConfirmDialogue> createState() => _OrderConfirmDialogueState();
}

class _OrderConfirmDialogueState extends State<OrderConfirmDialogue> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
          child: cancel_confirm_order_format(
              context.theme.focusColor,
              "Successful",
              context.theme.primaryColor,
              "We will call you within 30 minutes to confirm your order.",
              "Go to Home", () {
        Get.off(HomeMainScreen());
      }, () {
        Get.off(HomeMainScreen());
      })),
    );
  }
}
