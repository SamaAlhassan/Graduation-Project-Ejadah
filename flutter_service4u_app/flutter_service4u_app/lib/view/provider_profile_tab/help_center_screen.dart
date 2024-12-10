import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/view/home_tab/categories_screens/ac_repair_categories_screens/add_new_card_screen.dart';

import '../../utils/constantWidget.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              getVerSpace(24.h),
              getCustomAppBar("Help Center", () {
                backClick();
              }).paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  children: [
                    question_answer('1.Types of data we collect',
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                    getVerSpace(20.h),
                    question_answer('2. Use of your personal Data',
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                    getVerSpace(20.h),
                    question_answer('3. Disclosure of your personal Data',
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
