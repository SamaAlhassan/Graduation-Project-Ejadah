// import 'package:bottom_sheet/bottom_sheet.dart';
// import 'package:expandable_text/expandable_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:html_editor_enhanced/html_editor.dart';
// import '../../../../controller/controller.dart';
// import '../../../../utils/color_category.dart';
// import '../../../../utils/constant.dart';
// import '../../../../utils/constantWidget.dart';
// import '../appliance_categories_screens/book_now_bottom_sheet.dart';

// class BeautyServiceDetail extends StatefulWidget {


//   @override
//   State<BeautyServiceDetail> createState() => _BeautyServiceDetailState();
// }
// backclick() {
//   Constant.backToFinish();
// }
// class _BeautyServiceDetailState extends State<BeautyServiceDetail> {
//   HtmlEditorController controller = HtmlEditorController();
//   BeautyServiceDetailScreenController beautyServiceDetailScreenController = Get
//       .put(BeautyServiceDetailScreenController());

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BeautyServiceDetailScreenController>(
//       init: BeautyServiceDetailScreenController(),
//       builder: (beautyServiceDetailScreenController) => WillPopScope(
//         onWillPop: () async {
//           backclick();
//           return false;
//         },
//         child: Scaffold(
//           backgroundColor: context.theme.scaffoldBackgroundColor,
//           body: Column(
//             children: [
//               Expanded(
//                 child: Container(
//                   child: Stack(
//                     children: [
//                       Container(
//                           height: 255.h,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage(Constant.assetImagePath +
//                                       "beauty_2nd.png"),
//                                   fit: BoxFit.cover)),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               getVerSpace(99.1.h),
//                               Container(
//                                 height: 21.h,
//                                 width: 47.h,
//                                 decoration: BoxDecoration(
//                                   color: Color(0XFFFB9450),
//                                   borderRadius: BorderRadius.circular(112.h),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         offset: Offset(0, 5),
//                                         blurRadius: 15,
//                                         color:
//                                         Color(0XFFFB9450).withOpacity(0.05))
//                                   ],
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     getSvgImage("star_icon_white.svg"),
//                                     getCustomFont("4.5", 12.sp, regularWhite, 1,
//                                         fontWeight: FontWeight.w700,
//                                         fontFamily: 'Gilroy')
//                                   ],
//                                 ).paddingSymmetric(horizontal: 8.h),
//                               ).paddingSymmetric(horizontal: 16.h),
//                               getVerSpace(7.h),
//                               Container(
//                                   width: 150.5.h,
//                                   child: getMultilineCustomFont(
//                                       "Hair Rebonding",
//                                       28.sp,
//                                       regularWhite,
//                                       fontWeight: FontWeight.w700,
//                                       txtHeight: 1.5.h,
//                                       textAlign: TextAlign.left))
//                                   .paddingSymmetric(horizontal: 16.h)
//                             ],
//                           )),
//                       Container(
//                         height: 72.h,
//                         width: double.infinity,
//                         child: Row(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 backclick();
//                               },
//                               child: getSvgImage("arrow_left_black.svg",
//                                   height: 48.h, width: 48.h)
//                                   .paddingSymmetric(horizontal: 12.h),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: ListView(
//                           children: [
//                             common_container(
//                               context.theme.focusColor,
//                               child: Column(
//                                 children: [
//                                   seeAll_button_formate(
//                                     "Description",
//                                     context.theme.primaryColor,
//                                         () {},
//                                     "Recent",
//                                     Get.isDarkMode
//                                         ? "down_arrow_icon_white.svg"
//                                         : "down_arrow_icon_blue.svg",
//                                     fontsize: 18.sp,
//                                     fontwidth: FontWeight.w600,
//                                     buttonPermition: false,
//                                   ).paddingAll(16.h),
//                                   ExpandableText(
//                                     "Our professionals will visit your home and diagnose the issue. final professionals will visit your home and diagnose the issue. final .",
//                                     expandText: 'Read More',
//                                     collapseText: 'Read less',
//                                     maxLines: 2,
//                                     linkColor: blue,
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontFamily: Constant.fontsFamily,
//                                         fontSize: 15.sp,
//                                         color: Color(0XFF4E5264),
//                                         height: 1.5.h),
//                                   ).paddingSymmetric(horizontal: 16.h),
//                                   getVerSpace(16.h)
//                                 ],
//                               ),
//                             ),
//                             getVerSpace(10.h),
//                             common_container(
//                               context.theme.focusColor,
//                               child: Column(
//                                 children: [
//                                   seeAll_button_formate(
//                                     "Size of Carpet",
//                                     context.theme.primaryColor,
//                                         () {},
//                                     "Recent",
//                                     Get.isDarkMode
//                                         ? "down_arrow_icon_white.svg"
//                                         : "down_arrow_icon_blue.svg",
//                                     fontsize: 18.sp,
//                                     fontwidth: FontWeight.w600,
//                                     buttonPermition: false,
//                                   ),
//                                   getVerSpace(12.h),
//                                   GetBuilder<
//                                       BeautyServiceDetailScreenController>(
//                                     init:
//                                     BeautyServiceDetailScreenController(),
//                                     builder: (beautyServiceDetailScreenController) =>
//                                         number_of_bath_unit_formate(
//                                             beautyServiceDetailScreenController
//                                                 .units,
//                                             "Small", () {
//                                           beautyServiceDetailScreenController
//                                               .removeUnit();
//                                         }, () {
//                                           beautyServiceDetailScreenController
//                                               .addUnits();
//                                         },
//                                             beautyServiceDetailScreenController
//                                                 .units >
//                                                 1
//                                                 ? regularWhite
//                                                 : Color(0XFF2E4460),
//                                             beautyServiceDetailScreenController
//                                                 .units >
//                                                 1
//                                                 ? blue
//                                                 : Color(0XFF2E4460),
//                                             beautyServiceDetailScreenController
//                                                 .units >
//                                                 1
//                                                 ? blue
//                                                 : regularWhite,
//                                             "10 X 12 cm",
//                                             1),
//                                   ),
//                                   getVerSpace(8.h),
//                                   Divider(
//                                     color: Color(0XFFEEEEEE),
//                                   ),
//                                   getVerSpace(8.h),
//                                   GetBuilder<
//                                       BeautyServiceDetailScreenController>(
//                                     init:
//                                     BeautyServiceDetailScreenController(),
//                                     builder: (beautyServiceDetailScreenController) =>
//                                         number_of_bath_unit_formate(
//                                             beautyServiceDetailScreenController
//                                                 .bedRoom,
//                                             "Medium", () {
//                                           beautyServiceDetailScreenController
//                                               .removeBedroom();
//                                         }, () {
//                                           beautyServiceDetailScreenController
//                                               .addBedroom();
//                                         },
//                                             beautyServiceDetailScreenController
//                                                 .bedRoom >
//                                                 1
//                                                 ? regularWhite
//                                                 : Color(0XFF2E4460),
//                                             beautyServiceDetailScreenController
//                                                 .bedRoom >
//                                                 1
//                                                 ? blue
//                                                 : Color(0XFF2E4460),
//                                             beautyServiceDetailScreenController
//                                                 .bedRoom >
//                                                 1
//                                                 ? blue
//                                                 : regularWhite,
//                                             "20 X 40 cm",
//                                             2),
//                                   ),
//                                   getVerSpace(8.h),
//                                   Divider(
//                                     color: Color(0XFFEEEEEE),
//                                   ),
//                                   getVerSpace(8.h),
//                                   GetBuilder<
//                                       BeautyServiceDetailScreenController>(
//                                     init:
//                                     BeautyServiceDetailScreenController(),
//                                     builder: (beautyServiceDetailScreenController) =>
//                                         number_of_bath_unit_formate(
//                                             beautyServiceDetailScreenController
//                                                 .bedRoom,
//                                             "Large", () {
//                                           beautyServiceDetailScreenController
//                                               .removeBedroom();
//                                         }, () {
//                                           beautyServiceDetailScreenController
//                                               .addBedroom();
//                                         },
//                                             beautyServiceDetailScreenController
//                                                 .bedRoom >
//                                                 1
//                                                 ? regularWhite
//                                                 : Color(0XFF2E4460),
//                                             beautyServiceDetailScreenController
//                                                 .bedRoom >
//                                                 1
//                                                 ? blue
//                                                 : Color(0XFF2E4460),
//                                             beautyServiceDetailScreenController
//                                                 .bedRoom >
//                                                 1
//                                                 ? blue
//                                                 : regularWhite,
//                                             "50 X 70 cm",
//                                             2),
//                                   ),
//                                 ],
//                               ).paddingSymmetric(
//                                   horizontal: 16.h, vertical: 16.h),
//                             ),
//                             getVerSpace(10.h),
//                             common_container(context.theme.focusColor,
//                                 child: Column(
//                                   children: [
//                                     seeAll_button_formate(
//                                       "Instructions",
//                                       context.theme.primaryColor,
//                                           () {},
//                                       "Recent",
//                                       Get.isDarkMode
//                                           ? "down_arrow_icon_white.svg"
//                                           : "down_arrow_icon_blue.svg",
//                                       fontsize: 18.sp,
//                                       fontwidth: FontWeight.w600,
//                                       buttonPermition: false,
//                                     ).paddingAll(16.h),
//                                     HtmlEditor(
//                                       controller: controller, //required
//                                       htmlEditorOptions: HtmlEditorOptions(
//                                         hint: "Your text here...",
//                                         initialText:
//                                         "text content initial, if any",
//                                       ),
//                                       htmlToolbarOptions: HtmlToolbarOptions(),
//                                       otherOptions: OtherOptions(
//                                           height: 160.h,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius.circular(12.h),
//                                               border: Border.all(
//                                                   color: Color(0XFF9A9FA5)
//                                                       .withOpacity(0.25),
//                                                   width: 2.h))),
//                                     ).paddingSymmetric(horizontal: 16.h),
//                                   ],
//                                 ))
//                           ],
//                         ),
//                       ).paddingOnly(top: 206.4.h, left: 16.h, right: 16.h)
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 color: context.theme.focusColor,
//                 child: Column(
//                   children: [
//                     getVerSpace(8.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             getRichtext("Total:", " USD 150.50",
//                                 firsttextcolor: Color(0XFF6F767E),
//                                 secondtextcolor: context.theme.primaryColor,
//                                 firsttextSize: 14.sp,
//                                 firstTextwidth: FontWeight.w600,
//                                 secondtextSize: 14.sp,
//                                 secondTextwidth: FontWeight.w600)
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             getCustomFont(
//                                 "Bill Details", 14.sp, Color(0XFFFC944D), 1,
//                                 fontWeight: FontWeight.w500),
//                             getHorSpace(7.h),
//                             getSvgImage("up_arrow_icon.svg")
//                           ],
//                         )
//                       ],
//                     ),
//                     getVerSpace(20.h),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: getCustomButton("Save Draft", () {},
//                               color: context.theme.primaryColor,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12.h),
//                                   border:
//                                   Border.all(color: greyButton, width: 2.h),
//                                   color: Color(0XFFFCFCFC))),
//                         ),
//                         getHorSpace(8.h),
//                         Expanded(
//                             child: getCustomButton("Book Now", () {
//                               showFlexibleBottomSheet(
//                                 bottomSheetColor: regularWhite,
//                                 minHeight: 0,
//                                 initHeight: 0.5,
//                                 context: context,
//                                 builder: _buildBottomSheet,
//                                 anchors: [0, 0.5, 1],
//                                 isSafeArea: true,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(16.h),
//                                         topRight: Radius.circular(16.h))),
//                               );
//                             })),
//                       ],
//                     ),
//                     getVerSpace(16.h),
//                   ],
//                 ).paddingSymmetric(horizontal: 16.h),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildBottomSheet(
//       BuildContext context,
//       ScrollController scrollController,
//       double bottomSheetOffset,
//       ) {
//     return Material(
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(16.h),
//                 topLeft: Radius.circular(16.h))),
//         child: ListView(
//           controller: scrollController,
//           children: [BookNowBottomSheet()],
//         ),
//       ),
//     );
//   }

//   Widget number_of_bath_unit_formate(int number, title, Function removeIcon,
//       Function addIcon, iconColor, borderColor, buttonColor, size, id) {
//     return GetBuilder<CleaningServiceDetailScreenController>(
//       init: CleaningServiceDetailScreenController(),
//       builder: (cleaningServiceDetailScreenController) => Container(
//         height: 36.h,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 getCustomFont(title, 16.sp, context.theme.primaryColor, 1,
//                     fontWeight: FontWeight.w500),
//                 getVerSpace(2.h),
//                 getCustomFont("Size:${size}", 12.sp, greyTextColor, 1,
//                     fontWeight: FontWeight.w500)
//               ],
//             ),
//             Row(
//               children: [
//                 Container(
//                   height: 36.h,
//                   width: 36.h,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12.h),
//                       border: Border.all(color: textFieldHint),
//                       color: regularWhite),
//                   child: GestureDetector(
//                       onTap: () {
//                         removeIcon();
//                       },
//                       child:
//                       getSvgImage("remove_icon.svg", color: textFieldHint)
//                           .paddingSymmetric(horizontal: 12.h)),
//                 ),
//                 getHorSpace(18.h),
//                 getCustomFont("${number}", 18.sp, Color(0XFF363F4F), 1,
//                     fontWeight: FontWeight.w400),
//                 getHorSpace(18.h),
//                 Container(
//                   height: 36.h,
//                   width: 36.h,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12.h),
//                       border: Border.all(color: borderColor //Color(0XFF2E4460)
//                       ),
//                       color: buttonColor //regularWhite
//                   ),
//                   child: GestureDetector(
//                       onTap: () {
//                         addIcon();
//                       },
//                       child: getSvgImage("add_icon_white.svg", color: iconColor
//                         //Color(0XFF2E4460)
//                       )
//                           .paddingAll(11.h)),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
