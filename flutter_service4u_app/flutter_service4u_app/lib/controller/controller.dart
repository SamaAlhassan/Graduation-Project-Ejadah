import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:service_hub_app/datafile/datafile.dart';
import 'package:service_hub_app/firestore_test_page.dart';
import 'package:service_hub_app/models/provider_details_model';
import 'package:service_hub_app/utils/constantWidget.dart';
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
import '../models/phone_number_data_model.dart';
import '../models/recommended_data_model.dart';
import '../models/service_offer_model.dart';
import '../models/side_menu_data_model.dart';
import '../utils/color_category.dart';
import '../view/provider_profile_tab/new_orders_screen.dart';

class SplashScreenController extends GetxController {}

class OnBoardingScreenController extends GetxController {
  int currentPage = 0;

  onPageChange(int initialPage) {
    currentPage = initialPage;
    update();
  }
}

class SignInEmptyStateController extends GetxController {
  bool passVisibility = false;

  void setPasswordVisibility() {
    passVisibility = !passVisibility;
    update();
  }
}

class ResetPasswordScreenController extends GetxController {
  bool oldpassVisibility = false;
  bool newpassVisibility = false;
  bool confirmpassVisibility = false;

  void setOldPasswordVisibility() {
    oldpassVisibility = !oldpassVisibility;
    update();
  }

  void setNewPasswordVisibility() {
    newpassVisibility = !newpassVisibility;
    update();
  }

  void setConfirmPasswordVisibility() {
    confirmpassVisibility = !confirmpassVisibility;
    update();
  }
}

class SinUpEmptyStateController extends GetxController {
  bool cheak = false;
  bool passVisibility = false;

  void setCheakPos() {
    cheak = !cheak;
    update();
  }

  void setPasswordVisibility() {
    passVisibility = !passVisibility;
    update();
  }
}

class SignUpProviderEmptyStateController extends GetxController {
  bool cheak = false;
  bool passVisibility = false;

  void setCheakPos() {
    cheak = !cheak;
    update();
  }

  void setPasswordVisibility() {
    passVisibility = !passVisibility;
    update();
  }
}

void setPasswordVisibility() {}

class VerificationScreenController extends GetxController {}

class VerificationProviderScreenController extends GetxController {}

class HomeMainScreenController extends GetxController {
  // static GlobalKey<ScaffoldState> drawerKeyHome = GlobalKey(debugLabel: "homeMainScreenDrawerKey");

  // static final GlobalKey<FormState> drawerKey = GlobalKey<FormState>();
  // GlobalKey<FormState> drawerKey = GlobalKey<FormState>();
  RxInt position = 0.obs;

  onChange(int value) {
    position.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}

class ProviderServiceScreenController extends GetxController {
  static GlobalKey<ScaffoldState> drawerKey = GlobalKey(debugLabel: "providerServiceScreenDrawerKey");

  var providerId = ''.obs; // Observable to store the provider ID
  RxInt position = 0.obs; // Tracks the active navigation tab
  RxBool hasNewNotifications = false.obs; // Tracks if there are new notifications

  onChange(int value) {
    position.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _listenForNotifications();
  }

  // Listen for new notifications or updates in the Firestore collection
  void _listenForNotifications() {
    FirebaseFirestore.instance
        .collection('new_orders')
        .where('provider_id', isEqualTo: providerId.value) // Filter by provider
        .snapshots()
        .listen((snapshot) {
      // Update hasNewNotifications based on the Firestore data
      hasNewNotifications.value = snapshot.docs.any((doc) => doc['status'] == 'new');
    });
  }
}


class HomeScreenController extends GetxController {
  List<CleaningServiceOffer> cleaningOffer = DataFile.getCleaningOfferData();
  List<RecommendedData> recommendedData = DataFile.getRecommendedData();
  List<Offer> offer = DataFile.getofferData();
  List<CleaningService> cleaningService = DataFile.getCleaningService();
  List<Categories> categories = DataFile.getCategories();
}

class CleaningServiceScreenController extends GetxController {
  // List<CleaningService> claningData = DataFile.getCleaningService();
  List<CleaningServiceOffer> claningData = DataFile.getCleaningOfferData();
  bool grid = true;
  bool list = false;

  void setGrid() {
    grid = true;
    list = false;
    update();
  }

  void setList() {
    list = true;
    grid = false;
    update();
  }
}

class BeautyScreenController extends GetxController {
  List<BeautyData> beautyData = DataFile.getBeautyData();
  bool grid = true;
  bool list = false;

  void setGrid() {
    grid = true;
    list = false;
    update();
  }

  void setList() {
    list = true;
    grid = false;
    update();
  }
}

class CategoriesScreenController extends GetxController {}

class ACRepairScreenController extends GetxController {
  List<AllacService> allacservice = DataFile.getAllacService();
  bool grid = true;
  bool list = false;

  void setGrid() {
    grid = true;
    list = false;
    update();
  }

  void setList() {
    list = true;
    grid = false;
    update();
  }
}

class ApplianceRepairScreenController extends GetxController {
  // List of appliance repair services
  List<ApplianceService> allApplianceService = DataFile.getApplianceService();

  // Toggle for grid or list view
  bool grid = true;
  bool list = false;

  // Switch to grid view
  void setGrid() {
    grid = true;
    list = false;
    update(); // Notifies the UI to update
  }

  // Switch to list view
  void setList() {
    list = true;
    grid = false;
    update(); // Notifies the UI to update
  }
}

class ElectronicsRepairScreenController extends GetxController {
  // List of appliance repair services
  List<ElectronicsService> allElectronicsService =
      DataFile.getElectronicsService();

  // Toggle for grid or list view
  bool grid = true;
  bool list = false;

  // Switch to grid view
  void setGrid() {
    grid = true;
    list = false;
    update(); // Notifies the UI to update
  }

  // Switch to list view
  void setList() {
    list = true;
    grid = false;
    update(); // Notifies the UI to update
  }
}

class PlumbingRepairScreenController extends GetxController {
  // List of appliance repair services
  List<PlumbingService> allPlumbingService = DataFile.getPlumbingService();

  // Toggle for grid or list view
  bool grid = true;
  bool list = false;

  // Switch to grid view
  void setGrid() {
    grid = true;
    list = false;
    update(); // Notifies the UI to update
  }

  // Switch to list view
  void setList() {
    list = true;
    grid = false;
    update(); // Notifies the UI to update
  }
}

// class ApplianceCategoriesScreenController extends GetxController{
//   List<AllianceData> allianceData = DataFile.getAllianceData();
//   bool grid = false;
//   void setGrid(bool val) {
//     grid = val;
//     update();
//   }
// }
class BookingScreenController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  late PageController pController;

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 2, vsync: this);
    pController = PageController();
    super.onInit();
  }
}

class SideMenuScreenController extends GetxController {
  List<SideMenu> sidemenu = DataFile.getSideMenuData();
  bool currentTheme = false;
  bool notification = true;
  int themeId = 1;
  int selectedID = 1;

  void onSetTheme() {
    currentTheme = !currentTheme;
    update();
    if (themeId == 1) {
      Get.changeThemeMode(ThemeMode.light);
      update();
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      update();
    }
  }

  void setThemeId(int id) {
    themeId = id;
    update();
  }

  void setSelectedId(id) {
    selectedID = id;
    update();
  }
}

class AcRepairServiceDetailScreenController extends GetxController {
  List<ApplianceService> allianceData = DataFile.getApplianceService();
  int selectedPropertyID = 2;
  int units = 0;
  int bedRoom = 0;

  void setSelectProperty(id) {
    selectedPropertyID = id;
    update();
  }

  void addUnits() {
    units++;
    update();
  }

  void removeUnit() {
    if (units > 0) {
      units--;
      update();
    }
  }

  void addBedroom() {
    bedRoom++;
    update();
  }

  void removeBedroom() {
    if (bedRoom > 0) {
      bedRoom--;
      update();
    }
  }
}

class ApplianceServiceDetailScreenController extends GetxController {
  List<ApplianceService> allianceData = DataFile.getApplianceService();
  int selectedPropertyID = 2;
  int units = 0;
  int bedRoom = 0;

  void setSelectProperty(id) {
    selectedPropertyID = id;
    update();
  }

  void addUnits() {
    units++;
    update();
  }

  void removeUnit() {
    if (units > 0) {
      units--;
      update();
    }
  }

  void addBedroom() {
    bedRoom++;
    update();
  }

  void removeBedroom() {
    if (bedRoom > 0) {
      bedRoom--;
      update();
    }
  }
}

class CleaningServiceDetailScreenController extends GetxController {
  int units = 0;
  int bedRoom = 0;

  void addUnits() {
    units++;
    update();
  }

  void removeUnit() {
    if (units > 0) {
      units--;
      update();
    }
  }

  void addBedroom() {
    bedRoom++;
    update();
  }

  void removeBedroom() {
    if (bedRoom > 0) {
      bedRoom--;
      update();
    }
  }
}

class BeautyServiceDetailScreenController extends GetxController {
  int units = 0;
  int bedRoom = 0;

  void addUnits() {
    units++;
    update();
  }

  void removeUnit() {
    if (units > 0) {
      units--;
      update();
    }
  }

  void addBedroom() {
    bedRoom++;
    update();
  }

  void removeBedroom() {
    if (bedRoom > 0) {
      bedRoom--;
      update();
    }
  }
}

class SideMenuProfifileScreenController extends GetxController {
  static void addAddessScreen(bool bool) {}
}

class CalendarScreenController extends GetxController {}

class SideDrawerController extends GetxController {
  List<SideMenu> sidemenu = DataFile.getSideMenuData();
  List<Address> addressData = DataFile.getAddressData();
  bool addAddress = false;
  bool paymentScreen = false;
  int? addressID;

  int? addressIndex = 0;
  int? selectAddressIndex;
  Color? ordericonBg;
  String? addressIcon;
  String? title;
  String? address;
  int? id;

  int? selectedID;

  void addAddessScreen(bool val) {
    addAddress = val;
    update();
  }

  void setAddress(id) {
    addressID = id;
    update();
  }

  void setOrderaddress(color, icon, addresstitle, orderaddress, addid) {
    ordericonBg = color;
    addressIcon = icon;
    title = addresstitle;
    address = orderaddress;
    id = addid;
    update();
  }

  void setAddressIndex(int index) {
    addressIndex = index;
    update();
  }

  void setFinalAddressIndex(int? index) {
    selectAddressIndex = index;
    update();
  }

  void setSelectedId(int? id) {
    selectedID = id;
    update();
  }
}

class SideMenuPaymentMenuScreenController extends GetxController {
  bool showPaymentMethod = false;

  void setPaymentScreen(bool val) {
    showPaymentMethod = val;
    update();
  }
}

class SideMenuNotificationScreenController extends GetxController {
  List<NotificationData> notification = DataFile.getNotificationData();
}

class SideMenuSupportScreenController extends GetxController {}

class BookNowBottomSheetController extends GetxController {
  List time = [
    "12:00  PM",
    "12:30  PM",
    "1:00  PM",
    "1:30  PM",
    "2:00  PM",
    "2:30  PM",
    "3:00  PM",
    "3:30  PM",
    "4:00  PM",
    "4:30  PM"
  ];
  String? selectedtime = '';
  int timeIndex = 0;
  String? currentTime;
  bool calender = false;
  bool timeSelecter = false;

  void setCalenderPosition() {
    calender = !calender;
    timeSelecter = false;
    update();
  }

  void setTimeSelectionPosition() {
    calender = false;
    timeSelecter = !timeSelecter;
    update();
  }

  void setTime(int index) {
    currentTime = time[index];
    timeIndex = index;
    update();
  }
}

class CheakOutScreenController extends GetxController {
  final AuthController authController =
      Get.find<AuthController>(); // Get the AuthController instance
  bool cheakOut = false;
  String? userAddress;
  double? latitude;
  double? longitude;

  void setChkoutScreenPosition(bool val) {
    cheakOut = val;
    update();
  }

  // Function to load the user's address from Firestore
  Future<void> loadUserAddress(String uid) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('users_info');

    try {
      // Fetch the user document by uid
      DocumentSnapshot userDoc = await users.doc(uid).get();

      // Check if the document exists and retrieve the location field
      if (userDoc.exists && userDoc.data() != null) {
        userAddress =
            userDoc.get('location'); // Use a default if location is null
      } else {
        print("User document not found or data is null.");
        userAddress = "No address available";
      }
    } catch (e) {
      print("Error loading user address: $e");
      userAddress = "Error loading address";
    } finally {
      update(); // Update the UI state if needed after loading the address
    }
  }

// In your CheakOutScreenController
  Future<void> addOrder({
    required String userName, // Match the function call
    required String serviceName,
    required String date,
    required String time,
    required String location,
    required String phoneNumber,
    required String providerId,
    required String providerName,
  }) async {
    CollectionReference orders =
        FirebaseFirestore.instance.collection('new_orders');
    String orderNumber = 'D-${DateTime.now().millisecondsSinceEpoch}';


    try {
      await orders.add({
        'order_number': orderNumber,
        'user_name': userName, // Use correct parameter name
        'service_name': serviceName,
        'date': date,
        'time': time,
        'location': location,
        'phone_number': phoneNumber,
        'provider_id': providerId,
        'provider_name': providerName,
        'status': 'new',
      });
      Get.snackbar('Order Success', 'New order added successfully');
      print("Order added successfully for: $userName");
    } catch (e) {
      print("Error adding order: $e");
      Get.snackbar('Error', 'Failed to add the order');
    }
  }

void navigateToNewOrdersScreen(String providerId) {
  Get.to(() => NewOrdersScreen(providerId: providerId));
}
}


class PhoneNumberScreenController extends GetxController {
  List<PhoneNumbers> phone =
      DataFile.getPhoneNumberData(); // Keep this if you need default data
  String?
      defaultPhoneNumber; // To store the default phone number fetched from Firebase
  int? id;
  int? selectNumberIndex;

  // Constructor
  PhoneNumberScreenController() : super(); // Call to super in the constructor

  @override
  void onInit() {
    super.onInit();
    fetchDefaultPhoneNumber(); // Fetch the default phone number on initialization
  }

  Future<void> fetchDefaultPhoneNumber() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String uid = currentUser!.uid;
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users_info')
        .doc(uid)
        .get();

    if (userDoc.exists) {
      // Cast userDoc.data() to Map<String, dynamic> before accessing fields
      final data = userDoc.data() as Map<String, dynamic>?;
      // Use the null-aware operator to safely access the 'mobile' field
      defaultPhoneNumber = data?['mobile'] ?? "No Phone Number";
      update(); // Update UI after fetching the phone number
    } else {
      defaultPhoneNumber =
          "No Phone Number"; // Handle case where document does not exist
      update();
    }
  }

  void updatePhoneNumber(String newPhoneNumber) {
    defaultPhoneNumber = newPhoneNumber;
    update(); // Update UI after changing the phone number
  }

  void setNumber(numberid) {
    id = numberid;
    update();
  }

  void setNumberIndex(int index) {
    selectNumberIndex = index;
    update();
  }
}


class PayMentScreenController extends GetxController {
  List<PaymentCard> card = DataFile.getPaymentCardData();

  int? paymentId;
  int? selectPaymentIndex;

  void setID(int? id) {
    paymentId = id;
    update();
  }

  void setPaymentIndex(int index) {
    selectPaymentIndex = index;
    update();
  }
}

class PlaceOrderScreenController extends GetxController {}

class HistryDetailScreenController extends GetxController {}

class UpcomingPageController extends GetxController {
  List<Booking> bookingData = DataFile.getBookingData();
}

class HistryPageController extends GetxController {
  List<Booking> histryData = DataFile.getBookingData();
}

class DraftPageController extends GetxController {
  List<Booking> draftData = DataFile.getBookingData();
}

class CalcelBookingScreenController extends GetxController {
  List<CancelReason> reason = DataFile.getReasonData();
}

class RewardsPointScreenController extends GetxController {}

class AddCardBottomSheetController extends GetxController {
  bool cheak = false;

  void setCheakButtonPosition() {
    cheak = !cheak;
    update();
  }
}

class ServiceBookBottomSheetController extends GetxController {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  String? provider;
  List<Provider> providers = [];
  String? serviceName;
  String? selectedCategory;
  String? selectedService; // For specific service name
   String? selectedProviderUid;


  // Declare the scroll controller
  ScrollController _scrollController = ScrollController();

  // Define a mapping between categories and their respective services
  Map<String, List<String>> categoryToServices = {
    'AC Repair': [
      'AC Repair Service',
      'AC Installation',
      'AC leak detection',
      'AC cleaning',
      'AC compressor repairing'
    ],
    'Plumbing': [
      'Bidet Repair',
      'Shower Repair',
      'Blocked Water Pipe Repair',
      'Pipe Repair',
      'Leaking Pipe Repair',
      'Sink Installation'
    ],
    'Electronics': [
      'Installing Lamps & Lights ',
      'Changing electric outlet (plug)',
      'Cable test termination',
      'Laying cables'
    ],
    'Appliance': [
      'Refrigerator Repair',
      'Dishwasher Repair',
      'Washing Machine Repair',
      'TV Repair',
      'Oven Repair'
    ],
  };

  Future<void> selectService(String serviceName, BuildContext context) async {
    selectedService = serviceName; // Set the specific service name

    // Loop through the category-to-services map to find the matching category
    categoryToServices.forEach((category, services) {
      if (services
          .map((s) => s.toLowerCase())
          .contains(serviceName.toLowerCase())) {
        selectedCategory =
            category; // Assign the category if the service matches
      }
    });

    // Check if a valid category was found
    if (selectedCategory != null) {
      print('Selected Category: $selectedCategory');
      print('Selected Service: $selectedService');

      // Call fetchProviders with the selected category
      await fetchProviders(context);
    } else {
      // If no matching category was found
      print('Invalid service selected: $serviceName');
      return;
    }
  }

  // Method to set the service name
  void setServiceName(String name) {
    serviceName = name;
    update(); // Notify listeners of the change
  }

  Future<void> fetchProviders(BuildContext context) async {
    try {
      selectService(serviceName!, context);
      // Clear the current list of providers before fetching new ones
      providers.clear();
      update(); // Notify listeners to update the UI

      String major;
      String preferredWorkingHours;


      // Determine the major based on the selected service
      if (selectedCategory == 'AC Repair') {
        major = 'HVAC Technician';
      } else if (selectedCategory == 'Plumbing') {
        major = 'Plumber';
      } else if (selectedCategory == 'Electronics' ||
          selectedCategory == 'Appliance') {
        major = 'Electrician';
      } else {
        print('Invalid service selected');
        return;
      }
      // Determine working hours based on selected time
      if (getTimePeriod(selectedTime!.format(context)) == 'Morning') {
        preferredWorkingHours = 'From 8 AM until 12 PM';
      } else {
        preferredWorkingHours = 'From 4 PM until 9 PM';
      }

      // Firestore query to filter providers by major and working hours
      final snapshot = await FirebaseFirestore.instance
          .collection('providers_info')
          .where('major', isEqualTo: major)
          .where('preferred working hours', isEqualTo: preferredWorkingHours)
          .get();

      if (snapshot.docs.isNotEmpty) {
        providers = snapshot.docs.map((doc) {

  // Extract the UID from the document ID
        String uid = doc.id;

        // Set the selectedProviderUid to the first provider's UID (or based on some logic)
        if (selectedProviderUid == null) {
          selectedProviderUid = uid;
        }

          // Check if latitude and longitude fields exist, otherwise use default values
          double latitude = doc.data().containsKey('latitude')
              ? doc['latitude'] as double
              : 0.0;
          double longitude = doc.data().containsKey('longitude')
              ? doc['longitude'] as double
              : 0.0;

          return Provider(
            name: doc['name'] as String,
            email: doc['email'] as String,
            mobile: doc['mobile'] as String,
            nationality: doc['nationality'] as String,
            major: doc['major'] as String,
            location: doc['location'] as String,
            hasCar: (doc['have a car?'] == 'Yes'),
            workingHours: doc['preferred working hours'] as String,
            latitude: doc['latitude'],
            longitude: doc['longitude'],

          );
        }).toList();
      } else {
        print("No providers found.");
      }
      update();
    } catch (e) {
      print('Error fetching providers: $e');
    }
    update();
  }

  // Function to calculate distance in kilometers
  double calculateDistance(double startLatitude, double startLongitude,
      double endLatitude, double endLongitude) {
    return Geolocator.distanceBetween(
            startLatitude, startLongitude, endLatitude, endLongitude) /
        1000; // in km
  }

  String getTimePeriod(String formattedTime) {
    // Parse the time string to DateTime object
    final DateFormat format = DateFormat.jm(); // Format like '11:30 AM'
    final DateTime parsedTime = format.parse(formattedTime);
    final TimeOfDay selectedTime = TimeOfDay.fromDateTime(parsedTime);

    // Define morning and evening time ranges
    final TimeOfDay morningStart = TimeOfDay(hour: 8, minute: 0);
    final TimeOfDay morningEnd = TimeOfDay(hour: 12, minute: 0);
    final TimeOfDay eveningStart = TimeOfDay(hour: 16, minute: 0);
    final TimeOfDay eveningEnd = TimeOfDay(hour: 21, minute: 0);

    // Check if the selected time is in the morning range
    if (_isTimeInRange(selectedTime, morningStart, morningEnd)) {
      return 'Morning';
    }
    // Check if the selected time is in the evening range
    else if (_isTimeInRange(selectedTime, eveningStart, eveningEnd)) {
      return 'Evening';
    } else {
      return 'Invalid';
    }
  }

// Helper function to compare time ranges
  bool _isTimeInRange(TimeOfDay time, TimeOfDay start, TimeOfDay end) {
    final int timeInMinutes = time.hour * 60 + time.minute;
    final int startInMinutes = start.hour * 60 + start.minute;
    final int endInMinutes = end.hour * 60 + end.minute;

    return timeInMinutes >= startInMinutes && timeInMinutes <= endInMinutes;
  }

  Future<void> selectProvider(BuildContext context) async {
    // Print debug information
    print("Selected Date: $selectedDate");
    print("Selected Time: $selectedTime");
    print("Service Name: $serviceName");
    print("Category: $selectedCategory");

    // Ensure date and time are selected
    if (selectedDate == null ||
        selectedTime == null ||
        (serviceName?.isEmpty ?? true)) {
      Fluttertoast.showToast(
        msg: "Please select a Date, and Time before selecting a Provider.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: buttonColor,
        textColor: regularBlack,
        fontSize: 16.0,
      );
      return; // Exit early if conditions are not met
    }

    // Show loading indicator while fetching providers
    Fluttertoast.showToast(
      msg: "Fetching providers...",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: buttonColor,
      textColor: regularBlack,
      fontSize: 16.0,
    );

    // Fetch providers based on selected date, time, and service
    await fetchProviders(context);

    // Check if providers are fetched successfully
    print(
        "Providers: ${providers.length}"); // This should print the number of providers fetched

    // Variable to hold the selected provider
    Provider? selectedProvider;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double userLatitude = position.latitude;
    double userLongitude = position.longitude;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        final ACRepairScreenController controller =
            Get.find<ACRepairScreenController>();
        List<Provider> filteredProviders = List.from(providers)
          ..sort((a, b) {
            final distanceA = calculateDistance(
                userLatitude, userLongitude, a.latitude, a.longitude);
            final distanceB = calculateDistance(
                userLatitude, userLongitude, b.latitude, b.longitude);
            return distanceA.compareTo(distanceB); // Sort by distance ascending
          });
        bool showOnlyWithCar = false; // Filter toggle

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // To make the dialog box fit the content
                  children: <Widget>[
                    Text(
                      'Select Provider',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    // Filter Button
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showOnlyWithCar = !showOnlyWithCar; // Toggle filter
                          // Update filtered providers based on the condition
                          if (showOnlyWithCar) {
                            filteredProviders = providers
                                .where((provider) =>
                                    provider.hasCar) // filter providers
                                .toList();
                          } else {
                            filteredProviders =
                                providers; // Reset to all providers
                          }
                          // Sort filteredProviders based on distance to the user
                          filteredProviders.sort((a, b) {
                            final distanceA = calculateDistance(
                              userLatitude,
                              userLongitude,
                              a.latitude,
                              a.longitude,
                            );
                            final distanceB = calculateDistance(
                              userLatitude,
                              userLongitude,
                              b.latitude,
                              b.longitude,
                            );
                            return distanceA.compareTo(
                                distanceB); // Sort by distance ascending
                          });
                        });
                      },
                      child: Text(
                        showOnlyWithCar
                            ? "Show All Providers"
                            : "Show Providers that have a Car",
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Provider List
                    filteredProviders.isNotEmpty
                        ? SizedBox(
                            height: 400, // Max height for the list
                            child: Scrollbar(
                              thumbVisibility:
                                  true, // Show scroll bar when scrolling
                              thickness:
                                  4.0, // Reduced thickness for a slimmer scrollbar
                              radius: const Radius.circular(8),
                              controller: _scrollController,
                              child: ListView.builder(
                                controller: _scrollController,
                                shrinkWrap: true,
                                itemCount: filteredProviders
                                    .length, // Use filteredProviders length
                                itemBuilder: (context, index) {
                                  final provider = filteredProviders[index];
                                  final service =
                                      controller.allacservice[index];
                                  // Calculate distance between user and provider
                                  final distance = calculateDistance(
                                    userLatitude,
                                    userLongitude,
                                    provider.latitude,
                                    provider.longitude,
                                  );

                                  return Card(
                                    margin: const EdgeInsets.all(10),
                                    child: RadioListTile<Provider>(
                                      value: provider,
                                      groupValue: selectedProvider,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedProvider =
                                              value; // Update the selected provider
                                        });
                                      },
                                      title: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Provider Icon
                                          getSvgImage(
                                            "person-img.svg",
                                            width: 43,
                                            height: 43,
                                          ),
                                          const SizedBox(
                                              width:
                                                  13), // Spacing between icon and name
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Provider Name and Star Icon in the Same Row
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        provider.name,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 11),
                                                    getSvgImage(
                                                      "star_icon.svg", // Star icon
                                                      width: 13,
                                                      height: 13,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      "${service.rating}",
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.grey[550],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 7),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "It's ${distance.toStringAsFixed(2)} km away.",
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[550],
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5.6),
                                                Text(
                                                  "Nationality: ${provider.nationality}",
                                                  style: TextStyle(
                                                    color: Colors.grey[550],
                                                    fontSize: 13,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      subtitle: TextButton(
                                        onPressed: () {
                                          _showProviderDetails(
                                              context, provider);
                                        },
                                        child: const Text('more details'),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Text(
                            'No providers available yet.',
                            style: TextStyle(fontSize: 16),
                          ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          if (selectedProvider != null) {
                            setProvider(
                                selectedProvider!); // Set the selected provider
                          }
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('CLOSE'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showProviderDetails(BuildContext context, Provider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Provider Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              getVerSpace(30.h),
              getMyprofileDetailFormate(
                  "profile_icon.svg", "Name", provider.name),
              getVerSpace(20.h),
              getMyprofileDetailFormate(
                  "email_icon.svg", "Email", provider.email),
              getVerSpace(20.h),
              getMyprofileDetailFormate(
                  "call_icon.svg", "Phone Number", provider.mobile),
              getVerSpace(20.h),
              getMyprofileDetailFormate(
                  "nationality_icon.svg", "Nationality", provider.nationality),
              getVerSpace(20.h),
              getMyprofileDetailFormate(
                  "major_icon.svg", "Major", provider.major),
              getVerSpace(20.h),
              getMyprofileDetailFormate(
                  "location_icon.svg", "Location", provider.location),
              getVerSpace(20.h),
              getMyprofileDetailFormate("haveCar_icon.svg", "Has a Car",
                  provider.hasCar ? 'Yes' : 'No'),
              getVerSpace(20.h),
              getMyprofileDetailFormate("workingHour_icon.svg",
                  "Preferred Working Hours", provider.workingHours),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  void setProvider(Provider selectedProvider) {
    provider = selectedProvider
        .name; // Assuming you're only storing the provider's name
    update();
  }

  // DateTime _dateTime = DateTime.now();

 Future<void> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: date,
    firstDate: DateTime.now(), // Prevent selecting dates in the past
    lastDate: DateTime(2101),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: darkYellow,
            onPrimary: regularBlack,
            onSurface: regularBlack,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red, // Button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (picked != null) {
    date = picked; // Temporarily set the date; time validation will happen in `selectTime`
    setDate(picked);
    update();
  }
}
Future<void> selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: time,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: darkYellow,
            onPrimary: regularBlack,
            onSurface: regularBlack,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red, // Button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (picked != null) {
    final DateTime selectedDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      picked.hour,
      picked.minute,
    );

    // Get the current date and time
    final DateTime now = DateTime.now();

    // Ensure the selected time is at least 15 minutes in the future
    if (selectedDateTime.isBefore(now.add(const Duration(minutes: 15)))) {
      Fluttertoast.showToast(
        msg: "Please select a time at least 15 minutes from now.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return; // Exit if the selected time is invalid
    }

    // Set the selected time if valid
    time = picked;
    setTime(picked);
    update();
  }
}


  void setDate(DateTime date) {
    selectedDate = date;
    update();
  }

  void setTime(TimeOfDay time) {
    selectedTime = time;
    update();
  }
}

class AddNewCardScreenController extends GetxController {
  bool cardsave = false;

  void setCardSaveCheakButton() {
    cardsave = !cardsave;
    update();
  }
}

class RecommendedServiceScreenController extends GetxController {
  List<RecommendedData> recommnded = DataFile.getRecommendedData();
  bool grid = true;
  bool list = false;

  void setGrid() {
    grid = true;
    list = false;
    update();
  }

  void setList() {
    list = true;
    grid = false;
    update();
  }
}

class AuthController extends GetxController {
// Fetch the current user's email
  String? getCurrentUserEmail() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return currentUser?.email;
  }
  // Sign-in function using Firebase Authentication
  Future<int> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user!.uid;

      // Check if user exists in the 'providers_info' collection
      DocumentSnapshot providerDoc = await FirebaseFirestore.instance
          .collection('providers_info')
          .doc(uid)
          .get();

      if (providerDoc.exists) {
        return 1; // User is a provider
      }

      // If not a provider, check the 'users_info' collection
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users_info')
          .doc(uid)
          .get();

      if (userDoc.exists) {
        return 2; // User is a regular user
      }

      // If neither collection contains the user, show an error
      Get.snackbar('Error', 'User data not found');
      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided.');
      } else {
        Get.snackbar('Error', e.message ?? 'An unknown error occurred.');
      }
      return -1; // Return false on any error
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      return -1; // Return false on any exception
    }
  }

  // Fetch user data
  Future<Map<String, dynamic>?> getUserData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String uid = currentUser.uid;
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users_info')
            .doc(uid)
            .get();

        if (userDoc.exists) {
          return userDoc.data() as Map<String, dynamic>?;
        } else {
          Get.snackbar('Error', 'No user data found for UID: $uid');
          return null;
        }
      } else {
        Get.snackbar('Error', 'No user is currently logged in.');
        return null;
      }
    } catch (e) {
      Get.snackbar('Error', 'Error retrieving user data: $e');
      return null;
    }
  }

  // Fetch provider data
  Future<Map<String, dynamic>?> getProviderData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String uid = currentUser.uid;
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('providers_info')
            .doc(uid)
            .get();

        if (userDoc.exists) {
          return userDoc.data() as Map<String, dynamic>?;
        } else {
          Get.snackbar('Error', 'No provider data found for UID: $uid');
          return null;
        }
      } else {
        Get.snackbar('Error', 'No provider is currently logged in.');
        return null;
      }
    } catch (e) {
      Get.snackbar('Error', 'Error retrieving provider data: $e');
      return null;
    }
  }

  // Update user data (mobile, location) when updated in check_out screen.
  Future<void> updateUserData({String? phoneNumber, String? address}) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      try {
        await FirebaseFirestore.instance
            .collection('users_info')
            .doc(userId)
            .update({
          if (phoneNumber != null) 'mobile': phoneNumber,
          if (address != null) 'location': address,
        });
        print("Firestore update successful: $address");
      } catch (e) {
        print("Error updating Firestore: $e");
      }
    }
  }
}

class ProviderBookingController extends GetxController {
  // Your existing logic here
}

class HistoryPageController extends GetxController {
  // Add any necessary properties or methods for the controller here
}

class MyProfileScreenController extends GetxController {}

class ProviderMyProfileScreenController extends GetxController {}

class EditProfileSCreenController extends GetxController {}

class EditProfileProSCreenController extends GetxController {}

class SettingScreensController extends GetxController {}
class NewOrdersScreenController extends GetxController{}