// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, avoid_init_to_null, unused_local_variable, await_only_futures, avoid_print, sized_box_for_whitespace, avoid_unnecessary_containers, unused_import

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/controller/waste_count.dart';
import 'package:junkbee_user/user/models/waste_price_models.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_get_data.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_user_permission.dart';
import 'package:junkbee_user/user/view/login_signup/login_screen.dart';
import 'package:junkbee_user/user/view/pages/0.navigator.dart';
import 'package:junkbee_user/user/view/pages/order_process/user_order_maps.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:place_picker/place_picker.dart';

class UserOrder extends StatefulWidget {
  const UserOrder({Key? key}) : super(key: key);

  @override
  UserOrderState createState() => UserOrderState();
}

class UserOrderState extends State<UserOrder> {
  String? alamat = 'Lokasimu';
  File? image1;
  File? image2;
  File? image3;
  bool isGlassSelected = false;
  bool isMetalSelected = false;
  bool isOilSelected = false;
  bool isPaperSelected = false;
  bool isPlasticSelected = false;
  bool isSachetSelected = false;
  String? latitude;
  bool loading = false;
  String? longitude;
  String? namaTempat = 'Nama Tempat';
  int? paperPrices;
  SecureStorage secureStorage = SecureStorage();
  String? subtotal;
  dynamic token_local = null;
  String? totalFeeBeever = 3000.toString();
  double? totalHarga;
  int? totalWasteWeight;
  String? userLocation;
  WasteCountController wasteCountController = Get.put(WasteCountController());
  String? wasteType = 'Paper';
  int? wasteWeight;

  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getWasteParice();
    ApiCallsGetDataUser().getWastePrice();
    PermissionHandler().listenForPermission();
    check_token();
  }

  void getWasteParice() async {
    var wastePrice = await secureStorage.readSecureData('paperPrice');
    setState(() {
      paperPrices = int.parse(wastePrice);
    });
  }

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;
    if (mounted) {
      setState(() {
        latitude = "$lat";
        longitude = "$long";
      });
    }
    print(latitude);
    print(longitude);
  }

  void errorResponse() {
    Get.snackbar('Bad Request', 'Failed',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.amber,
        colorText: Colors.white,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeInOutCubicEmphasized,
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.only(bottom: 300, left: 20, right: 20),
        icon: const Icon(
          Icons.error_outlined,
          color: Colors.red,
        ));
  }

  void showPlacePicker() async {
    LocationResult? result = await Get.to(() => PlacePicker(
          "AIzaSyA1MgLuZuyqR_OGY3ob3M52N46TDBRI_9k",
        ));
    if (result != null) {
      setState(() {
        alamat = result.formattedAddress;
        namaTempat = result.name;
      });
    } else {
      setState(() {
        alamat = alamat;
        namaTempat = namaTempat;
      });
    }
  }

  check_token() async {
    var token = await secureStorage.readSecureData('token');
    if (mounted) {
      setState(() {
        token_local = token;
      });
    }
    getCurrentLocation();
  }

  void showAnimatedDialogueFinish() {
    showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 1,
            backgroundColor: Colors.white,
            insetPadding: const EdgeInsets.all(0),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 3.1,
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Image.asset('assets/group_2210.png',
                                width: MediaQuery.of(context).size.width / 25))
                      ],
                    )),
                    Container(
                      padding: const EdgeInsets.only(top: 18, bottom: 15),
                      child: const Text('Pesanan Sudah Siap!',
                          style: titleBodyLogout),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 45),
                      child: const Text(
                          'Pastikan Pesanan anda disertai dengan alamat ya!',
                          style: bodyBody),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2.8,
                                height: MediaQuery.of(context).size.height / 13,
                                alignment: Alignment.center,
                                child: const Text('Kembali',
                                    style: bodyBodySemi))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.8,
                          height: MediaQuery.of(context).size.height / 13,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  primary: const Color(0xFFF8C503)),
                              onPressed: () {
                                Navigator.of(context).pop();
                                _orderUser();
                              },
                              child: const Text('Sudah Tepat',
                                  style: bodyBodyMini)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        animationType: DialogTransitionType.slideFromBottomFade,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 1));
  }

  void showAnimatedDialogue() {
    showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 1,
              backgroundColor: Colors.white,
              insetPadding: const EdgeInsets.all(0),
              child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 3,
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: const Text('You must login first!',
                                style: TextStyle(
                                    color: Color(0xFF707070),
                                    fontFamily: 'DiodrumCyrillicBold',
                                    fontSize: 18)),
                          ),
                          Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: GestureDetector(
                                onTap: () async {
                                  var result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInUser()));
                                  if (result == 'back') {
                                    await check_token();
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  }
                                  // Navigator.of(context).pop();
                                  Get.back();
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xFFF8C503),
                                        Color(0xFFFFE067)
                                      ])),
                                  alignment: Alignment.center,
                                  child: const Text('Login / Register',
                                      style: bodyBodyUserMini),
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text('Cancel',
                                      style: bodyBodyUserMini),
                                ),
                              ))
                        ],
                      ))));
        },
        animationType: DialogTransitionType.slideFromBottomFade,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 1));
  }

  Padding paperCard() {
    return Padding(
      padding: defaultPaddingS,
      child: GetBuilder<WasteCountController>(
        init: WasteCountController(),
        initState: (_) {},
        builder: (controller) {
          return Card(
            child: Padding(
              padding: defaultPaddingS,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'icons/waste_icons/paper_button.png',
                            width: 60,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Paper',
                            style: bodySlimBody,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.find<WasteCountController>()
                                    .initialPaperMinus();
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                color: Colors.amber,
                              )),
                          Text(
                            '${controller.initialPaper} Kg',
                            style: bodySlimBody,
                          ),
                          IconButton(
                              onPressed: () {
                                Get.find<WasteCountController>()
                                    .initialPaperPlus();
                              },
                              icon: const Icon(
                                Icons.add_circle_outline_outlined,
                                color: Colors.amber,
                              )),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'icons/waste_icons/mix_paper.png',
                            width: 60,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Mix Paper',
                            style: bodySlimBody,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (mounted) {
                                  Get.find<WasteCountController>()
                                      .initialMixPaperMinus();
                                }
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                color: Colors.amber,
                              )),
                          Text(
                            '${controller.initialMixPaper} Kg',
                            style: bodySlimBody,
                          ),
                          IconButton(
                              onPressed: () {
                                Get.find<WasteCountController>()
                                    .initialMixPaperPlus();
                              },
                              icon: const Icon(
                                Icons.add_circle_outline_outlined,
                                color: Colors.amber,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _getFromCam1() async {
    XFile? pickedFile1 = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 480,
      maxWidth: 480,
    );
    if (mounted) {
      if (pickedFile1 != null) {
        setState(() {
          image1 = File(pickedFile1.path);
        });
        print(image1);
      }
    }
  }

  void _getFromCam2() async {
    XFile? pickedFile2 = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 480,
      maxWidth: 480,
    );
    setState(() {
      if (pickedFile2 != null) {
        image2 = File(pickedFile2.path);
      } else {
        null;
      }
    });
  }

  void _getFromCam3() async {
    XFile? pickedFile3 = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 480,
      maxWidth: 480,
    );
    setState(() {
      if (pickedFile3 != null) {
        image3 = File(pickedFile3.path);
      } else {
        null;
      }
    });
  }

  void _orderUser() async {
    try {
      var authToken = await secureStorage.readSecureData('token');
      var token = authToken;

      final request = await http.MultipartRequest(
          'POST', Uri.parse(EndPoint.baseApiURL + EndPoint.userOrder));

      if (image1 != null && image2 == null && image3 == null) {
        final file = await http.MultipartFile.fromPath('images[]', image1!.path,
            contentType: MediaType('image', 'jpg'));
        request.files.add(file);
      } else if (image1 != null && image2 != null && image3 == null) {
        final file = await http.MultipartFile.fromPath('images[]', image1!.path,
            contentType: MediaType('image', 'jpg'));
        request.files.add(file);
        final file2 = await http.MultipartFile.fromPath(
            'images[]', image2!.path,
            contentType: MediaType('image', 'jpg'));
        request.files.add(file2);
      } else if (image1 != null && image2 != null && image3 != null) {
        final file = await http.MultipartFile.fromPath('images[]', image1!.path,
            contentType: MediaType('image', 'jpg'));
        request.files.add(file);
        final file2 = await http.MultipartFile.fromPath(
            'images[]', image2!.path,
            contentType: MediaType('image', 'jpg'));
        request.files.add(file2);
        final file3 = await http.MultipartFile.fromPath(
            'images[]', image3!.path,
            contentType: MediaType('image', 'jpg'));
        request.files.add(file3);
      }
      request.fields['total_weight'] = '$totalWasteWeight';
      request.fields['total'] = '$totalHarga';
      request.fields['subtotal'] = '$totalHarga';
      request.fields['fee_beever'] = '$totalFeeBeever';
      request.fields['waste_type'] = '$wasteType';
      request.fields['waste_weight'] = '$totalWasteWeight';
      request.fields['tempat'] = '$namaTempat';
      request.fields['location1'] = '$alamat';
      request.fields['notes'] = _notesController.text;
      request.fields['lat'] = '$latitude';
      request.fields['lng'] = '$longitude';
      request.headers.addAll({
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'multipart/form-data'
      });

      try {
        setState(() => loading = true);
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        print(response.body);
        Map<String, dynamic> responseJSON = await jsonDecode(response.body);
        if (response.statusCode == 200) {
          setState(() => loading = false);
          Get.offAll(() => const NavigatorUser());
        } else if (response.statusCode == 400) {
          setState(() => loading = false);
          Get.snackbar('Bad Request', response.body,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.amber,
              colorText: Colors.white,
              isDismissible: true,
              forwardAnimationCurve: Curves.easeInOutCubicEmphasized,
              duration: const Duration(seconds: 3),
              margin: const EdgeInsets.only(bottom: 300, left: 20, right: 20),
              icon: const Icon(
                Icons.error_outlined,
                color: Colors.red,
              ));
        }
      } catch (e) {
        setState(() => loading = false);
        print('error 1 => $e');
        Get.offAll(() => const NavigatorUser());
      }
    } catch (e) {
      setState(() => loading = false);
      print('error 2 => $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Collections', style: onboardingGetStarted),
        centerTitle: true,
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: GetBuilder<WasteCountController>(
          init: WasteCountController(),
          initState: (_) {},
          builder: (controller) {
            var paper = controller.initialPaper.toDouble();
            var mixPaper = controller.initialMixPaper.toDouble();
            var totalWeight = paper + mixPaper;
            var totalPrice = totalWeight * controller.paperPrice;
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/bg_warning.png'),
                                  fit: BoxFit.fitWidth),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/bg_warning_person.png',
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Minimum Request 5 Kg',
                                          style: onboardingGetStarted,
                                        ),
                                        Text(
                                          'untuk saat ini berat minimal sampah yang bisa kami jemput adalah 5 Kg',
                                          style: onboardingGetStartedSmallWhite,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: defaultPadding4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Waste Categories',
                                    style: titleBodyMini),
                                const SizedBox(height: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isPaperSelected = !isPaperSelected;
                                          });
                                        },
                                        child: SizedBox(
                                          width: 100,
                                          height: 80,
                                          child: Image.asset((isPaperSelected ==
                                                  true)
                                              ? 'icons/waste_icons/paper_button.png'
                                              : 'icons/waste_icons/paper_off.png'),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => Fluttertoast.showToast(
                                            msg: 'Segera Tayang',
                                            toastLength: Toast.LENGTH_SHORT,
                                            backgroundColor:
                                                const Color(0xFFF8C503)),
                                        child: SizedBox(
                                          width: 100,
                                          height: 80,
                                          child: Image.asset((isPlasticSelected ==
                                                  true)
                                              ? 'icons/waste_icons/plastic_button.png'
                                              : 'icons/waste_icons/plastic_off.png'),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => Fluttertoast.showToast(
                                            msg: 'Segera Tayang',
                                            toastLength: Toast.LENGTH_SHORT,
                                            backgroundColor:
                                                const Color(0xFFF8C503)),
                                        child: SizedBox(
                                          width: 100,
                                          height: 80,
                                          child: Image.asset((isGlassSelected ==
                                                  true)
                                              ? 'icons/waste_icons/glass_button.png'
                                              : 'icons/waste_icons/glass_off.png'),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => Fluttertoast.showToast(
                                            msg: 'Segera Tayang',
                                            toastLength: Toast.LENGTH_SHORT,
                                            backgroundColor:
                                                const Color(0xFFF8C503)),
                                        child: SizedBox(
                                          width: 100,
                                          height: 80,
                                          child: Image.asset((isSachetSelected ==
                                                  true)
                                              ? 'icons/waste_icons/sachet_button.png'
                                              : 'icons/waste_icons/sachet_off.png'),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => Fluttertoast.showToast(
                                            msg: 'Segera Tayang',
                                            toastLength: Toast.LENGTH_SHORT,
                                            backgroundColor:
                                                const Color(0xFFF8C503)),
                                        child: SizedBox(
                                          width: 100,
                                          height: 80,
                                          child: Image.asset((isMetalSelected ==
                                                  true)
                                              ? 'icons/waste_icons/metal_button.png'
                                              : 'icons/waste_icons/metal_off.png'),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => Fluttertoast.showToast(
                                            msg: 'Segera Tayang',
                                            toastLength: Toast.LENGTH_SHORT,
                                            backgroundColor:
                                                const Color(0xFFF8C503)),
                                        child: SizedBox(
                                          width: 100,
                                          height: 80,
                                          child: Image.asset((isOilSelected ==
                                                  true)
                                              ? 'icons/waste_icons/oil_button.png'
                                              : 'icons/waste_icons/oil_off.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          (isPaperSelected == true)
                              ? paperCard()
                              : const SizedBox(),
                          Padding(
                            padding: defaultPadding4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: const Text(
                                      'Take a Photos (up to 3 photos)',
                                      style: titleBodyMini),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    image1 != null
                                        ? GestureDetector(
                                            onTap: () {
                                              _getFromCam1();
                                            },
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  8,
                                              child: ClipRRect(
                                                borderRadius: roundedRect,
                                                child: Image.file(image1!,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              _getFromCam1();
                                            },
                                            child: Image.asset(
                                              'icons/icons_others/add_pict.png',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                            ),
                                          ),
                                    const SizedBox(width: 25),
                                    image2 != null
                                        ? GestureDetector(
                                            onTap: _getFromCam2,
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  8,
                                              child: ClipRRect(
                                                  borderRadius: roundedRect,
                                                  child: Image.file(image2!,
                                                      fit: BoxFit.cover)),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              _getFromCam2();
                                            },
                                            child: Image.asset(
                                              'icons/icons_others/add_pict.png',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                            ),
                                          ),
                                    const SizedBox(width: 25),
                                    image3 != null
                                        ? GestureDetector(
                                            onTap: _getFromCam3,
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  8,
                                              child: ClipRRect(
                                                  borderRadius: roundedRect,
                                                  child: Image.file(image3!,
                                                      fit: BoxFit.cover)),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              _getFromCam3();
                                            },
                                            child: Image.asset(
                                              'icons/icons_others/add_pict.png',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                            ),
                                          ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          GetBuilder<WasteCountController>(
                            init: WasteCountController(),
                            initState: (_) {},
                            builder: (controller) {
                              return Padding(
                                  padding: defaultPadding4,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Estimated Earnings',
                                          style: titleBodyMini,
                                        ),
                                        Card(
                                            shape: roundedRectBor,
                                            child: Column(children: [
                                              Padding(
                                                padding: defaultPadding3,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                        'Estimated Weight (Kg)',
                                                        style:
                                                            onboardingNormalText),
                                                    Text('$totalWeight')
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                  padding: defaultPadding3,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                            'Total Earnings',
                                                            style:
                                                                onboardingNormalText),
                                                        Text(NumberFormat
                                                                .simpleCurrency(
                                                                    locale:
                                                                        'ID',
                                                                    decimalDigits:
                                                                        0)
                                                            .format(totalPrice))
                                                      ])),
                                              const Divider(height: 10),
                                              Padding(
                                                  padding: defaultPadding3,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                            'Estimated Earnings',
                                                            style:
                                                                onboardingNormalText),
                                                        Text(NumberFormat
                                                                .simpleCurrency(
                                                                    locale:
                                                                        'ID',
                                                                    decimalDigits:
                                                                        0)
                                                            .format(totalPrice))
                                                      ]))
                                            ]))
                                      ]));
                            },
                          ),
                          Padding(
                            padding: defaultPadding4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Pick Up Location',
                                    style: titleBodyMini),
                                Card(
                                  shape: roundedRectBor,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: defaultPadding2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                    'icons/icons_others/ico_location.png',
                                                    width: 30),
                                                const SizedBox(width: 10),
                                                Column(
                                                  children: [
                                                    const SizedBox(width: 10),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                      child: Text(
                                                        (alamat == null)
                                                            ? 'Nama Tempat'
                                                            : namaTempat
                                                                .toString(),
                                                        style: titleBodyMini
                                                            .copyWith(
                                                                fontSize: 16),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                      child: Text((alamat ==
                                                              null)
                                                          ? 'Lokasimu'
                                                          : alamat.toString()),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: showPlacePicker,
                                              child: const Text('Change',
                                                  style: onboardingSkip),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: defaultPadding4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Notes', style: titleBodyMini),
                                Card(
                                  shape: roundedRectBor,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: _notesController,
                                        maxLines: 10,
                                        keyboardType: TextInputType.multiline,
                                        decoration:
                                            const InputDecoration.collapsed(
                                          hintText: 'Your Notes Here',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          (image1 != null &&
                                  image2 != null &&
                                  image3 != null &&
                                  totalWeight >= 5)
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: mainColor2,
                                        shape: roundedRectBor),
                                    child: const Text('Find a Beever',
                                        style: onboardingGetStarted),
                                    onPressed: () {
                                      if (token_local == null) {
                                        showAnimatedDialogue();
                                      } else {
                                        if (mounted) {
                                          setState(() {
                                            totalWasteWeight =
                                                totalWeight.toInt();
                                            totalHarga = totalPrice;
                                          });
                                        }
                                        getCurrentLocation();
                                        showAnimatedDialogueFinish();
                                      }
                                    },
                                  ))
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: mainColor1,
                                        shape: roundedRectBor),
                                    child: const Text(
                                        'Minimal berat 5Kg & Foto Lengkap',
                                        style: onboardingGetStarted),
                                    onPressed: () {},
                                  )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 6,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                loading
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                        alignment: Alignment.center,
                        child: const SpinKitWave(size: 50, color: mainColor2))
                    : Container()
              ],
            );
          },
        ),
      ),
    );
  }
}
