/*
class SideMenuRaferFriendScreen extends StatefulWidget {
  @override
  State<SideMenuRaferFriendScreen> createState() =>
      _SideMenuRaferFriendScreenState();
}

class _SideMenuRaferFriendScreenState extends State<SideMenuRaferFriendScreen> {
  backclick() {
    Constant.backToFinish();
  }

  // SideMenuRaferFriendScreenController sideMenuRaferFriendScreenController =
   //   Get.put(SideMenuRaferFriendScreenController());

  @override
  /*Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SideMenuRaferFriendScreenController>(
  //    init: SideMenuRaferFriendScreenController(),
      builder: (sideMenuRaferFriendScreenController) => WillPopScope(
          onWillPop: () async {
            backclick();
            return false;
          },
          child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: SafeArea(
              child: Column(
                children: [
                  getVerSpace(24.h),
                  getCustomAppBar("Refer A Friend", () {
                    backclick();
                  }).paddingSymmetric(horizontal: 20.h),
                  getVerSpace(16.87.h),
                  Container(
                    width: double.infinity,
                    child: common_container(context.theme.focusColor,
                        child: Column(
                          children: [
                            getSvgImage("rafer_friend_icon.svg"),
                            getVerSpace(20.h),
                            getMultilineCustomFont(
                                    "Refer a Friend & Get 50% off",
                                    32.sp,
                                    context.theme.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    textAlign: TextAlign.center)
                                .paddingSymmetric(horizontal: 51.15.h),
                            getVerSpace(40.h),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                  ).paddingOnly(top: 10.h),
                                  getHorSpace(10.h),
                                  Expanded(
                                      child: getMultilineCustomFont(
                                          "Get 50% off upto \$20 after your friend’s 1st order Get 50% off upto \$20 after your friend’s 1st order",
                                          14.sp,
                                          Get.isDarkMode
                                              ? subTitleColorDarkTheme
                                              : subTitleColorLightTheme,
                                          fontWeight: FontWeight.w500,
                                          txtHeight: 1.7.h)),
                                ],
                              ).paddingSymmetric(horizontal: 16.h),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                  ).paddingOnly(top: 10.h),
                                  getHorSpace(10.h),
                                  Expanded(
                                      child: getMultilineCustomFont(
                                          "Your friend gets 50% off on their 1st order",
                                          14.sp,
                                          Get.isDarkMode
                                              ? subTitleColorDarkTheme
                                              : subTitleColorLightTheme,
                                          fontWeight: FontWeight.w500,
                                          txtHeight: 1.7.h)),
                                ],
                              ).paddingSymmetric(horizontal: 16.h),
                            ),
                            getVerSpace(50.h),
                            getCustomButton("Refer a friend", () {})
                                .paddingSymmetric(horizontal: 91.52.h)
                          ],
                        ).paddingSymmetric(horizontal: 16.h, vertical: 50.h)),
                  ).paddingSymmetric(horizontal: 16.h)
                ],
              ),
            ),
          )),
    );
  }*/
}*/
