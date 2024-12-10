import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../controller/controller.dart';
import '../view/booking_tab/histry_detail_screen.dart';
import 'color_category.dart';
import 'constant.dart';

Widget getAssetImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getSvgImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getHorSpace(double horSpace) {
  return SizedBox(
    width: horSpace,
  );
}

Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
    {String fontFamily = Constant.fontsFamily,
    double letterSpace = 0,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
      decoration: decoration,
      letterSpacing: letterSpace,
      fontSize: fontSize,
      color: fontColor,
      fontFamily: fontFamily,
      height: txtHeight ?? 1.2.h,
      fontWeight: fontWeight,
    ),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
  );
}

Widget getMultilineCustomFont(String text, double fontSize, Color fontColor,
    {TextOverflow overflow = TextOverflow.ellipsis,
    double letterSpace = 0,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    double txtHeight = 1.5,
    String? fontFamily}) {
  return Text(
    text,
    style: TextStyle(
        letterSpacing: letterSpace,
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily ?? Constant.fontsFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

Widget getCustomButton(String text, Function function,
    {double? buttonheight,
    double? buttonwidth,
    double? fontSize,
    FontWeight? weight,
    Color? color,
    Color? newbuttonColor,
    BoxDecoration? decoration}) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Container(
      height: buttonheight ?? 54.h,
      width: buttonwidth ?? double.infinity,
      decoration: decoration ??
          BoxDecoration(
              borderRadius: BorderRadius.circular(40.h),
              color: newbuttonColor ?? buttonColor),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize ?? 18.sp,
            color: color ?? regularBlack,
            fontFamily: Constant.fontsFamily,
            fontWeight: weight ?? FontWeight.w500),
      )),
    ),
  );
}

Widget getSearchTextField(TextEditingController controller, String hint,
    {Function? prefixFunction,
    double? height,
    double? hintfontSize,
    FontWeight? fontweight,
    bool prefixpermition = true,
    double? horPadding,
    double? iconrightPadding,
    double? vertpadding,
    Widget? suffixicon,
    Color? fillColor,
    Color? enable,
    double? borderWidth,
    double? borderRadius}) {
  return Container(
    height: height ?? 50.h,
    child: TextFormField(
        controller: controller,
        cursorColor: buttonColor,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15.5.h),
            prefixIcon: prefixpermition
                ? GestureDetector(
                    onTap: () {
                      prefixFunction!();
                    },
                    child: getSvgImage("arrow_left_black.svg"))
                : null,
            suffixIcon: suffixicon ??
                Container(
                        height: 32.h,
                        width: 32.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.h),
                            color: buttonColor),
                        child: getSvgImage("search_icon.svg").paddingAll(8.h))
                    .paddingSymmetric(
                        horizontal: horPadding ?? 8.h,
                        vertical: vertpadding ?? 8.h),
            hintText: hint,
            hintStyle: TextStyle(
                color: hintColor,
                fontFamily: Constant.fontsFamily,
                fontSize: hintfontSize ?? 14.sp,
                fontWeight: fontweight ?? FontWeight.w400,
                height: 1.5.h,
                letterSpacing: 0),
            filled: true,
            fillColor: fillColor ?? searchTextFilledColor,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10.h),
                borderSide: BorderSide(
                    color: enable ?? searchTextFieldEnableBorder,
                    width: borderWidth ?? 1.h)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10.h),
                borderSide: BorderSide(
                    color: buttonColor, width: borderWidth ?? 1.h)))),
  );
}

Widget getSearchField(String? text,
    {Function? function,
    Color? hinttextcolor,
    double? hinttextsize,
    FontWeight? fontweight,
    String? prefixiconimage,
    double? prefixiconimageheight,
    double? prefixiconimagewidth,
    double? suffixiconimageheight,
    double? suffixiconimagewidth,
    String? suffixiconimage,
    Function? suffixfunction,
    Color? fillColor}) {
  return Container(
    height: 44.h,
    child: TextFormField(
        onTap: () {
          function!();
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: darkYellow, width: 1.h),
                borderRadius: BorderRadius.circular(16.h)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: regularWhite, width: 1.h),
                borderRadius: BorderRadius.circular(16.h)),
            filled: true,
            fillColor: fillColor ?? Color(0XFFFFFFFF),
            hintText: text,
            hintStyle: TextStyle(
                color: hinttextcolor ?? grey40,
                fontSize: hinttextsize ?? 16.sp,
                fontFamily: Constant.fontsFamily,
                fontWeight: fontweight ?? FontWeight.w400),
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                  top: 12.h, left: 16.w, bottom: 12.h, right: 12.h),
              child: getSvgImage(
                "searchIcon.svg",
                height: prefixiconimageheight ?? 24.h,
                width: prefixiconimagewidth ?? 24.h,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                suffixfunction!();
              },
              child: Padding(
                padding: EdgeInsets.only(top: 16.h, right: 16.h, bottom: 16.h),
                child: Container(
                  height: suffixiconimageheight ?? 24.h,
                  width: suffixiconimagewidth ?? 24.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "${Constant.assetImagePath}${suffixiconimage}"),
                    ),
                  ),
                ),
              ),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.h)))),
  );
}

Widget getTextField(String hint, String prefix,
    {Function? function,
    TextInputType? type,
    FontWeight? fontWeight,
    double? fontsize,
    Color? color,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    String? val,
    bool enable = false,
    Color? fillColor,
    bool suffixiconpermition = false,
    Widget? widget,
    bool obsequrePermition = false,
    InputDecoration? decoration = const InputDecoration()}) {
  return TextFormField(
    keyboardType: type,
    cursorColor: buttonColor,
    autovalidateMode: AutovalidateMode.disabled,
    controller: controller,
    initialValue: val,
    obscureText: obsequrePermition,
    obscuringCharacter: '*',
    onTap: () {
      // function!() ?? () {};
      function?.call() ?? () {};
    },
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
          fontSize: fontsize ?? 16.sp,
          fontFamily: Constant.fontsFamily,
          color: color ?? grey40,
          fontWeight: fontWeight ?? FontWeight.w400),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: const Color(0XFFDEDEDE), width: 1.w),
        borderRadius: BorderRadius.circular(16.h),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: buttonColor, width: 1.h),
        borderRadius: BorderRadius.circular(16.h),
      ),
      enabledBorder: enable
          ? OutlineInputBorder(
              borderSide: BorderSide(color: buttonColor, width: 1.w),
              borderRadius: BorderRadius.circular(16.h),
            )
          : OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color(0XFFFFFFFF), width: 1.w),
              borderRadius: BorderRadius.circular(16.h),
            ),
      filled: true,
      fillColor: fillColor ?? fillTextField,
      contentPadding: EdgeInsets.only(left: 20.h, top: 16.h, bottom: 16.h),
      prefixIcon: prefix != ''
          ? getSvgImage(prefix)
              .paddingOnly(top: 16.h, bottom: 16.h, left: 16.h, right: 12.h)
          : SizedBox(),
      suffixIcon: suffixiconpermition ? widget : SizedBox(),
    ),
    validator: validator,
  );
}

Widget getSimpleTextField(String hint, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: grey40,
            fontSize: 16.sp,
            fontFamily: Constant.fontsFamily),
        filled: true,
        fillColor: textfieldFillColor,
        contentPadding: EdgeInsets.all(18.h),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.h),
            borderSide: BorderSide(color: textfieldFillColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.h),
            borderSide: BorderSide(color: buttonColor))),
  );
}

Widget getRichtext(String firsttext, String secondtext,
    {Function? function,
    Color? firsttextcolor,
    Color? secondtextcolor,
    double? firsttextSize,
    double? secondtextSize,
    FontWeight? firstTextwidth,
    FontWeight? secondTextwidth}) {
  return RichText(
      text: TextSpan(
          text: firsttext,
          style: TextStyle(
              color: firsttextcolor ?? Color(0XFF000000),
              fontSize: firsttextSize ?? 15.sp,
              fontFamily: Constant.fontsFamily,
              fontWeight: firstTextwidth ?? FontWeight.w500,
              height: 1.5.h),
          children: [
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              function!();
            },
          text: secondtext,
          style: TextStyle(
              color: secondtextcolor,
              fontSize: secondtextSize ?? 15.sp,
              fontWeight: secondTextwidth ?? FontWeight.w700,
              fontFamily: Constant.fontsFamily,
              height: 1.5.h),
        )
      ]));
}

Widget getCustomAppBar(String title, Function function) {
  return Row(
    children: [
      GestureDetector(
          onTap: () {
            function();
          },
          child: Container(
            height: 24.h,
            width: 24.h,
            child: getSvgImage(Get.isDarkMode
                ? "arrow_left_white.svg"
                : "arrow_left_black.svg"),
          )),
      getHorSpace(20.h),
      getCustomFont(
          title, 24.sp, Get.isDarkMode ? regularWhite : regularBlack, 1,
          fontWeight: FontWeight.w700),
    ],
  ).paddingSymmetric(horizontal: 8.h);
}

Widget getAppBar(Function function) {
  return Container(
    height: 72.h,
    width: double.infinity,
    color: Get.isDarkMode ? darkThemeContainer : lightThemeContainer,
    child: Row(
      children: [
        GestureDetector(
            onTap: () {
              function();
            },
            child: getSvgImage(Get.isDarkMode
                ? "arrow_left_white.svg"
                : "arrow_left_black.svg"))
      ],
    ).paddingSymmetric(horizontal: 8.h),
  );
}

Widget getTextFormField(String hint,
    {bool prefixIconPermition = false, Widget? suffixWidget}) {
  return TextFormField(
    cursorColor: blue,
    decoration: InputDecoration(
        prefixIcon: prefixIconPermition ? suffixWidget : SizedBox(),
        //
        hintText: hint,
        hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: Constant.fontsFamily,
            color: textFieldHint),
        filled: true,
        fillColor: fillTextField,
        enabledBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.h),
            borderSide: BorderSide(color: blue))),
  );
}

Widget phone_number_field(controller) {
  return IntlPhoneField(
    controller: controller,
    flagsButtonMargin: EdgeInsets.all(14.h),
    dropdownIconPosition: IconPosition.trailing,
    validator: (mobileNumber) {
      if (mobileNumber == null) {
        // setState(() {
        //   nameError = true;
        // });
        return 'Please enter Mobile number';
      }
      return null;
    },
    disableLengthCheck: true,
    decoration: InputDecoration(
      suffixIcon: getSvgImage("eye_icon.svg")
          .paddingOnly(top: 15.h, bottom: 17.h, right: 18.h),
      contentPadding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.h),
      filled: true,
      fillColor: fillTextField,
      hintText: "Phone Number",
      hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: grey40,
          fontFamily: Constant.fontsFamily),
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.h),
          borderSide: BorderSide(color: buttonColor, width: 1.w)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.h),
          borderSide: BorderSide(color: grey10, width: 1.w)),
    ),
    initialCountryCode: 'SA',
    onChanged: (phone) {
      print(phone.completeNumber);
    },
  );
}

Widget seeAll_button_formate(String title, Color titleColor, Function function,
    String buttonText, String buttonIcon,
    {bool buttonPermition = true,
    double? buttonFontSize,
    FontWeight? buttonFontWidth,
    double? fontsize,
    FontWeight? fontwidth,
    double? buttonHeight,
    double? buttonWidth,
    Decoration? boxdecoration,
    Color? buttonTextColor}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          getSvgImage("cleaning_service_tag.svg"),
          getHorSpace(10.h),
          getCustomFont(title, fontsize ?? 18.sp, titleColor, 1,
              fontWeight: fontwidth ?? FontWeight.w600, txtHeight: 1.h)
        ],
      ),
      buttonPermition
          ? GestureDetector(
              onTap: () {
                function();
              },
              child: Container(
                height: buttonHeight ?? 35.h,
                width: buttonWidth ?? 83.h,
                decoration: boxdecoration ??
                    BoxDecoration(
                        borderRadius: BorderRadius.circular(100.h),
                        color: Get.isDarkMode
                            ? darkThemeContainer
                            : lightThemeContainer,
                        border: Border.all(
                            color:
                                Get.isDarkMode ? Color(0XFF434355) : greyButton,
                            width: 1.5.h)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCustomFont(buttonText, buttonFontSize ?? 12.sp,
                        buttonTextColor ?? Color(0XFF6F767E), 1,
                        fontWeight: buttonFontWidth ?? FontWeight.w600),
                    getHorSpace(4.h),
                    getSvgImage(buttonIcon)
                  ],
                ),
              ),
            )
          : SizedBox()
    ],
  );
}

Widget simple_app_bar(Function function) {
  return Container(
    width: double.infinity,
    height: 72.h,
    color: Get.isDarkMode ? darkThemeContainer : lightThemeContainer,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            function();
          },
          child: getSvgImage("arrow_left_black.svg",
              color: Get.isDarkMode ? regularWhite : regularBlack),
        ),
      ],
    ).paddingOnly(left: 8.h),
  );
}

Widget getNotificationtext(
    String firsttext, String secondtext, String thirdtext,
    {Function? function,
    Color? firsttextcolor,
    Color? secondtextcolor,
    Color? thirdtextcolor,
    double? firsttextSize,
    double? secondtextSize,
    double? thirdtextSize,
    FontWeight? firstTextwidth,
    FontWeight? secondTextwidth,
    FontWeight? thirdTextwidth}) {
  return RichText(
      text: TextSpan(
          text: firsttext,
          style: TextStyle(
              color: firsttextcolor ?? Color(0XFF000000),
              fontSize: firsttextSize ?? 16.sp,
              fontFamily: Constant.fontsFamily,
              fontWeight: firstTextwidth ?? FontWeight.w500,
              height: 1.5.h),
          children: [
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              function!();
            },
          text: secondtext,
          style: TextStyle(
              color: secondtextcolor,
              fontSize: firsttextSize ?? 16.sp,
              fontWeight: firstTextwidth ?? FontWeight.w600,
              fontFamily: Constant.fontsFamily,
              height: 1.5.h),
        ),
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              function!();
            },
          text: thirdtext,
          style: TextStyle(
              color: firsttextcolor,
              fontSize: firsttextSize ?? 16.sp,
              fontWeight: firstTextwidth ?? FontWeight.w500,
              fontFamily: Constant.fontsFamily,
              height: 1.5.h),
        )
      ]));
}

Widget bill_detail(Color titleColor,
    {String? titleText, bool buttonpermition = false}) {
  return GetBuilder<CheakOutScreenController>(
    init: CheakOutScreenController(),
    builder: (cheakOutScreenController) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getCustomFont("Bill", 16.sp, regularBlack, 1,
            fontWeight: FontWeight.w500),
        getVerSpace(8.h),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.h),
              border: Border.all(color: grey20)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getCustomFont(
                      "AC Repair Service(Both Unit)", 14.sp, grey40, 1,
                      fontWeight: FontWeight.w400),
                  getCustomFont("1 Ton-1.5 Ton X2", 16.sp, regularBlack, 1,
                      fontWeight: FontWeight.w400),
                ],
              ),
              getVerSpace(9.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getCustomFont("Service Chrage", 14.sp, grey40, 1,
                      fontWeight: FontWeight.w400),
                  getCustomFont("\$30.00", 16.sp, regularBlack, 1,
                      fontWeight: FontWeight.w400),
                ],
              ),
              getVerSpace(9.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getCustomFont("Discount(5%)", 14.sp, grey40, 1,
                      fontWeight: FontWeight.w400),
                  getCustomFont("-\$05", 16.sp, errorColor, 1,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Divider(
                color: grey20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getCustomFont("Total", 20.sp, regularBlack, 1,
                      fontWeight: FontWeight.w700),
                  getCustomFont("\$25.00", 20.sp, regularBlack, 1,
                      fontWeight: FontWeight.w700),
                ],
              ),
            ],
          ).paddingAll(16.h),
        )
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //
        //     buttonpermition
        //         ? GestureDetector(
        //             onTap: () {
        //               Get.back();
        //             },
        //             child: Container(
        //               height: 26.h,
        //               width: 26.h,
        //               decoration: BoxDecoration(
        //                   shape: BoxShape.circle, color: greyButton),
        //               child: getSvgImage("close_icon.svg",
        //                       color: Color(0XFF33383F))
        //                   .paddingAll(5.h),
        //             ),
        //           )
        //         : SizedBox()
        //   ],
        // ),
        // getVerSpace(16.h),
        // Container(
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //       border: Border(bottom: BorderSide(color: greyButton))),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       getCustomFont(
        //           "AC Installation (Both Unit)", 14.sp, Get.isDarkMode?regularWhite:Color(0XFF33383F), 1,
        //           fontWeight: FontWeight.w600),
        //       getVerSpace(4.h),
        //       getCustomFont("1 Ton-1.5 Ton x2", 12.sp, Get.isDarkMode?regularWhite:Color(0XFF33383F), 1,
        //           fontWeight: FontWeight.w500),
        //       getVerSpace(12.h),
        //     ],
        //   ),
        // ),
        // getVerSpace(12.h),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     getCustomFont("Sub Total", 14.sp, Get.isDarkMode?regularWhite:greyTextColor, 1,
        //         fontWeight: FontWeight.w600),
        //     getCustomFont("\$90.00", 14.sp, Get.isDarkMode?regularWhite:Color(0XFF33383F), 1,
        //         fontWeight: FontWeight.w500)
        //   ],
        // ),
        // getVerSpace(19.h),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     getCustomFont("Delivery Charge", 14.sp, Get.isDarkMode?regularWhite:greyTextColor, 1,
        //         fontWeight: FontWeight.w600),
        //     getCustomFont("\$10.00", 14.sp, Get.isDarkMode?regularWhite:Color(0XFF33383F), 1,
        //         fontWeight: FontWeight.w500)
        //   ],
        // ),
        // getVerSpace(19.h),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     getCustomFont("Discount", 14.sp, Color(0XFFEA6C6C), 1,
        //         fontWeight: FontWeight.w600),
        //     Container(
        //         height: 28.h,
        //         width: 40.h,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(6.h),
        //             color: Color(0XFFFB8F8F).withOpacity(0.29)),
        //         child: Center(
        //             child: getCustomFont("-\$5", 14.sp, Color(0XFFE96C6C), 1,
        //                 fontWeight: FontWeight.w500)))
        //   ],
        // ),
        // getVerSpace(23.h),
        // Divider(
        //   color: greyButton,
        // ),
        // getVerSpace(12.h),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     getCustomFont("Amount to be paid", 14.sp, Get.isDarkMode?regularWhite:Color(0XFF33383F), 1,
        //         fontWeight: FontWeight.w600),
        //     getCustomFont("\$95.00", 14.sp, Get.isDarkMode?regularWhite:Color(0XFF33383F), 1,
        //         fontWeight: FontWeight.w700)
        //   ],
        // ),
      ],
    ).paddingAll(cheakOutScreenController.cheakOut ? 0.h : 20.h),
  );
}

Widget common_container(Color color, {Widget? child}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.h),
      color: color,
    ),
    child: child ?? SizedBox(),
  );
}

Widget selected_service(String icon, String serviceTitle,
    Color serviceTitleColor, String serviceDiscription) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          seeAll_button_formate("Services", titleColor, () {}, "", "",
              buttonPermition: false,
              fontsize: 18.sp,
              fontwidth: FontWeight.w600),
          getSvgImage("more_hor_rounded.svg")
        ],
      ),
      getVerSpace(11.h),
      Row(
        children: [
          Container(
            height: 55.05.h,
            width: 55.05.h,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0XFFFFBC99)),
            child: getSvgImage(icon).paddingAll(12.61.h),
          ),
          getHorSpace(16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomFont(serviceTitle, 16.sp, serviceTitleColor, 1,
                  fontWeight: FontWeight.w600),
              getVerSpace(6.h),
              getCustomFont(serviceDiscription, 14.sp, neutralShades, 1,
                  fontWeight: FontWeight.w500)
            ],
          )
        ],
      )
    ],
  );
}

Widget booking_empty_formate(String icon, String title, Color titleColor,
    String discription, Color discriptionColor, Function function,
    {String? buttonText}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getSvgImage(icon),
        getVerSpace(32.h),
        Container(
          width: 303.h,
          child: Column(
            children: [
              getCustomFont(title, 20.h, titleColor, 1,
                  fontWeight: FontWeight.w700),
              getVerSpace(10.h),
              getMultilineCustomFont(discription, 14.sp, discriptionColor,
                  fontWeight: FontWeight.w500, textAlign: TextAlign.center)
            ],
          ),
        ),
        getVerSpace(32.h),
        getCustomButton(buttonText ?? "View all services", () {
          function();
        }).paddingSymmetric(horizontal: 88.5.h)
      ],
    ),
  );
}

Widget cancel_confirm_order_format(
    Color ContainerColor,
    String title,
    Color titlecolor,
    String discription,
    String buttonText,
    Function buttonFunction,
    Function closefunction) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      common_container(ContainerColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    booking_empty_formate(
                        buttonText: buttonText,
                        "order_canle_icon.svg",
                        title,
                        titlecolor,
                        discription,
                        Get.isDarkMode
                            ? subTitleColorDarkTheme
                            : subTitleColorLightTheme, () {
                      buttonFunction();
                    }).paddingSymmetric(vertical: 30.h),
                    GestureDetector(
                      onTap: () {
                        closefunction();
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 32.h,
                          width: 32.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: greyButton),
                          child: getSvgImage("close_icon.svg").paddingAll(6.h),
                        ).paddingOnly(right: 16.h, top: 16.h),
                      ),
                    )
                  ],
                )
              ],
            ),
          )).paddingSymmetric(horizontal: 16.h),
    ],
  );
}

Widget google_facebook_ios_button(icon) {
  return Expanded(
      child: Container(
          height: 50.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.h),
              border: Border.all(width: 1.h, color: grey20)),
          child: getSvgImage(icon)
              .paddingOnly(top: 12.h, left: 12.h, bottom: 14.h, right: 14.h)));
}

Widget add_button(text, icon, function) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.h), color: grey10),
      child: Container(
        child: Row(
          children: [
            getCustomFont(text, 13.sp, regularBlack, 1,
                fontWeight: FontWeight.w400),
            getSvgImage(icon, height: 16.h, width: 16.h)
          ],
        ).paddingSymmetric(horizontal: 16.h, vertical: 8.h),
      ),
    ),
  );
}

Widget address_formate(icon, addressType, address, Function function,
    {double? textContainerWidth,
    bool radioButtonpermition = true,
    Widget? radioWidget}) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Container(
      height: 64.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.h),
                    color: addressIconbg),
                child: getSvgImage(icon).paddingAll(13.h),
              ),
              getHorSpace(16.h),
              Container(
                width: textContainerWidth ?? 236.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCustomFont(addressType, 14.sp, regularBlack, 1,
                        fontWeight: FontWeight.w700),
                    getMultilineCustomFont(address, 14.sp, grey40,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              )
            ],
          ),
          radioButtonpermition ? radioWidget ?? SizedBox() : SizedBox(),
        ],
      ),
    ).paddingSymmetric(vertical: 12.h),
  );
}

Widget phone_number_formate(image, number, category, function,
    {double? nuberContainerWidth,
    bool radioButtonpermition = true,
    Widget? radioWidget}) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  height: 42.h,
                  width: 42.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0XFFB3DAFE)),
                  child: getAssetImage(image)),
              getHorSpace(16.h),
              Container(
                width: nuberContainerWidth ?? 236.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCustomFont(number, 16.sp, regularBlack, 1,
                        fontWeight: FontWeight.w400),
                    getMultilineCustomFont(category, 12.sp, grey40,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              )
            ],
          ),
          radioButtonpermition ? radioWidget ?? SizedBox() : SizedBox(),
        ],
      ),
    ).paddingSymmetric(vertical: 12.h),
  );
}

Widget promo_code_formate(code, discription, function,
    {bool radioButtonpermition = true, Widget? radioWidget}) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Container(
      height: 64.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.h),
                    color: addressIconbg),
                child: getSvgImage("percentage_icon.svg").paddingAll(13.h),
              ),
              getHorSpace(16.h),
              Container(
                width: 236.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCustomFont(code, 14.sp, regularBlack, 1,
                        fontWeight: FontWeight.w700),
                    getMultilineCustomFont(discription!, 14.sp, grey40,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              )
            ],
          ),
          radioButtonpermition ? radioWidget ?? SizedBox() : SizedBox(),
        ],
      ),
    ),
  );
}

Widget card_formate(color, icon, title, expiry, function,
    {bool radioButtonpermition = true, Widget? radioWidget}) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50.h,
                width: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.h), color: color),
                child: getSvgImage(icon!).paddingAll(8.h),
              ),
              getHorSpace(16.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomFont(title!, 14.sp, regularBlack, 1,
                      fontWeight: FontWeight.w700),
                  getVerSpace(4.h),
                  getCustomFont("Exp ${expiry}", 14.sp, grey40, 1,
                      fontWeight: FontWeight.w400),
                ],
              )
            ],
          ),
          radioButtonpermition ? radioWidget ?? SizedBox() : SizedBox(),
        ],
      ).paddingOnly(
        bottom: 10.h,
      ),
    ).paddingSymmetric(horizontal: 16.h, vertical: 7.h),
  );
}

Widget animation_function(index, child,
    {Duration? listAnimation, Duration? slideduration, Duration? slidedelay}) {
  return AnimationConfiguration.staggeredList(
    position: index,
    duration: listAnimation ?? Duration(milliseconds: 375),
    child: SlideAnimation(
      duration: slideduration ?? Duration(milliseconds: 50),
      delay: slidedelay ?? Duration(milliseconds: 50),
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
}

Widget all_service_categories_screen_formate(
    String pageTitle,
    Function listViewSet,
    bool listIconCon,
    Function gridViewSet,
    bool gridIconCon,
    Widget widget) {
  return Column(
    children: [
      getVerSpace(24.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getCustomAppBar(pageTitle, () {
            backclick();
          }),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    listViewSet();
                  },
                  child: getSvgImage(listIconCon
                      ? "selected_list_icon.svg"
                      : "unselected_list_icon.svg")),
              getHorSpace(10.h),
              GestureDetector(
                  onTap: () {
                    gridViewSet();
                  },
                  child: getSvgImage(gridIconCon
                      ? "selected_grid_icon.svg"
                      : "unselected_grid_icon.svg")),
            ],
          )
        ],
      ),
      getVerSpace(32.h),
      getSearchField("Search...", fillColor: grey10),
      getVerSpace(32.h),
      Expanded(
        child: Container(
          child: widget,
        ),
      )
    ],
  ).paddingSymmetric(horizontal: 20.h);
}

Widget getDivider({double? horPadding, Color? color}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horPadding ?? 20.w),
    child: Divider(
      color: color ?? Color(0XFFDCDCDC),
    ),
  );
}

Widget getProfileOption(String image, String name, Function function,
    {double? height, double? width}) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.h),
          border: Border.all(color: grey20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              getSvgImage(image, height: height ?? 24.h, width: width ?? 24.h),
              getHorSpace(20.w),
              getCustomFont(name, 16.sp, regularBlack, 1,
                  fontWeight: FontWeight.w500, fontFamily: Constant.fontsFamily)
            ],
          ),
          getSvgImage("arrow_right_black.svg", height: 20.h, width: 20.w)
        ],
      ).paddingAll(16.h),
    ),
  );
}

Widget getMyprofileDetailFormate(
    String iconImage, String cetegoryName, String userDetail) {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getSvgImage(iconImage,
                height: 24.h, width: 24.w, color: buttonColor),
            getHorSpace(16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCustomFont(cetegoryName, 16.sp, Color(0XFF808080), 1,
                    fontWeight: FontWeight.w500),
                getVerSpace(7.h),
                getCustomFont(userDetail, 16.sp, regularBlack, 1,
                    fontWeight: FontWeight.w500)
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget getEditProfileOptionFormate(bool suffixIconPosition,
    {String? iconImage,
    double? height,
    int? maxline,
    bool requredImage = false,
    String? hint,
    String? userdetail}) {
  return Container(
    height: height ?? 60.h,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 16,
              color: regularBlack.withOpacity(0.03))
        ],
        color: regularWhite),
    child: TextFormField(
      maxLines: maxline ?? 1,
      initialValue: userdetail,
      decoration: InputDecoration(
          suffixIcon: suffixIconPosition
              ? getSvgImage("arrow_down.svg", height: 16.h, width: 16.h)
                  .paddingOnly(top: 20.h, bottom: 20.h, right: 20.h)
              : null,
          border: InputBorder.none,
          hintText: hint,
          hintStyle:
              TextStyle(fontFamily: Constant.fontsFamily, color: regularBlack),
          contentPadding: suffixIconPosition
              ? EdgeInsets.only(left: 18.h, top: 20.h)
              : EdgeInsets.only(left: 18.h, top: 10.h)),
    ),
  );
}

Widget question_answer(q, a) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        border: Border.all(color: grey20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getMultilineCustomFont(
          q,
          18.sp,
          regularBlack,
          fontWeight: FontWeight.w700,
        ),
        getVerSpace(16.h),
        getMultilineCustomFont(
          a,
          14.sp,
          grey40,
          fontWeight: FontWeight.w400,
        )
      ],
    ).paddingAll(16.h),
  );
}
