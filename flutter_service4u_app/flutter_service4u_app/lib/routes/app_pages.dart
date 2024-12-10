import 'package:flutter/cupertino.dart';
import '../view/booking_tab/booking_tab_screen.dart';
import '../view/booking_tab/histry_detail_screen.dart';
import '../view/home_main_screen.dart';
import '../view/home_tab/categories_screens/ac_repair_categories_screens/ac_repair_screen.dart';
import '../view/home_tab/categories_screens/ac_repair_categories_screens/add_new_card_screen.dart';
import '../view/home_tab/categories_screens/ac_repair_categories_screens/order_confirm_screen.dart';
import '../view/home_tab/categories_screens/appliance_categories_screens/appliance_categories_screen.dart';
import '../view/home_tab/categories_screens/ac_repair_categories_screens/ac_repair_service_detail_screen.dart';
import '../view/home_tab/categories_screens/appliance_categories_screens/cancel_booking_screen.dart';
import '../view/home_tab/categories_screens/appliance_categories_screens/card_scane_screen.dart';
import '../view/home_tab/categories_screens/ac_repair_categories_screens/cheak_out_screen.dart';
import '../view/home_tab/categories_screens/appliance_categories_screens/order_details_screen.dart';
import '../view/home_tab/categories_screens/ac_repair_categories_screens/payment_screen.dart';
import '../view/home_tab/categories_screens/ac_repair_categories_screens/phone_number_screen.dart';
import '../view/home_tab/categories_screens/appliance_categories_screens/place_order_screen.dart';
// import '../view/home_tab/categories_screens/beauty_categories_screens/beaty_screen.dart';
// import '../view/home_tab/categories_screens/beauty_categories_screens/beauty_service_detail.dart';
import '../view/home_tab/categories_screens/categories_screen.dart';
// import '../view/home_tab/categories_screens/cleaning_categories_screens/cleaning_service_detail.dart';
// import '../view/home_tab/categories_screens/cleaning_categories_screens/cleaning_service_screen.dart';
import '../view/home_tab/categories_screens/electronics_categories_screens/electronics_screen.dart';
// import '../view/home_tab/categories_screens/mens_salon_categories_screens/mens_slon_screen.dart';
import '../view/home_tab/categories_screens/order_cancle_dialogue.dart';
import '../view/home_tab/categories_screens/order_confirm_dialogue.dart';
// import '../view/home_tab/categories_screens/painting_categories_screens/painting_screen.dart';
import '../view/home_tab/categories_screens/plumbing_categories_screens/plumbing_screen.dart';
// import '../view/home_tab/categories_screens/shifting_categories_screens/shifting_screen.dart';
import '../view/home_tab/home_screen.dart';
import '../view/home_tab/recommended_service_screen.dart';
import '../view/home_tab/side_menu_screens/add_new_address_screen.dart';
import '../view/home_tab/side_menu_screens/live_chate_screen.dart';
import '../view/home_tab/side_menu_screens/rewards_point_screen.dart';
import '../view/home_tab/side_menu_screens/side_menu_calender_screen.dart';
import '../view/home_tab/side_menu_screens/side_menu_address_screen.dart';
import '../view/home_tab/side_menu_screens/side_menu_notification_screen.dart';
import '../view/home_tab/side_menu_screens/side_menu_support_screen.dart';
import '../view/home_tab/side_menu_screens/sidemenu_profile_screen.dart';
import '../view/notification_tab/notification_screen.dart';
import '../view/onboarding/onboarding_screen.dart';
import '../view/profile_tab/edit_profile_screen.dart';
import '../view/provider_service_screen.dart';
import '../view/profile_tab/help_center_screen.dart';
import '../view/profile_tab/my_profile_screen.dart';
import '../view/profile_tab/privacy_policy_screen.dart';
import '../view/profile_tab/profile_screen.dart';
import '../view/profile_tab/security_screen.dart';
import '../view/profile_tab/setting_screens.dart';
import '../view/profile_tab/term_and_condition_screen.dart';
import '../view/sign_in/forgot_password_empty_state.dart';
import '../view/sign_in/reset_password_screen.dart';
import '../view/sign_in/sign_in_empty_state.dart';
import '../view/sign_up/sign_up_empty_state.dart';
import '../view/signup_provider/sign_up_provider_empty_state.dart';
import '../view/sign_up/verification_screen.dart';
import '../view/signup_provider/verification_Provider_screen.dart';
import '../view/splash_screen/splash_screen.dart';
import 'app_routes.dart';
import '../view/provider_profile_tab/edit_profilePro_screen.dart';
import '../view/provider_profile_tab/provider_my_profile_screen.dart';
import '../view/provider_profile_tab/provider_Booking.dart';

class AppPages {
  static const initialRoute = Routes.splashScreenRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.splashScreenRoute: (context) => SplashScreen(),
    Routes.onBoardingScreenRoute: (context) => OnBoardingScreen(),
    Routes.signInEmptyStateRoute: (context) => SignInEmptyState(),
    Routes.sinUpEmptyStateRoute: (context) => SinUpEmptyState(),
    Routes.SignUpProviderEmptyState: (context) => SignUpProviderEmptyState(),
    Routes.verificationScreenRoute: (context) => VerificationScreen(),
    Routes.verificationproviderScreenRoute: (context) =>
        VerificationProviderScreen(),
    Routes.forgotPasswordEmptyStateRoute: (context) =>
        ForgotPasswordEmptyState(),
    Routes.resetPasswordScreenRoute: (context) => ResetPasswordScreen(),
    Routes.homeMainScreenRoute: (context) => HomeMainScreen(),
    Routes.ProviderServiceScreenRoute: (context) => ProviderServiceScreen(),
    Routes.homeScreenRoute: (context) => HomeScreen(),
    Routes.bookingScreenRoute: (context) => BookingScreen(),
     Routes.ProviderBookingScreenRoute: (context) => ProviderBookingScreen(providerId: '',),
    Routes.notificationScreenRoute: (context) => NotificationScreen(),
    Routes.profileScreenRoute: (context) => ProfileScreen(),
    // Routes.cleaningServiceScreenRoute: (context) => CleaningServiceScreen(),
    Routes.categoriesScreenRoute: (context) => CategoriesScreen(),
    Routes.aCRepairScreenRoute: (context) => ACRepairScreen(),
    // Routes.beautyScreenRoute: (context) => BeautyScreen(),
    // Routes.paintingScreenRoute: (context) => PaintingScreen(),
    Routes.plumbingScreenRoute: (context) => PlumbingScreen(),
    Routes.electronicScreenRoute: (context) => ElectronicsScreen(),
    // Routes.shiftingScreenRoute: (context) => ShiftingScreen(),
    // Routes.mensSalonScreenRoute: (context) => MensSalonScreen(),
    Routes.applianceCategoriesScreenRoute: (context) => ApplianceScreen(),
    //Routes.applianceServiceDetailScreenRoute: (context) => ApplianceScreen(),
    Routes.sideMenuProfifileScreenRoute: (context) => SideMenuProfifileScreen(),
    Routes.calendarScreenRoute: (context) => CalendarScreen(),
    Routes.sideMenuAddressScreenRoute: (context) => SideMenuAddressScreen(),
    Routes.sideMenuNotificationScreenRoute: (context) =>
        SideMenuNotificationScreen(),
    Routes.sideMenuSupportScreenRoute: (context) => SideMenuSupportScreen(),
    Routes.acRepairServiceDetailScreenRoute: (context) => AcRepairServiceDetailScreen(),
    // Routes.cleaningServiceDetailScreenRoute: (context) =>
    //     CleaningServiceDetailScreen(),
    // Routes.beautyServiceDetailRoute: (context) => BeautyServiceDetail(),
    Routes.cheakOutScreenRoute: (context) => CheakOutScreen(),
    Routes.phoneNumberScreenRoute: (context) => PhoneNumberScreen(),
   // Routes.promoCodeScreenRoute: (context) => PromoCodeScreen(),
    Routes.placeOrderScreenRoute: (context) => PlaceOrderScreen(),
    Routes.payMentScreenRoute: (context) => PayMentScreen(),
    Routes.orderDetailScreenRoute: (context) => OrderDetailScreen(),
    Routes.histryDetailScreenRoute: (context) => HistryDetailScreen(),
    Routes.calcelBookingScreenRoute: (context) => CalcelBookingScreen(),
    Routes.orderCancelDialogueRoute: (context) => OrderCancelDialogue(),
    Routes.orderConfirmDialogueRoute: (context) => OrderConfirmDialogue(),
    Routes.liveChateScreenRoute: (context) => LiveChateScreen(),
    Routes.rewardsPointScreenRoute: (context) => RewardsPointScreen(),
    Routes.cardScaneScreenRoute: (context) => CardScaneScreen(),
    Routes.addNewCardScreenRoute: (context) => AddNewCardScreen(),
    Routes.orderConfirmScreenRoute: (context) => OrderConfirmScreen(),
    Routes.addNewAddressScreenRoute: (context) => AddNewAddressScreen(),
    Routes.myProfileScreenRoute: (context) => MyProfileScreen(),
    Routes.providerMyProfileScreenRoute: (context) => ProviderMyProfileScreen(),
  
    Routes.editProfileSCreenRoute: (context) => EditProfileSCreen(),
    Routes.EditProfileProSCreenRoute: (context) => EditProfileProSCreen(),

    Routes.settingScreensRoute: (context) => SettingScreens(),
    Routes.helpCenterScreenRoute: (context) => HelpCenterScreen(),
    Routes.privacyPolicyScreenRoute: (context) => PrivacyPolicyScreen(),
    Routes.securityScreenRoute: (context) => SecurityScreen(),
    Routes.termsAndConditionScreenRoute: (context) => TermsAndConditionScreen(),
    Routes.recommendedServiceScreenRoute: (context) =>
        RecommendedServiceScreen(),
    // Routes.introRoute: (context) => IntroScreen(),
  };
}
