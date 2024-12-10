import 'package:flutter/material.dart';
import 'package:flutter_pytorch/flutter_pytorch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import 'package:service_hub_app/utils/drawe_data.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'detectionResult_Screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  TextEditingController serchController = TextEditingController();
  final HomeScreenController homeScreenController = Get.find<HomeScreenController>();
  final HomeMainScreenController homeMainScreenController = Get.find<HomeMainScreenController>();

  // Variables to hold user data
  String userLocation = "";

  // Fetch the auth controller
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    // Fetch and pre-fill user data
    loadUserData();
    loadModel();
  }

  ModelObjectDetection? objectModel;
  void loadModel() {
    FlutterPytorch.loadObjectDetectionModel(
            "assets/best.torchscript", 7, 640, 640,
            labelPath: "assets/labels.txt")
        .then((value) {
      objectModel = value;
      print('model loaded success ??????');
    }).catchError((error) {
      print('error????????? when loading model ${error}');
    });
  }

  // Function to load user data and pre-fill the form
  Future<void> loadUserData() async {
    Map<String, dynamic>? userData = await authController.getUserData();

    if (userData != null) {
      setState(() {
        // Pre-fill the fields with the user data
        userLocation = userData['location'] ?? '';
      });
    }
  }

  final ImagePicker _picker = ImagePicker(); // Initialize ImagePicker
  File? _image;

  // Function to open the camera and take a picture
  Future<void> _takePicture() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _image = File(photo.path); // Update state with the captured image
      });
      await startAnalyzing();
    }
  }

  // Function to pick an image from the gallery
  void _chooseFromGallery() async {
    final XFile? galleryImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (galleryImage != null) {
      setState(() {
        _image =
            File(galleryImage.path); // Update state with the selected image
      });
      await startAnalyzing();
    }
  }

  Future<void> startAnalyzing() async {
    if (_image != null) {
      objectModel
          ?.getImagePrediction(
        _image!.readAsBytesSync(),
        minimumScore: 0.2,
      )
          .then((results) {
        print('Starting analysis...');

        if (results.isNotEmpty) {
          // Find the result with the highest score
          var topResult = results
              .reduce((curr, next) => curr!.score > next!.score ? curr : next);

          if (topResult != null) {
            // Print only the top result's class name and score
            print(
                'Top result - class: ${topResult.className}, score: ${topResult.score}');

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ModelPage(_image, topResult.score,
                    topResult.className!.trim().toString()),
              ),
            );
          }
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  "No Results Found",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: Constant.fontsFamily,
                    color: regularBlack,
                  ),
                ),
                content: Text(
                  "No results were found. Please try a different image.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: Constant.fontsFamily,
                    color: regularBlack,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }).catchError((error) {
        print('Error when applying model: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<HomeMainScreenController>(
      init: HomeMainScreenController(),
      builder: (homeMainScreenController) => GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (homeScreenController) => Scaffold(
                key: drawerKey, // Use the unique key here
                drawer: Drawer(
                  child: DrawerData(),
                ),
                body: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.h),
                              bottomRight: Radius.circular(30.h)),
                        ),
                        child: Column(
                          children: [
                            getVerSpace(22.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      drawerKey.currentState!
                                          .openDrawer();
                                    },
                                    child: getSvgImage("drawer_icon.svg")),
                                Expanded(
                                  child: Center(
                                    // Center the column within the available space
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center, // Center content within the column
                                      children: [
                                        getSvgImage("location_icon.svg"),
                                        SizedBox(
                                            height: 5.h), // Space between the icon and text
                                        getCustomFont(userLocation, 14.sp,
                                            context.theme.primaryColor, 1,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                  ),
                                ),
                                //getSvgImage("unselected_notification_icon.svg",
                                //color: regularBlack),
                              ],
                            ),
                            getVerSpace(32.h),
                            getSearchField("Search...", function: () {}),
                            getVerSpace(53.h)
                          ],
                        ).paddingSymmetric(horizontal: 20.h, vertical: 20.h),
                      ),
                      Container(
                        height: 180.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                image: AssetImage(
                                  Constant.assetImagePath + "ai_image.jpg",
                                ),
                                fit: BoxFit.fill)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getVerSpace(20.h),
                            getCustomFont("Not sure what's wrong?", 18.sp,
                                regularWhite, 1,
                                fontWeight: FontWeight.w500),
                            getVerSpace(15.h),
                            getCustomFont("Let Ejadah AI figure it out!", 18.sp,
                                regularWhite, 1,
                                fontWeight: FontWeight.w700),
                            getVerSpace(12.h),
                            getCustomButton("Try it", () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 150,
                                    child: Column(
                                      children: [
                                        ListTile(
                                            // Option for taking a photo
                                            leading: Icon(Icons.camera_alt),
                                            title: Text('Take a photo'),
                                            onTap: () {
                                              Navigator.pop(context);
                                              _takePicture();
                                            }),
                                        ListTile(
                                            // Option for taking a photo
                                            leading: Icon(Icons.photo_library),
                                            title: Text('Choose from gallery'),
                                            onTap: () {
                                              Navigator.pop(context);
                                              _chooseFromGallery();
                                            }),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                                buttonheight: 34.h,
                                fontSize: 16.sp,
                                weight: FontWeight.w500,
                                buttonwidth: 100.h)
                          ],
                        ).paddingSymmetric(horizontal: 20.h, vertical: 21.h),
                      ).paddingOnly(top: 173.h, left: 20.h, right: 20.h),
                    ],
                  ),
                  Expanded(
                      child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomFont(
                                    "Select Service", 17.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w500),
                                // GestureDetector(
                                //   onTap: () {
                                //     // HomeMainScreenController.drawerKey.currentState!.isDrawerOpen?HomeMainScreenController.drawerKey.currentState!.closeDrawer():SizedBox();
                                //     Constant.sendToNext(
                                //         context, Routes.categoriesScreenRoute);
                                //   },
                                //   child: getCustomFont(
                                //       "See all", 14.sp, grey40, 1,
                                //       fontWeight: FontWeight.w400),
                                // ),
                              ],
                            ),
                            getVerSpace(20.h),
                            animation_function(
                              1,
                              listAnimation: Duration(seconds: 1),
                              Row(
                                children: [
                                  service_formate(
                                      "ac_repair_icon.png", "Ac Repair", () {
                                    Constant.sendToNext(
                                        context, Routes.aCRepairScreenRoute);
                                  }),
                                  getHorSpace(20.h),
                                  service_formate(
                                      "electronics_icon.png", "Electricity",
                                      () {
                                    Constant.sendToNext(
                                        context, Routes.electronicScreenRoute);
                                  }),
                                  getHorSpace(20.h),
                                  service_formate(
                                      "appliance_icon.png", "Appliance", () {
                                    Constant.sendToNext(context,
                                        Routes.applianceCategoriesScreenRoute);
                                  }),
                                  getHorSpace(20.h),
                                  service_formate(
                                      "plumbing_icon.png", "Plumbing", () {
                                    Constant.sendToNext(
                                        context, Routes.plumbingScreenRoute);
                                  }),
                                ],
                              ),
                            )
                          ],
                        ),
                      ).paddingSymmetric(horizontal: 20.h),
                      getVerSpace(24.h),
                      // Container(
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           getCustomFont(
                      //               "Cleaning Service", 16.sp, regularBlack, 1,
                      //               fontWeight: FontWeight.w500),
                      //           GestureDetector(
                      //             onTap: (){
                      //               Constant.sendToNext(context, Routes.cleaningServiceScreenRoute);
                      //             },
                      //             child: getCustomFont("See all", 14.sp, grey40, 1,
                      //                 fontWeight: FontWeight.w400),
                      //           ),
                      //         ],
                      //       ).paddingSymmetric(horizontal: 20.h),
                      //       getVerSpace(20.h),
                      //       // Container(
                      //       //   height: 110.h,
                      //       //   child: ListView.builder(
                      //       //     physics: BouncingScrollPhysics(),
                      //       //     padding: EdgeInsets.symmetric(horizontal: 10.h),
                      //       //     scrollDirection: Axis.horizontal,
                      //       //     itemCount:
                      //       //         3,
                      //       //     itemBuilder: (context, index) {
                      //       //       CleaningServiceOffer cleaning =
                      //       //           homeScreenController.cleaningOffer[index];
                      //       //       return cleaning.discount==''?SizedBox():GestureDetector(
                      //       //         onTap: (){
                      //       //           Constant.sendToNext(context, Routes.acRepairServiceDetailScreenRoute);
                      //       //         },child: animation_function(index,listAnimation: Duration(seconds: 1),Container(
                      //       //             decoration: BoxDecoration(
                      //       //                 borderRadius:
                      //       //                     BorderRadius.circular(16.h),
                      //       //                 border: Border.all(color: grey20)),
                      //       //             child: Row(
                      //       //               children: [
                      //       //                 Container(
                      //       //                   height: 102.h,
                      //       //                   width: 105.h,
                      //       //                   decoration: BoxDecoration(
                      //       //                       borderRadius:
                      //       //                       BorderRadius.circular(16.h),
                      //       //                       image: DecorationImage(image: AssetImage(Constant.assetImagePath+cleaning.image!))),

                      //       //                 ),
                      //       //                 getHorSpace(10.h),
                      //       //                 Column(
                      //       //                   crossAxisAlignment: CrossAxisAlignment.start,
                      //       //                   mainAxisAlignment: MainAxisAlignment.center,
                      //       //                   children: [
                      //       //                     getCustomFont(cleaning.title!, 14.sp, regularBlack, 1,fontWeight: FontWeight.w700),
                      //       //                     getVerSpace(4.h),
                      //       //                     getCustomFont("\$${cleaning.price}", 14.sp, regularBlack, 1,fontWeight: FontWeight.w400),
                      //       //                     getVerSpace(12.h),
                      //       //                     Row(
                      //       //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       //                       children: [
                      //       //                         Row(
                      //       //                           children: [
                      //       //                             getSvgImage("star_icon.svg"),
                      //       //                             getHorSpace(6.h),
                      //       //                             getCustomFont(cleaning.rating!, 14.sp, regularBlack, 1,fontWeight: FontWeight.w400),
                      //       //                           ],
                      //       //                         ),
                      //       //                         getHorSpace(124.h),

                      //       //                        getCustomFont("Off ${cleaning.discount}%", 14.sp, grey40, 1,fontWeight: FontWeight.w400)
                      //       //                       ],
                      //       //                     ),
                      //       //                   ],
                      //       //                 ),
                      //       //               ],
                      //       //             ).paddingSymmetric(vertical: 4.h,horizontal: 4.h),
                      //       //           ).paddingSymmetric(horizontal: 10.h),
                      //       //         ),
                      //       //       );
                      //       //     },
                      //       //   ),
                      //       // )
                      //     ],
                      //   ),
                      // ),
                      getVerSpace(24.h),
                      // Container(
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           getCustomFont(
                      //               "Recommended", 16.sp, regularBlack, 1,
                      //               fontWeight: FontWeight.w500),
                      //           GestureDetector(
                      //             onTap: (){
                      //               Constant.sendToNext(context, Routes.recommendedServiceScreenRoute);
                      //             },
                      //             child: getCustomFont("See all", 14.sp, grey40, 1,
                      //                 fontWeight: FontWeight.w400),
                      //           ),
                      //         ],
                      //       ).paddingSymmetric(horizontal: 20.h),
                      //       getVerSpace(20.h),
                      //       // Container(
                      //       //   height: 181.h,
                      //       //   child: ListView.builder(
                      //       //     physics: BouncingScrollPhysics(),
                      //       //     padding: EdgeInsets.symmetric(horizontal: 10.h),
                      //       //     scrollDirection: Axis.horizontal,
                      //       //     itemCount:
                      //       //     homeScreenController.recommendedData.length,
                      //       //     itemBuilder: (context, index) {
                      //       //       RecommendedData recommended =
                      //       //       homeScreenController.recommendedData[index];
                      //       //       return GestureDetector(
                      //       //         onTap: (){
                      //       //           Constant.sendToNext(context, Routes.acRepairServiceDetailScreenRoute);
                      //       //         },
                      //       //         child: animation_function(
                      //       //           index, listAnimation: Duration(seconds: 1),Column(
                      //       //             crossAxisAlignment: CrossAxisAlignment.start,
                      //       //             children: [
                      //       //               Container(
                      //       //                 height: 126.h,
                      //       //                 width: 142.h,
                      //       //                 decoration: BoxDecoration(
                      //       //                     borderRadius:
                      //       //                     BorderRadius.circular(16.h),
                      //       //                     image: DecorationImage(image: AssetImage(Constant.assetImagePath+recommended.image!))),

                      //       //               ),
                      //       //               getVerSpace(10.h),
                      //       //               getCustomFont(recommended.title!, 14.sp, regularBlack, 1,fontWeight: FontWeight.w700),
                      //       //               getVerSpace(4.h),
                      //       //               getCustomFont("\$${recommended.price}", 14.sp, regularBlack, 1,fontWeight: FontWeight.w400),
                      //       //             ],
                      //       //           ).paddingSymmetric(horizontal: 10.h),
                      //       //         ),
                      //       //       );
                      //       //     },
                      //       //   ),
                      //       // )
                      //     ],
                      //   ),
                      // )
                    ],
                  ))
                ],
              )),
    ));
  }

  Widget service_formate(icon, title, function) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.h),
              color: serviceContainerbg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getAssetImage(icon)
                  .paddingSymmetric(horizontal: 19.5.h, vertical: 9.h),
              getCustomFont(title, 14.sp, regularBlack, 1,
                  fontWeight: FontWeight.w400),
              getVerSpace(9.h),
            ],
          ),
        ),
      ),
    );
  }
}
