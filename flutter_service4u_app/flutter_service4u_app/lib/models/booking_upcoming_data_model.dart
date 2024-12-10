import 'dart:ui';

class Booking {
  String? icon;
  Color? iconBgColor;
  String? title;
  String? referenceCode;
  String? status;
  String? scheduleTime;
  String? scheduleDate;
  String? serviceOroviderIcon;
  String? serviceOroviderTitle;
  String? quntity;
  String? providerName;
  final int? id;

  Booking(
      this.icon,
      this.iconBgColor,
      this.title,
      this.status,
      this.scheduleTime,
      this.scheduleDate,
      this.referenceCode,
      this.serviceOroviderIcon,
      this.serviceOroviderTitle,
      this.quntity,
      this.providerName,
      this.id);
}
