import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/constantWidget.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

backClick() {
  Constant.backToFinish();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
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
              getCustomAppBar("Add New Address", () {
                backClick();
              })
            ],
          )),
        ));
  }
}
