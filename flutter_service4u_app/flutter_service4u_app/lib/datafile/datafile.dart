import 'dart:ui';

import '../models/ac_repair_all_service_data_model.dart';
import '../models/added_card_data_maodel.dart';
import '../models/address_data_model.dart';
import '../models/appliance_categories_data_model.dart';
import '../models/electronics_categories_data_model.dart';
import '../models/plumbing_categories_data_model.dart';
import '../models/beauty_category_data_model.dart';
import '../models/booking_upcoming_data_model.dart';
import '../models/cancel_order_reason_model.dart';
import '../models/categories_model.dart';
import '../models/cleaning_service_model.dart';
import '../models/cleaninng_service_offer_model.dart';
import '../models/notification_data_model.dart';
import '../models/offer_data_model.dart';
import '../models/onbording_screen_model.dart';
import '../models/phone_number_data_model.dart';
import '../models/promocode_data_model.dart';
import '../models/recommended_data_model.dart';
import '../models/service_offer_model.dart';
import '../models/side_menu_data_model.dart';
import '../utils/color_category.dart';

class DataFile {
  static List<OnBoarding> getOnbordingdata() {
    return [
      OnBoarding(
          image: 'onboarding1st.png',
          title: 'Beauty parlour at your home',
          discription:
              'Lorem ipsum is a placeholder text commonly used to demonstrate the visual.'),
      OnBoarding(
          image: 'onboarding2nd.png',
          title: 'Plumber & expart nearby you',
          discription:
              'Lorem ipsum is a placeholder text commonly used to demonstrate the visual.'),
      OnBoarding(
          image: 'onboarding3rd.png',
          title: 'Professional home cleaning',
          discription:
              'Lorem ipsum is a placeholder text commonly used to demonstrate the visual.'),
    ];
  }

  static List<CleaningService> getCleaningService() {
    return [
      CleaningService("cleaning_service1st.png", "Home Cleaning ", "10", "150",
          "4.8", "87", 1),
      CleaningService("cleaning_service2nd.png", "Carpet Cleaning", "0", "140",
          "4.5", "87", 2),
      CleaningService("cleaning_service3rd.png", "Bathroom Cleaning", "0",
          "128", "4.5", "87", 3),
      CleaningService("cleaning_service4th.png", "Kitchen Cleaning", "0", "130",
          "4.5", "87", 4),
    ];
  }

  //this.image,this.title,this.price,this.rating,this.discount,this.id
  static List<CleaningServiceOffer> getCleaningOfferData() {
    return [
      CleaningServiceOffer("cleaning_service1st.png", "Home Cleaning Service",
          "15.00", "4.5", "10", 1),
      CleaningServiceOffer("cleaning_service2nd.png", "Carpet Cleaning Service",
          "15.00", "4.5", "10", 2),
      CleaningServiceOffer("cleaning_service3rd.png",
          "Bathroom Cleaning Service", "15.00", "4.5", "", 3),
      CleaningServiceOffer("cleaning_service4th.png",
          "Kitchen Cleaning Service", "15.00", "4.5", "", 4),
    ];
  }

  static List<RecommendedData> getRecommendedData() {
    return [
      RecommendedData(
          "ac_service_1st.png", "AC Repair Service", "30.00", '4.5', '', 1),
      RecommendedData("recommended_2nd.png", "Manicure", "25.00", '4.5', '', 2),
      RecommendedData(
          "recommended_3rd.png", "Bathroom Cleaning", "20.00", '4.5', '', 3),
    ];
  }

  static List<BeautyData> getBeautyData() {
    return [
      BeautyData(
          "beauty_1st.png", "Dklayut Makeup Service", "150", '10', "4.8", 1),
      BeautyData("beauty_2nd.png", "Hair Style Service", "140", '', "4.5", 2),
      BeautyData("beauty_3rd.png", "Multi Mask  Service", "128", '', "4.5", 3),
      BeautyData(
          "beauty_4th.png", "Hair Rebonding Service", "130", '', "4.5", 4),
    ];
  }

  static List<Categories> getCategories() {
    return [
      Categories("AC Repair", "ac_repair_icon.png", 1),
      Categories("Beauty", "beauty_icon.png", 2),
      Categories("Appliance", "appliance_icon.png", 3),
      Categories("Painting", "painting_icon.png", 4),
      Categories("Cleaning", "cleaning_icon.png", 5),
      Categories("Plumbing", "plumbing_icon.png", 6),
      Categories("Electronics", "electronics_icon.png", 7),
      Categories("Shifting", "shifting_icon.png", 8),
      Categories("Men's Salon", "men's_salon_icon.png", 9),
      Categories("Gardening", "gardening_icon.png", 10),
      Categories("Ironing", "ironing_icon.png", 11),
    ];
  }

  static List<Address> getAddressData() {
    return [
      Address("home_icon_black.svg", "Home",
          "2972 Westheimer Rd. Santa Ana, Illinois 85486", 1),
      Address("office_unselect_icon.svg", "Office",
          "8502 Preston Rd. Inglewood, Maine 98380", 2),
    ];
  }

  static List<PhoneNumbers> getPhoneNumberData() {
    return [
      PhoneNumbers("phone_nubemer_user.png", "(603) 555-0123", "Primary", 1),
    ];
  }

  static List<PromoCode> getPromocodeData() {
    return [
      PromoCode("Xyz2022", "You will get 10% discount for this promo code", 1),
      PromoCode(
          "Service22", "You will get 20% discount for this promo code", 2),
    ];
  }


  static List<AllacService> getAllacService() {
    return [
      AllacService(
          "ac_service_1st.png", "AC Repair Service", "10 - 150", "4.2", "10", 1),
      AllacService(
          "ac_service_2nd.png", "AC Installation", "10 - 150", "4.8", "", 2),
      AllacService(
          "ac_service_3rd.png", "AC leak detection", "10 - 150", "4.5", "", 3),
      AllacService("ac_service_4th.png", "AC cleaning", "10 - 150", "4.0", "", 4),
      AllacService("ac_service_5th.png", "AC compressor repairing", "10 - 150",
          "4.2", "", 5),
    ];
  }

  static List<Offer> getofferData() {
    return [
      Offer("Offer AC Service", "25%", Color(0XFFEAF6EF), Color(0XFF6A9B7E)),
      Offer("Offer AC Service", "25%", Color(0XFFE9F6FC), Color(0XFFE9F6FC)),
      Offer("Offer AC Service", "25%", Color(0XFFFFBC99), Color(0XFFFFBC99)),
    ];
  }

/*
String? image,   String? rate,   String? ratting,   String? serviceName,   String? numberOfReview,   int? id,
 */
   static List<ApplianceService> getApplianceService() {
    return [
      ApplianceService(
        image: "appliance_service_1st.jpg",
        price: "10 - 150",
        rating: "4.8",
        title: "Refrigerator Repair",
        discount: "87",
        // id: 1, // Add 'id' if you include it in the class
      ),
      ApplianceService(
        image: "appliance_service_2nd.jpg",
        price: "10 - 150",
        rating: "4.5",
        title: "Dishwasher Repair",
        discount: "87",
        // id: 2,
      ),
      ApplianceService(
        image: "appliance_service_3rd.jpeg",
        price: "10 - 150",
        rating: "4.5",
        title: "Washing Machine Repair",
        discount: "87",
        // id: 3,
      ),
      ApplianceService(
        image: "appliance_service_4th.jpg",
        price: "10 - 150",
        rating: "4.5",
        title: "TV Repair",
        discount: "87",
        // id: 4,
      ),
      ApplianceService(
        image: "appliance_service_5th.jpeg",
        price: "10 - 150",
        rating: "4.5",
        title: "Oven Repair",
        discount: "87",
        // id: 4,
      ),
    ];
  }
 static List<ElectronicsService> getElectronicsService() {
    return [
      ElectronicsService(
        image: "electronics_service_1st.jpg",
        price: "10 - 150",
        rating: "4.8",
        title: "Installing Lamps & Lights ",
        discount: "87",
        // id: 1, // Add 'id' if you include it in the class
      ),
      ElectronicsService(
        image: "electronics_service_2nd.jpg",
        price: "10 - 150",
        rating: "4.5",
        title: "Changing electric outlet (plug)",
        discount: "87",
        // id: 2,
      ),
      ElectronicsService(
        image: "electronics_service_4th.jpeg",
        price: "10 - 150",
        rating: "4.5",
        title: "Cable test termination",
        discount: "87",
        // id: 3,
      ),
      ElectronicsService(
        image: "electronics_service_3rd.jpg",
        price: "10 - 150",
        rating: "4.5",
        title: "Laying cables",
        discount: "87",
        // id: 4,
      ),
    ];
  }
  static List<PlumbingService> getPlumbingService() {
    return [
      PlumbingService(
        image: "plumbing_service_1st.jpg",
        price: "10 - 150",
        rating: "4.8",
        title: "Sink Installation",
        discount: "87",
        // id: 1, // Add 'id' if you include it in the class
      ),
      PlumbingService(
        image: "plumbing_service_2nd.jpg",
        price: "10 - 150",
        rating: "4.5",
        title: "Bidet Repair",
        discount: "87",
        // id: 2,
      ),
      PlumbingService(
        image: "plumbing_service_3rd.jpeg",
        price: "10 - 150",
        rating: "4.5",
        title: "Shower Repair",
        discount: "87",
        // id: 3,
      ),
      PlumbingService(
        image: "plumbing_service_4th.jpg",
        price: "10 - 150",
        rating: "4.5",
        title: "Blocked Water Pipe Repair",
        discount: "87",
        // id: 4,
      ),
      PlumbingService(
        image: "plumbing_service_5th.jpg",
        price: "10 - 150",
        rating: "4.5",
        title: "Pipe Repair",
        discount: "87",
        // id: 4,
      ),
      PlumbingService(
        image: "plumbing_service_6th.jpg",
        price: "10 - 150",
        rating: "4.5",
        title: "Leaking Pipe Repair",
        discount: "87",
        // id: 4,
      ),
    ];
  }

  //unselectedicon,this.selectedicon,this.name,this.id
  static List<SideMenu> getSideMenuData() {
    return [
      SideMenu("unselected_calender_icon_lt.svg",
          "selected_calender_icon_lt.svg", "Calendar", 1),
      SideMenu("unselected_paymentmethod_icon_lt.svg",
          "selected_paymentmethod_icon_lt.svg", "Payments Methods", 2),
      SideMenu("unselected_address_icon_lt.svg", "selected_address_icon_lt.svg",
          "Address", 3),
      SideMenu("unselected_notification_icon.svg",
          "selected_notification_icon.svg", "Notification", 4),
      SideMenu("unselected_support_icon_lt.svg", "selected_support_icon_lt.svg",
          "Support", 7),
    ];
  }

  //this.icon,this.firstText,this.secondText,this.thirdText,this.time,this.bgColor
  static List<NotificationData> getNotificationData() {
    return [
      NotificationData(
          "ac_installation_icon.svg",
          "AC Installation (Both)",
          "service payment is successfully",
          "Paid.",
          "Just Now",
          Color(0XFFFFBC99)),
      NotificationData("booking_status.svg", "Booking Status",
          "has been changed", "3:00-4:00 PM", "2:00 PM", Color(0XFFCABDFF)),
      NotificationData("true_icon.svg", "Confirmed", "Your booking",
          "AC Installation", "10:30 AM", Color(0XFFB5EBCD)),
      NotificationData(
          "watch_icon.svg",
          "Hair Style",
          "Professoinal Coming today",
          "2:00-3:00 PM.",
          "Yesterday",
          Color(0XFFFFD88D)),
      NotificationData("true_icon.svg", "Complete", "your service",
          "Multi Mask Facial", "Fri at 3:40 PM", Color(0XFFB5EBCD)),
      NotificationData(
          "close_icon.svg",
          "Order Cancelled!",
          "Home Deep Cleaning",
          "Westinghouse.",
          "Thu at 10:20 AM",
          Color(0XFFFB9B9B)),
    ];
  }

  //this.icon,this.bgColor,this.title,this.paymentType,this.expiry
  static List<PaymentCard> getPaymentCardData() {
    return [
      PaymentCard("master_card_icon.svg", Color(0XFFFFD88D), "*********5321",
          "card", "04/2023", 1),
      PaymentCard("visa_card_icon.svg", Color(0XFFB1E5FC), "*********3426",
          "card", "04/2023", 2),
    ];
  }

  /*
   this.icon,
      this.iconBgColor,
      this.title,
      this.status,
      this.scheduleTime,
      this.scheduleDate,
      this.referenceCode,
      this.serviceOroviderIcon,
      this.serviceOroviderTitle,
      this.id);
   */
  static List<Booking> getBookingData() {
    return [
      Booking(
          "ac_repair_icon.png",
          acServiceColor,
          "AC Installation",
          'Confirmed',
          '8:00-9:00 AM',
          "09 Dec",
          "#D-571224",
          "westing_house_icon.svg",
          "Westinghouse",
          "1 Ton-1.5 Ton x2",
          "Mr Dan Atkinson",
          1),
      Booking(
          "beauty_icon.png",
          beautyServiceColor,
          "Multi Mask Facial",
          'Pending',
          '8:00-9:00 AM',
          "09 Dec",
          "#D-571224",
          "sindenayu_icon.svg",
          "Repairing Group",
          "Sindenayu",
          "Mr Dathan Carr",
          2),
      Booking(
          "cleaning_icon.png",
          cleaningServiceColor,
          "Multi Mask Facial",
          'Complete',
          '8:00-9:00 AM',
          "09 Dec",
          "#D-571224",
          "sindenayu_icon.svg",
          "The Brown Brush",
          "Sindenayu",
          "Mr Deacon Nicholso",
          3),
      Booking(
          "ac_repair_icon.png",
          acServiceColor,
          "AC Installation",
          'Complete',
          '8:00-9:00 AM',
          "09 Dec",
          "#D-571224",
          "sindenayu_icon.svg",
          "Sindenayu",
          "Home Cured Place",
          "Mr Duncan Glover",
          4),
      Booking(
          "beauty_icon.png",
          beautyServiceColor,
          "Multi Mask Facial",
          'Complete',
          '8:00-9:00 AM',
          "09 Dec",
          "#D-571224",
          "sindenayu_icon.svg",
          "Sindenayu",
          "The Glowing Nut",
          "Mr Daylan Cross",
          5),
      Booking(
          "ac_repair_icon.png",
          acServiceColor,
          "AC Installation",
          'Darft',
          '8:00-9:00 AM',
          "09 Dec",
          "#D-571224",
          "sindenayu_icon.svg",
          "Sindenayu",
          "The Glowing Nut",
          "Mr Dilan Mccarthy",
          6),
      Booking(
          "beauty_icon.png",
          beautyServiceColor,
          "Multi Mask Facial",
          'Darft',
          '8:00-9:00 AM',
          "09 Dec",
          "#D-571224",
          "sindenayu_icon.svg",
          "Sindenayu",
          "The Glowing Nut",
          "Mr Darion Coates",
          7),
    ];
  }

  static List<CancelReason> getReasonData() {
    return [
      CancelReason("Not happy with the punctuality", 1),
      CancelReason("Not getting the crew member I asked for", 2),
      CancelReason("Got a full time maid", 3),
      CancelReason("Leaviing the country", 4),
      CancelReason("Perfer to have one time bookings", 5),
      CancelReason("I am not available at that time anymore", 6),
      CancelReason("Not happy with the quality", 7),
    ];
  }

  static List<OfferData> getOfferData() {
    return [
      OfferData("appliance_service_1st.png", "128", "4.8", "AC Check-Up", "87",
          "10%", "30 Jun", false, 1),
      OfferData("appliance_service_2nd.png", "128", "4.5", "AC Regular Service",
          "87", "5%", "30 Jun", false, 2),
      OfferData("appliance_service_3rd.png", "170", "4.5", "AC Installation",
          "87", "20%", "30 Jun", false, 3),
      OfferData("appliance_service_4th.png", "170", "4.5", "AC Uninstallation",
          "87", "7%", "30 Jun", false, 4),
    ];
  }
}
