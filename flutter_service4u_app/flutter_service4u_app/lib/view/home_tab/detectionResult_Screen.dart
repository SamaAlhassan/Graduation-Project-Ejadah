import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes/app_routes.dart';
import '../../utils/color_category.dart';
import '../../utils/constant.dart';
import '../../utils/constantWidget.dart';

class ModelPage extends StatefulWidget {
  final File? filePath;
  final String? label;
  final double? acc;

  ModelPage(this.filePath, this.acc, this.label);

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> with SingleTickerProviderStateMixin {

  String? route;

  @override
  void initState() {
    super.initState();
    determineRoute();
  }

  void determineRoute() {

    switch (widget.label) {
      case "Air_Conditioner":

        route = Routes.aCRepairScreenRoute;
        break;
      case "plug":

        route = Routes.electronicScreenRoute;
        break;
      case "Oven":
      case "Washing_Machine":
      case "dishwasher":
      case "refrigerator":

        route = Routes.applianceCategoriesScreenRoute;
        break;
      case "leak":

        route = Routes.plumbingScreenRoute;
        break;
      default:
        route = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: buttonColor,
        title: Text(
          "Result",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: Constant.fontsFamily,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 400,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image: AssetImage('assets/Box.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: widget.filePath != null
                                  ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Image.file(
                                        widget.filePath!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                                  : const Center(
                                child: Icon(
                                  Icons.image,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 5),
                                Text(
                                  "${widget.label}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Constant.fontsFamily,
                                    color: regularBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'You can find ${widget.label} Repair in this section',
                  style: TextStyle(
                    fontSize: 16,
                    color: regularBlack,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constant.fontsFamily,
                  ),
                ),
                getVerSpace(15.h),
                getCustomButton(
                  "Get it",
                      () {

                    if (route != null) {
                      Constant.sendToNext(context, route!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("No section available for this item")),
                      );
                    }
                  },
                  buttonheight: 34.h,
                  fontSize: 16.sp,
                  weight: FontWeight.w500,
                  buttonwidth: 100.h,
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
