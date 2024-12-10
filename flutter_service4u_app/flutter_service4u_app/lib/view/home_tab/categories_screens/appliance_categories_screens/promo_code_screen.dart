/*
class PromoCodeScreen extends StatefulWidget {
  @override
  State<PromoCodeScreen> createState() => _PromoCodeScreenState();
}

class _PromoCodeScreenState extends State<PromoCodeScreen> {
  backclick() {
    Constant.backToFinish();
  }

  PromoCodeScreenController promoCodeScreenController =
      Get.put(PromoCodeScreenController());
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);

    return GetBuilder<PromoCodeScreenController>(
      init: PromoCodeScreenController(),
      builder: (promoCodeScreenController) => WillPopScope(
          onWillPop: () async {
            backclick();
            return false;
          },
          child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(24.h),
                  getCustomAppBar("Code", () {
                    backclick();
                  }).paddingSymmetric(horizontal: 20.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      color: context.theme.focusColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont("Add New Number", 16.sp, regularBlack, 1,
                            fontWeight: FontWeight.w500),
                        getVerSpace(14.h),
                        getTextField("Apply Code", "",
                            suffixiconpermition: true,
                            fillColor: grey10,
                            widget: GestureDetector(
                                onTap: () {},
                                child: Container(
                                        height: 34.h,
                                        width: 71.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.h),
                                            color: buttonColor),
                                        child: Center(
                                            child: getCustomFont(
                                                "Apply", 14.sp, regularBlack, 1,
                                                fontWeight: FontWeight.w500)))
                                    .paddingSymmetric(
                                        vertical: 11.h, horizontal: 16.h))),
                      ],
                    ).paddingSymmetric(horizontal: 16.h, vertical: 17.h),
                  ),
                  getVerSpace(16.h),
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
                                "Phone number", 16.sp, regularBlack, 1,
                                fontWeight: FontWeight.w500),
                            add_button(
                                promoCodeScreenController.promocode.length == 0
                                    ? "Add"
                                    : "Change",
                                promoCodeScreenController.promocode.length == 0
                                    ? "add_icon_black.svg"
                                    : "edit_icon.svg", () {
                              Constant.sendToNext(
                                  context, Routes.phoneNumberScreenRoute);
                            })
                          ],
                        ),
                        getVerSpace(6.h),
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: promoCodeScreenController.promocode.length,
                          itemBuilder: (context, index) {
                            PromoCode code =
                                promoCodeScreenController.promocode[index];
                            return promo_code_formate(
                                    code.code, code.discription, () {
                              promoCodeScreenController
                                  .setPromocodeIndex(index);
                              promoCodeScreenController.setPromoCode(code.id);
                            },
                                    radioButtonpermition: true,
                                    radioWidget: getSvgImage(
                                        promoCodeScreenController.promoId ==
                                                code.id
                                            ? "select_radio_icon.svg"
                                            : "unselect_radio_icon.svg"))
                                .paddingSymmetric(vertical: 12.h);
                          },
                        ),
                      ],
                    ).paddingAll(16.h),
                  ).paddingSymmetric(horizontal: 20.h),
                ],
              ),
            ),
          )),
    );
  }

// Widget promocode_formet(
//     color, icon, title, address, id) {
//   return GetBuilder<PromoCodeScreenController>(
//     init: PromoCodeScreenController(),
//     builder: (promoCodeScreenController) => GestureDetector(
//       onTap: () {
//         promoCodeScreenController.setPromoCode(id);
//         promoCodeScreenController.setPromocodeData(color, icon, title, address, id);
//       },
//       child: Container(
//         child: Row(
//           children: [
//             Container(
//               height: 56.h,
//               width: 56.h,
//               decoration: BoxDecoration(shape: BoxShape.circle, color: color),
//               child: getSvgImage(icon).paddingOnly(
//                   left: 16.h, top: 15.h, right: 16.h, bottom: 17.h),
//             ),
//             getHorSpace(16.h),
//             Expanded(
//                 child: Container(
//               width: 204.h,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   getCustomFont(title, 16.sp, context.theme.primaryColor, 1,
//                       fontWeight: FontWeight.w700),
//                   getVerSpace(4.h),
//                   getMultilineCustomFont(address, 13.sp, Color(0XFF888C97),
//                       fontWeight: FontWeight.w500, txtHeight: 1.5.h)
//                 ],
//               ).paddingOnly(right: 68.h),
//             )),
//           getSvgImage(promoCodeScreenController.addressID == id
//                     ? "select_radio_icon.svg"
//                     : "unselect_radio_icon.svg")
//
//           ],
//         ),
//       ).paddingOnly(right: 16.h, left: 16.h),
//     ),
//   );
// }
}
*/