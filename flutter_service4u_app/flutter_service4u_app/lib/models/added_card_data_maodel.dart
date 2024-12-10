import 'dart:ui';

class PaymentCard{
  String? icon;
  Color? bgColor;
  String? title;
  String? paymentType;
  String? expiry;
  final int? id;
  PaymentCard(this.icon,this.bgColor,this.title,this.paymentType,this.expiry,this.id);
}