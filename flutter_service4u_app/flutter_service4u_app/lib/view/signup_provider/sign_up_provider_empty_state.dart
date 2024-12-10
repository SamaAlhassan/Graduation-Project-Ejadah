import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/current_location_screen.dart';
import 'package:service_hub_app/firestore_test_page.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import 'package:service_hub_app/utils/pref_data.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';

class SignUpProviderEmptyState extends StatefulWidget {
  @override
  State<SignUpProviderEmptyState> createState() =>
      _SignUpProviderEmptyStateState();
}

class _SignUpProviderEmptyStateState extends State<SignUpProviderEmptyState> {
  final SignUpProviderEmptyStateController signUpProviderEmptyStateController =
      Get.put(SignUpProviderEmptyStateController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController haveCarController = TextEditingController();
  TextEditingController workingHourController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final AuthController authControllerSignUp = Get.put(AuthController());

  double? latitude;
  double? longitude;

  // List of specializations
  final List<String> specializations = [
    'Plumber',
    'HVAC Technician',
    'Electrician',
  ];

  // List of working hours
  final List<String> workingHours = [
    'From 8 AM until 12 PM',
    'From 4 PM until 9 PM',
  ];

  String? selectedMajor; // To store the selected major
  String? selectedWorkingHour; // To store the selected working hour
  bool showMajorError = false; // Flag to show major error
  bool showWorkingHourError = false; // Flag to show working hour error
  bool showPasswordError = false; // Flag to show password error
  String location = 'Location';
  backClick() {
    Constant.backToFinish();
  }

  void _setLocation(String newLocation, double lat, double lon) {
    setState(() {
      location = newLocation; // Update the location name
      latitude = lat; // Store latitude
      longitude = lon; // Store longitude
    });
  }

  void showMajorSelection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: specializations.map((specialization) {
            return RadioListTile<String>(
              title: Text(specialization),
              value: specialization,
              groupValue: selectedMajor,
              onChanged: (String? value) {
                setState(() {
                  selectedMajor = value; // Update the selected major
                  showMajorError = false; // Hide error if major is selected
                });
                Navigator.pop(context); // Close the modal
              },
            );
          }).toList(),
        );
      },
    );
  }

  // Show working hours selection
  void showWorkingHoursSelection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: workingHours.map((hour) {
            return RadioListTile<String>(
              title: Text(hour),
              value: hour,
              groupValue: selectedWorkingHour,
              onChanged: (String? value) {
                setState(() {
                  selectedWorkingHour = value;
                  showWorkingHourError =
                      false; // Hide error if hour is selected
                });
                Navigator.pop(context); // Close the modal
              },
            );
          }).toList(),
        );
      },
    );
  }

  // Sign-up logic
  void signUp() async {
    // Reset the error flags at the start of signUp
    setState(() {
      showPasswordError = false; // Reset password error flag
    });

    // Check form validation and major selection
    if (formKey.currentState!.validate() &&
        selectedMajor != null &&
        selectedWorkingHour != null &&
        signUpProviderEmptyStateController.cheak == true) {
      // Proceed with Firebase sign-up and data saving
      final name = nameController.text;
      final email = emailController.text;
      final mobile = mobileNumberController.text;
      final nationality = nationalityController.text;
      final password = passwordController.text;
      final haveCar = haveCarController.text;
      final location = locationController.text;

      // Check if the password is empty
      if (password.isEmpty) {
        setState(() {
          showPasswordError = true; // Show password error
        });
        return; // Exit early if password is empty
      }
      // Ensure all required fields are filled
      if (latitude != null && longitude != null) {
        try {
          // Create user with Firebase Authentication
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          String uid = userCredential.user!.uid;

          // Save user data to Firestore
          await FirestoreTestPageState.addProviderData(
              uid,
              name,
              email,
              mobile,
              nationality,
              selectedMajor!,
              location,
              haveCar,
              selectedWorkingHour!,
              password,
              latitude!,
              longitude!);

          // Set user sign-in state and navigate
          PrefData.setIsSignIn(true);
          Constant.sendToNext(context, Routes.ProviderServiceScreenRoute);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
        } catch (e) {
          print('An error occurred: $e');
        }
      } else {
        // Show errors if major or working hour are not selected
        setState(() {
          if (selectedMajor == null) {
            showMajorError = true;
          }
          if (selectedWorkingHour == null) {
            showWorkingHourError = true;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SignUpProviderEmptyStateController>(
      init: SignUpProviderEmptyStateController(),
      builder: (signInEmptyStateController) => WillPopScope(
          onWillPop: () async {
            backClick();
            return false;
          },
          child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(30.h),
                  getCustomAppBar("Sign Up", () {
                    backClick();
                  }),
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          getVerSpace(30.h),
                          getTextField("Name", "profile_icon.svg",
                              controller: nameController, validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'Please enter Name';
                            }
                            return null;
                          }, decoration: InputDecoration(labelText: 'name')),
                          getVerSpace(28.h),
                          getTextField("Email Address", "email_icon.svg",
                              controller: emailController, validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please enter email address';
                            } else {
                              if (!RegExp(
                                      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(email)) {
                                return 'Please enter valid email address';
                              }
                            }
                            return null;
                          }, decoration: InputDecoration(labelText: 'email')),
                          getVerSpace(28.h),
                          phone_number_field(mobileNumberController),
                          getVerSpace(28.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 9.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: Colors.grey[100], // Background color
                              borderRadius: BorderRadius.circular(
                                  15.r), // Rounded corners
                            ),
                            child: Row(
                              children: [
                                getSvgImage('nationality_icon.svg',
                                        width: 24,
                                        height: 24,
                                        color: Colors.grey[900])
                                    .paddingOnly(right: 8.w),
                                Expanded(
                                  child: TextField(
                                    controller: nationalityController,
                                    decoration: InputDecoration(
                                      labelText: 'Nationality',
                                      border: InputBorder
                                          .none, // Remove default border
                                      isDense:
                                          true, // Make the field more compact
                                      contentPadding: EdgeInsets
                                          .zero, // Remove default content padding
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          getVerSpace(28.h),
                          // Major Selection Field
                          GestureDetector(
                            onTap: showMajorSelection, // Show selection on tap
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 12.w),
                              height:
                                  50.h, // Adjust height to match other fields
                              decoration: BoxDecoration(
                                color: Colors.grey[
                                    100], // Gray background to match other fields
                                borderRadius: BorderRadius.circular(15.r),
                                // Add red border when showMajorError is true
                                border: Border.all(
                                  color: showMajorError
                                      ? Colors.red[900]!
                                      : Colors.grey[
                                          100]!, // Dark red border if there's an error
                                  width: 1.0, // Border width
                                ),
                              ),
                              child: Row(
                                children: [
                                  // Major Icon
                                  getSvgImage('major_icon.svg',
                                          width: 26,
                                          height: 26,
                                          color: Colors.grey[900])
                                      .paddingOnly(right: 12.w),

                                  // Display Selected Major or Placeholder
                                  Expanded(
                                    child: Text(
                                      selectedMajor ??
                                          'Select Your Major', // Display selected major or placeholder
                                      style: TextStyle(
                                        color: selectedMajor == null
                                            ? Colors.grey[700]
                                            : Colors.black,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),

                                  // Dropdown Icon
                                  Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                ],
                              ),
                            ),
                          ),

                          // Show error if major is not selected
                          if (showMajorError)
                            Padding(
                              padding: EdgeInsets.only(top: 7.h, left: 15.w),
                              child: Text(
                                'Please select your major',
                                style: TextStyle(
                                    color: Colors.red[900], fontSize: 12.sp),
                              ),
                            ),
                          getVerSpace(28.h),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return CurrentLocationScreen(
                                    onLocationSelected: _setLocation,
                                  );
                                },
                              ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/location_icon.svg',
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    location, // Display selected location or default text
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: Constant.fontsFamily,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: grey40,
                              backgroundColor: Colors.grey[100],
                              minimumSize: Size(50, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.h),
                              ),
                            ),
                          ),
                          getVerSpace(28.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 9.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: Colors.grey[100], // Background color
                              borderRadius: BorderRadius.circular(
                                  15.r), // Rounded corners
                            ),
                            child: Row(
                              children: [
                                getSvgImage('haveCar_icon.svg',
                                        width: 24,
                                        height: 24,
                                        color: Colors.grey[900])
                                    .paddingOnly(right: 8.w),
                                Expanded(
                                  child: TextField(
                                    controller: haveCarController,
                                    decoration: InputDecoration(
                                      labelText: 'Have a Car?',
                                      border: InputBorder
                                          .none, // Remove default border
                                      isDense:
                                          true, // Make the field more compact
                                      contentPadding: EdgeInsets
                                          .zero, // Remove default content padding
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          getVerSpace(28.h),
                          // Preferred Working Hours Field with GestureDetector
                          GestureDetector(
                            onTap:
                                showWorkingHoursSelection, // Show radio list on tap
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 12.w),
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                  color: showWorkingHourError
                                      ? Colors.red[900]!
                                      : Colors.grey[100]!,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [
                                  getSvgImage('workingHour_icon.svg',
                                          width: 26,
                                          height: 26,
                                          color: Colors.grey[900])
                                      .paddingOnly(right: 12.w),
                                  Expanded(
                                    child: Text(
                                      selectedWorkingHour ??
                                          'Select Your Preferred Working Hours',
                                      style: TextStyle(
                                        color: selectedWorkingHour == null
                                            ? Colors.grey[700]
                                            : Colors.black,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                ],
                              ),
                            ),
                          ),
                          if (showWorkingHourError)
                            Padding(
                              padding: EdgeInsets.only(top: 7.h, left: 15.w),
                              child: Text(
                                'Please select your preferred working hours',
                                style: TextStyle(
                                    color: Colors.red[900], fontSize: 12.sp),
                              ),
                            ),
                          getVerSpace(28.h),
                          getTextField(
                            function: () {},
                            obsequrePermition:
                                signUpProviderEmptyStateController
                                    .passVisibility,
                            "Password",
                            "lock_icon.svg",
                            suffixiconpermition: true,
                            controller: passwordController,
                            widget: GestureDetector(
                                onTap: () {
                                  signUpProviderEmptyStateController
                                      .setPasswordVisibility();
                                },
                                child: getSvgImage(
                                        signUpProviderEmptyStateController
                                                .passVisibility
                                            ? "eye_icon.svg"
                                            : "selected_eye_icon.svg")
                                    .paddingOnly(
                                        top: 15.h, bottom: 17.h, right: 18.h)),
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                setState(() {
                                  showPasswordError = true;
                                });
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(labelText: 'password'),
                          ),
                          // Show error if password is not entered
                          if (showPasswordError)
                            Padding(
                              padding: EdgeInsets.only(top: 7.h, left: 15.w),
                              child: Text(
                                'Please enter a password',
                                style: TextStyle(
                                    color: Colors.red[900], fontSize: 12.sp),
                              ),
                            ),
                          SizedBox(height: 20),
                          getVerSpace(28.h),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  signUpProviderEmptyStateController
                                      .setCheakPos();
                                },
                                child: getSvgImage(
                                    signInEmptyStateController.cheak
                                        ? "select_cheak_button.svg"
                                        : "unselect_cheak_button.svg"),
                              ),
                              getHorSpace(10.h),
                              GestureDetector(
                                onTap: () {
                                  Constant.sendToNext(context,
                                      Routes.termsAndConditionScreenRoute);
                                },
                                child: getCustomFont(
                                    "I agree with Terms & Privacy",
                                    14.sp,
                                    grey40,
                                    1,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          getVerSpace(54.h),
                          getCustomButton("Sign Up", () async {
                            signUp();
                          }),
                          getVerSpace(50.h),
                          Center(
                              child: getCustomFont("Sign up with", 16.sp,
                                  context.theme.primaryColor, 1,
                                  fontWeight: FontWeight.w400)),
                          getVerSpace(20.h),
                          Row(
                            children: [
                              google_facebook_ios_button("google_logo.svg"),
                              getHorSpace(30.h),
                              google_facebook_ios_button("facebook_logo.svg"),
                              getHorSpace(30.h),
                              google_facebook_ios_button("apple_logo.svg")
                            ],
                          ).paddingSymmetric(horizontal: 85.46.h),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: getRichtext("You already have an account?", " Login",
                        function: () {
                      backClick();
                    },
                        firstTextwidth: FontWeight.w400,
                        firsttextSize: 14.sp,
                        secondTextwidth: FontWeight.w500,
                        secondtextSize: 16.sp,
                        firsttextcolor: context.theme.primaryColor,
                        secondtextcolor: context.theme.primaryColor),
                  ).paddingOnly(bottom: 30.h),
                ],
              ).paddingOnly(left: 20.h, right: 20.h),
            )),
          )),
    );
  }
}
