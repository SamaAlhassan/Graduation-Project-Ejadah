/*
class AcRepairServiceDetailScreen extends StatefulWidget {
  @override
  State<AcRepairServiceDetailScreen> createState() =>
      _AcRepairServiceDetailScreenState();
}

backclick() {
  Constant.backToFinish();
}

class _AcRepairServiceDetailScreenState
    extends State<AcRepairServiceDetailScreen> {
  AcRepairServiceDetailScreenController acRepairServiceDetailScreenController =
      Get.put(AcRepairServiceDetailScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () async {
        backclick();
        return false;
      },
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 315.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.h),
                      image: DecorationImage(
                          image: AssetImage(
                              Constant.assetImagePath + "ac_service_1st.png"),
                          fit: BoxFit.fill)),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getVerSpace(24.h),
                        GestureDetector(
                            onTap: () {
                              backclick();
                            },
                            child: getSvgImage("arrow_left_white.svg")),
                      ],
                    ).paddingSymmetric(horizontal: 20.h),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.h),
                      color: regularWhite,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 22,
                            color: regularBlack.withOpacity(0.07))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      getCustomFont("AC Repair Service", 20.sp, regularBlack, 1,
                          fontWeight: FontWeight.w700),
                      getVerSpace(4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getCustomFont("\$${30.00}", 16.sp, regularBlack, 1,
                              fontWeight: FontWeight.w400),
                          Row(
                            children: [
                              getSvgImage("star_icon.svg",
                                  height: 16.h, width: 16.h),
                              getHorSpace(2.h),
                              getCustomFont("4.2", 14.sp, regularBlack, 1,
                                  fontWeight: FontWeight.w400),
                            ],
                          )
                        ],
                      ),
                    ],
                  ).paddingAll(16.h),
                ).paddingOnly(top: 288.h, right: 20.h, left: 20.h)
              ],
            ),
            getVerSpace(24.h),
            Expanded(
                child: ListView(
              children: [
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCustomFont("Type Of Property", 16.sp, regularBlack, 1,
                        fontWeight: FontWeight.w500),
                    getVerSpace(16.h),
                    Row(
                      children: [
                        types_of_property_formate(
                            "home_grey_icon.svg", "Home", 1),
                        getHorSpace(20.h),
                        types_of_property_formate(
                            "office_unselect_icon.svg", "Office", 2),
                        getHorSpace(20.h),
                        types_of_property_formate(
                            "vila_unselected_icon.svg", "Villa", 3),
                      ],
                    )
                  ],
                )).paddingSymmetric(horizontal: 20.h),
                getVerSpace(24.h),
                GetBuilder<AcRepairServiceDetailScreenController>(
                  init: AcRepairServiceDetailScreenController(),
                  builder: (acRepairServiceDetailScreenController) => Row(
                    children: [
                      units_badrooms_formate(
                          "Units",
                          acRepairServiceDetailScreenController.units
                              .toString(), () {
                        acRepairServiceDetailScreenController.removeUnit();
                      }, () {
                        acRepairServiceDetailScreenController.addUnits();
                      }),
                      getHorSpace(20.h),
                      units_badrooms_formate(
                          "Bedrooms",
                          acRepairServiceDetailScreenController.bedRoom
                              .toString(), () {
                        acRepairServiceDetailScreenController.removeBedroom();
                      }, () {
                        acRepairServiceDetailScreenController.addBedroom();
                      })
                    ],
                  ).paddingSymmetric(horizontal: 20.h),
                ),
                getVerSpace(26.h),
                getCustomFont("Description", 16.sp, regularBlack, 1,
                        fontWeight: FontWeight.w500)
                    .paddingSymmetric(horizontal: 20.h),
                getVerSpace(14.h),
                Container(
                        width: 374.h,
                        child: getMultilineCustomFont(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          14.sp,
                          regularBlack,
                          fontWeight: FontWeight.w400,
                        ).paddingOnly(right: 20.h))
                    .paddingSymmetric(horizontal: 20.h)
              ],
            )),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.h),
                    topRight: Radius.circular(16.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(2, -6),
                        blurRadius: 22,
                        color: regularBlack.withOpacity(0.04))
                  ],
                  color: regularWhite),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          getCustomFont("Total :", 16.sp, grey40, 1,
                              fontWeight: FontWeight.w400),
                          getHorSpace(6.h),
                          getCustomFont("30.00", 20.sp, regularBlack, 1,
                              fontWeight: FontWeight.w700)
                        ],
                      ),
                      Row(
                        children: [
                          getCustomFont("Bill Details", 16.sp, darkYellow, 1,
                              fontWeight: FontWeight.w400, letterSpace: 0.01),
                          getHorSpace(8.h),
                          getSvgImage("down_arrow_icon.svg")
                        ],
                      )
                    ],
                  ),
                  getVerSpace(30.h),
                  getCustomButton("Book Now", () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16.h),
                              topLeft: Radius.circular(16.h))),
                      builder: (context) => ServiceBookBottomSheet(),
                    );
                  })
                ],
              ).paddingOnly(left: 20.h, right: 20.h, top: 20.h, bottom: 30.h),
            )

            /*Expanded(
              child: Container(
                child: Stack(
                  children: [
                    Container(
                        height: 255.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Constant.assetImagePath +
                                    "appliance_service_1st.png"),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getVerSpace(99.1.h),
                            Container(
                              height: 21.h,
                              width: 47.h,
                              decoration: BoxDecoration(
                                color: Color(0XFFFB9450),
                                borderRadius: BorderRadius.circular(112.h),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 5),
                                      blurRadius: 15,
                                      color:
                                          Color(0XFFFB9450).withOpacity(0.05))
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  getSvgImage("star_icon_white.svg"),
                                  getCustomFont("4.5", 12.sp, regularWhite, 1,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Gilroy')
                                ],
                              ).paddingSymmetric(horizontal: 8.h),
                            ).paddingSymmetric(horizontal: 16.h),
                            getVerSpace(7.h),
                            Container(
                                    height: 74.h,
                                    width: 203.5.h,
                                    child: getMultilineCustomFont(
                                        "AC Regular Service",
                                        28.sp,
                                        regularWhite,
                                        fontWeight: FontWeight.w700,
                                        txtHeight: 1.5.h,
                                        textAlign: TextAlign.left))
                                .paddingSymmetric(horizontal: 16.h)
                          ],
                        )),
                    Container(
                      height: 72.h,
                      width: double.infinity,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              backclick();
                            },
                            child: getSvgImage("arrow_left_black.svg",
                                    height: 48.h, width: 48.h)
                                .paddingSymmetric(horizontal: 12.h),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.h),
                                color: regularWhite),
                            child: Column(
                              children: [
                                seeAll_button_formate(
                                  "Type of Property",
                                  context.theme.primaryColor,
                                  () {},
                                  "Recent",
                                  Get.isDarkMode
                                      ? "down_arrow_icon_white.svg"
                                      : "down_arrow_icon_blue.svg",
                                  fontsize: 18.sp,
                                  fontwidth: FontWeight.w600,
                                  buttonPermition: false,
                                ),
                                getVerSpace(16.h),
                                Row(
                                  children: [
                                    property_button(
                                        "Home",
                                        "home_icon_black.svg",
                                        1,
                                        20.h,
                                        20.h,
                                        20.h,
                                        20.h),
                                    getHorSpace(39.66.h),
                                    property_button("Office", "office_icon.svg",
                                        2, 18.h, 20.h, 19.25.h, 18.75.h),
                                    getHorSpace(39.66.h),
                                    property_button(
                                        "Vila",
                                        "vila_unselected_icon.svg",
                                        3,
                                        19.58.h,
                                        18.42.h,
                                        18.48.h,
                                        19.52.h)
                                  ],
                                ).paddingSymmetric(horizontal: 29.83.h)
                              ],
                            ).paddingSymmetric(
                                vertical: 16.h, horizontal: 16.h),
                          ),
                          getVerSpace(6.h),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.h),
                                color: regularWhite),
                            child: Column(
                              children: [
                                GetBuilder<
                                    AcRepairServiceDetailScreenController>(
                                  init:
                                      AcRepairServiceDetailScreenController(),
                                  builder: (AcRepairServiceDetailScreenController) =>
                                      number_of_bath_unit_formate(
                                          AcRepairServiceDetailScreenController
                                              .units,
                                          "Number of Units", () {
                                    AcRepairServiceDetailScreenController
                                        .removeUnit();
                                  }, () {
                                    AcRepairServiceDetailScreenController
                                        .addUnits();
                                  },
                                          AcRepairServiceDetailScreenController
                                                      .units >
                                                  1
                                              ? regularWhite
                                              : Color(0XFF2E4460),
                                          AcRepairServiceDetailScreenController
                                                      .units >
                                                  1
                                              ? blue
                                              : Color(0XFF2E4460),
                                          AcRepairServiceDetailScreenController
                                                      .units >
                                                  1
                                              ? blue
                                              : regularWhite,
                                          1),
                                ),
                                getVerSpace(8.h),
                                Divider(
                                  color: Color(0XFFEEEEEE),
                                ),
                                getVerSpace(8.h),
                                GetBuilder<
                                    AcRepairServiceDetailScreenController>(
                                  init:
                                      AcRepairServiceDetailScreenController(),
                                  builder: (AcRepairServiceDetailScreenController) =>
                                      number_of_bath_unit_formate(
                                          AcRepairServiceDetailScreenController
                                              .bedRoom,
                                          "Number of Bedrooms", () {
                                    AcRepairServiceDetailScreenController
                                        .removeBedroom();
                                  }, () {
                                    AcRepairServiceDetailScreenController
                                        .addBedroom();
                                  },
                                          AcRepairServiceDetailScreenController
                                                      .bedRoom >
                                                  1
                                              ? regularWhite
                                              : Color(0XFF2E4460),
                                          AcRepairServiceDetailScreenController
                                                      .bedRoom >
                                                  1
                                              ? blue
                                              : Color(0XFF2E4460),
                                          AcRepairServiceDetailScreenController
                                                      .bedRoom >
                                                  1
                                              ? blue
                                              : regularWhite,
                                          2),
                                )
                              ],
                            ).paddingSymmetric(
                                horizontal: 16.h, vertical: 16.h),
                          ),
                        ],
                      ),
                    ).paddingOnly(top: 206.4.h, left: 16.h, right: 16.h)
                  ],
                ),
              ),
            ),
            Container(
              color: context.theme.focusColor,
              child: Column(
                children: [
                  getVerSpace(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          getRichtext("Total:", " USD 150.50",
                              firsttextcolor: Color(0XFF6F767E),
                              secondtextcolor: context.theme.primaryColor,
                              firsttextSize: 14.sp,
                              firstTextwidth: FontWeight.w600,
                              secondtextSize: 14.sp,
                              secondTextwidth: FontWeight.w600)
                        ],
                      ),
                      Row(
                        children: [
                          getCustomFont(
                              "Bill Details", 14.sp, Color(0XFFFC944D), 1,
                              fontWeight: FontWeight.w500),
                          getHorSpace(7.h),
                          getSvgImage("up_arrow_icon.svg")
                        ],
                      )
                    ],
                  ),
                  getVerSpace(20.h),
                  Row(
                    children: [
                      Expanded(
                        child: getCustomButton("Save Draft", () {},
                            color: context.theme.primaryColor,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.h),
                                border:
                                    Border.all(color: greyButton, width: 2.h),
                                color: Color(0XFFFCFCFC))),
                      ),
                      getHorSpace(8.h),

                      Expanded(
                          child: getCustomButton("Book Now", () {
                            showFlexibleBottomSheet(
bottomSheetColor: regularWhite,
                              minHeight: 0,
                              initHeight: 0.8,
                              context: context,
                              builder: _buildBottomSheet,
                              anchors: [0, 0.5, 1],
                              isSafeArea: true,
                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(16.h),topRight: Radius.circular(16.h))),
                            );

                      })),
                    ],
                  ),
                  getVerSpace(16.h),
                ],
              ).paddingSymmetric(horizontal: 16.h),
            )*/
          ],
        ),
      ),
    );
  }

  Widget property_button(title, icon, id, top, bottom, left, right) {
    return GetBuilder<AcRepairServiceDetailScreenController>(
      init: AcRepairServiceDetailScreenController(),
      builder: (AcRepairServiceDetailScreenController) => Expanded(
          child: GestureDetector(
        onTap: () {
          AcRepairServiceDetailScreenController.setSelectProperty(id);
        },
        child: Column(
          children: [
            Container(
              height: 64.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.h),
                  border: Border.all(
                      color: AcRepairServiceDetailScreenController
                                  .selectedPropertyID ==
                              id
                          ? blue
                          : Color(0XFFD1D3D4),
                      width: 2.h),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 30,
                        color: AcRepairServiceDetailScreenController
                                    .selectedPropertyID ==
                                id
                            ? Color(0XFF3B71FE).withOpacity(0.06)
                            : Color(0XFF8585A3).withOpacity(0.05))
                  ],
                  color: AcRepairServiceDetailScreenController
                              .selectedPropertyID ==
                          id
                      ? blue
                      : regularWhite),
              child: getSvgImage(icon,
                      color: AcRepairServiceDetailScreenController
                                  .selectedPropertyID ==
                              id
                          ? regularWhite
                          : Color(0XFFD1D3D4))
                  .paddingOnly(
                      top: top, bottom: bottom, left: left, right: right),
            ),
            getVerSpace(12.h),
            getCustomFont(title, 13.sp, Color(0XFF272B30), 1,
                fontWeight: FontWeight.w500)
          ],
        ),
      )),
    );
  }

  Widget number_of_bath_unit_formate(int number, title, Function removeIcon,
      Function addIcon, iconColor, borderColor, buttonColor, id) {
    return GetBuilder<AcRepairServiceDetailScreenController>(
      init: AcRepairServiceDetailScreenController(),
      builder: (acRepairServiceDetailScreenController) => Container(
        height: 36.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getCustomFont(title, 16.sp, context.theme.primaryColor, 1,
                fontWeight: FontWeight.w500),
            Row(
              children: [
                Container(
                  height: 36.h,
                  width: 36.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.h),
                      border: Border.all(color: textFieldHint),
                      color: regularWhite),
                  child: GestureDetector(
                      onTap: () {
                        removeIcon();
                      },
                      child:
                          getSvgImage("remove_icon.svg", color: textFieldHint)
                              .paddingSymmetric(horizontal: 12.h)),
                ),
                getHorSpace(18.h),
                getCustomFont("${number}", 18.sp, Color(0XFF363F4F), 1,
                    fontWeight: FontWeight.w400),
                getHorSpace(18.h),
                Container(
                  height: 36.h,
                  width: 36.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.h),
                      border: Border.all(color: borderColor //Color(0XFF2E4460)
                          ),
                      color: buttonColor //regularWhite
                      ),
                  child: GestureDetector(
                      onTap: () {
                        addIcon();
                      },
                      child: getSvgImage("add_icon_white.svg", color: iconColor
                              //Color(0XFF2E4460)
                              )
                          .paddingAll(11.h)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget types_of_property_formate(icon, title, id) {
    return GetBuilder<AcRepairServiceDetailScreenController>(
      init: AcRepairServiceDetailScreenController(),
      builder: (acRepairServiceDetailScreenController) => Expanded(
          child: GestureDetector(
        onTap: () {
          acRepairServiceDetailScreenController.setSelectProperty(id);
        },
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.h),
              color:
                  acRepairServiceDetailScreenController.selectedPropertyID == id
                      ? darkYellow
                      : grey10),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getSvgImage(icon,
                    color: acRepairServiceDetailScreenController
                                .selectedPropertyID ==
                            id
                        ? regularBlack
                        : grey40),
                getHorSpace(11.h),
                getCustomFont(
                    title,
                    16.sp,
                    acRepairServiceDetailScreenController.selectedPropertyID ==
                            id
                        ? regularBlack
                        : grey40,
                    1,
                    fontWeight: FontWeight.w400)
              ],
            ).paddingSymmetric(horizontal: 18.h, vertical: 8.h),
          ),
        ),
      )),
    );
  }

  Widget units_badrooms_formate(title, quntity, removeFunction, addFunction) {
    return GetBuilder<AcRepairServiceDetailScreenController>(
      init: AcRepairServiceDetailScreenController(),
      builder: (acRepairServiceDetailScreenController) => Expanded(
          child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.h),
            border: Border.all(color: grey40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCustomFont(title, 16.sp, regularBlack, 1,
                fontWeight: FontWeight.w500),
            getVerSpace(16.h),
            Row(
              children: [
                add_remove_button("remove_icon.svg", removeFunction, grey10),
                getHorSpace(24.h),
                getCustomFont(quntity, 16.sp, regularBlack, 1,
                    fontWeight: FontWeight.w400),
                getHorSpace(24.h),
                add_remove_button(
                    "add_icon_black.svg", addFunction, darkYellow),
              ],
            ),
          ],
        ).paddingAll(16.h),
      )),
    );
  }

  Widget add_remove_button(icon, function, bgcolor) {
    return GetBuilder<AcRepairServiceDetailScreenController>(
      init: AcRepairServiceDetailScreenController(),
      builder: (acRepairServiceDetailScreenController) => GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.h), color: bgcolor),
          child: getSvgImage(icon).paddingAll(4.h),
        ),
      ),
    );
  }
}
*/