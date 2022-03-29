import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_user_permission.dart';
import 'package:junkbee_user/user/view/pages/order_process/user_order_maps.dart';
import 'package:http/http.dart' as http;

class UserOrder extends StatefulWidget {
  String? address;

  UserOrder({Key? key, this.address}) : super(key: key);

  @override
  _UserOrderState createState() => _UserOrderState();
}

class _UserOrderState extends State<UserOrder> {
  SecureStorage secureStorage = SecureStorage();

  bool isPaperSelected = false;
  bool isPlasticSelected = false;
  bool isGlassSelected = false;
  bool isSachetSelected = false;
  bool isMetalSelected = false;
  bool isOilSelected = false;

  double initialPaper = 0.0;
  double initialPlastic = 0.0;
  double initialGlass = 0.0;
  double initialSachet = 0.0;
  double initialMetal = 0.0;
  double initialOil = 0.0;

  File? image1;
  File? image2;
  File? image3;

  void _getFromCam1() async {
    XFile? pickedFile1 = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      if (pickedFile1 != null) {
        image1 = File(pickedFile1.path);
      } else {
        null;
      }
    });
  }

  void _getFromCam2() async {
    XFile? pickedFile2 = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
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
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      if (pickedFile3 != null) {
        image3 = File(pickedFile3.path);
      } else {
        null;
      }
    });
  }

  String? latitude;
  String? longitude;

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;
    setState(() {
      latitude = "$lat";
      longitude = "$long";
    });

    var queryParams = {
      'lat': latitude,
      'long': longitude,
    };
  }

  String? totalWasteWeight;
  String? totalPrice = 10.000.toString();
  String? totalFeeBeever = 3000.toString();
  String? userLocation;
  String? wasteType = 'paper';
  String? wasteWeight = 10.toString();
  String? subtotal = 20.toString();

  void _orderUser() async {
    try {
      var authToken = await secureStorage.readSecureData('token');
      var token = authToken;

      final request = await http.MultipartRequest(
          'POST', Uri.parse(EndPoint.baseApiURL + EndPoint.userOrder));
      final file = await http.MultipartFile.fromPath('image', image1!.path,
          contentType: MediaType('image', 'jpg'));
      request.files.add(file);
      request.fields['total_weight'] = '$totalWasteWeight';
      request.fields['total'] = '$totalPrice';
      request.fields['fee_beever'] = '$totalFeeBeever';
      request.fields['waste_type'] = '$wasteType';
      request.fields['waste_weight'] = '$wasteWeight';
      request.fields['subtotal'] = '$subtotal';
      request.fields['lat'] = '$latitude';
      request.fields['lng'] = '$longitude';
      request.fields['location1'] = '$userLocation';
      request.headers['Authorization'] = 'Bearer $token';

      try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        Map<String, dynamic> responseJSON = jsonDecode(response.body);

        if (response.statusCode == 200) {
          print('success');
        } else if (response.statusCode == 400) {
          Get.snackbar('Bad Request', response.body,
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
      } catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    double totalWeight = initialPaper +
        initialGlass +
        initialMetal +
        initialOil +
        initialPlastic +
        initialSachet;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('New Collection', style: onboardingGetStarted),
        centerTitle: true,
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: defaultPadding4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Waste Categories', style: titleBodyMini),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isPaperSelected = !isPaperSelected;
                              initialPaper = 0;
                            });
                          },
                          child: SizedBox(
                            width: 100,
                            height: 80,
                            child: Image.asset((isPaperSelected == true)
                                ? 'icons/waste_icons/paper_button.png'
                                : 'icons/waste_icons/paper_off.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isPlasticSelected = !isPlasticSelected;
                              initialPlastic = 0;
                            });
                          },
                          child: SizedBox(
                            width: 100,
                            height: 80,
                            child: Image.asset((isPlasticSelected == true)
                                ? 'icons/waste_icons/plastic_button.png'
                                : 'icons/waste_icons/plastic_off.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isGlassSelected = !isGlassSelected;
                              initialGlass = 0;
                            });
                          },
                          child: SizedBox(
                            width: 100,
                            height: 80,
                            child: Image.asset((isGlassSelected == true)
                                ? 'icons/waste_icons/glass_button.png'
                                : 'icons/waste_icons/glass_off.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSachetSelected = !isSachetSelected;
                              initialSachet = 0;
                            });
                          },
                          child: SizedBox(
                            width: 100,
                            height: 80,
                            child: Image.asset((isSachetSelected == true)
                                ? 'icons/waste_icons/sachet_button.png'
                                : 'icons/waste_icons/sachet_off.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMetalSelected = !isMetalSelected;
                              initialMetal = 0;
                            });
                          },
                          child: SizedBox(
                            width: 100,
                            height: 80,
                            child: Image.asset((isMetalSelected == true)
                                ? 'icons/waste_icons/metal_button.png'
                                : 'icons/waste_icons/metal_off.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isOilSelected = !isOilSelected;
                              initialOil = 0;
                            });
                          },
                          child: SizedBox(
                            width: 100,
                            height: 80,
                            child: Image.asset((isOilSelected == true)
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
            (isPaperSelected == true) ? paperCard() : const SizedBox(),
            (isPlasticSelected == true) ? plasticCard() : const SizedBox(),
            (isGlassSelected == true) ? glassCard() : const SizedBox(),
            (isSachetSelected == true) ? sachetCard() : const SizedBox(),
            (isMetalSelected == true) ? metalCard() : const SizedBox(),
            (isOilSelected == true) ? oilCard() : const SizedBox(),
            Padding(
              padding: defaultPadding4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Take a Photos (up to 3 photos)',
                      style: titleBodyMini),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      image1 != null
                          ? GestureDetector(
                              onTap: () {
                                _getFromCam1();
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 7,
                                child: ClipRRect(
                                  borderRadius: roundedRect,
                                  child: Image.file(image1!, fit: BoxFit.cover),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                _getFromCam1();
                              },
                              child: Image.asset(
                                'icons/icons_others/add_pict.png',
                                width: MediaQuery.of(context).size.width / 5,
                              ),
                            ),
                      image2 != null
                          ? GestureDetector(
                              onTap: _getFromCam2,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 7,
                                child: ClipRRect(
                                    borderRadius: roundedRect,
                                    child:
                                        Image.file(image2!, fit: BoxFit.cover)),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                _getFromCam2();
                              },
                              child: Image.asset(
                                'icons/icons_others/blank_image.png',
                                width: MediaQuery.of(context).size.width / 5,
                              ),
                            ),
                      image3 != null
                          ? GestureDetector(
                              onTap: _getFromCam3,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 7,
                                child: ClipRRect(
                                    borderRadius: roundedRect,
                                    child:
                                        Image.file(image3!, fit: BoxFit.cover)),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                _getFromCam3();
                              },
                              child: Image.asset(
                                'icons/icons_others/blank_image.png',
                                width: MediaQuery.of(context).size.width / 5,
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: defaultPadding4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Estimated Earnings',
                    style: titleBodyMini,
                  ),
                  Card(
                    shape: roundedRectBor,
                    child: Column(
                      children: [
                        Padding(
                          padding: defaultPadding3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Estimated Weight (Kg)',
                                  style: onboardingNormalText),
                              Text(totalWeight.toString())
                            ],
                          ),
                        ),
                        Padding(
                          padding: defaultPadding3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Total Earnings',
                                  style: onboardingNormalText),
                              Text('data')
                            ],
                          ),
                        ),
                        Padding(
                          padding: defaultPadding3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Admin Fee', style: onboardingNormalText),
                              Text('data')
                            ],
                          ),
                        ),
                        const Divider(
                          height: 10,
                        ),
                        Padding(
                          padding: defaultPadding3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Estimated Earnings',
                                  style: onboardingNormalText),
                              Text('data')
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
                  const Text('Pick Up Location', style: titleBodyMini),
                  Card(
                    shape: roundedRectBor,
                    child: Column(
                      children: [
                        Padding(
                          padding: defaultPadding2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                      'icons/icons_others/ico_location.png',
                                      width: 30),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      (widget.address != null)
                                          ? widget.address.toString()
                                          : 'Lokasimu',
                                      style: onboardingNormalText,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const UserOrderMaps());
                                },
                                child:
                                    const Text('Change', style: onboardingSkip),
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
                      width: MediaQuery.of(context).size.width / 1,
                      height: MediaQuery.of(context).size.height / 4,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Your Notes Here',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 12,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: mainColor2, shape: roundedRectBor),
                  child:
                      const Text('Find a Beever', style: onboardingGetStarted),
                  onPressed: () {
                    getCurrentLocation();
                    setState(() {
                      totalWasteWeight = totalWeight.toString();
                      userLocation = widget.address;
                    });
                    _orderUser();
                  },
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
          ],
        ),
      ),
    );
  }

  Padding paperCard() {
    return Padding(
      padding: defaultPaddingS,
      child: Card(
        child: Padding(
          padding: defaultPaddingS,
          child: Row(
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
                        setState(() {
                          (initialPaper > 0) ? initialPaper-- : null;
                        });
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.amber,
                      )),
                  Text(
                    '$initialPaper Kg',
                    style: bodySlimBody,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          initialPaper++;
                        });
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                        color: Colors.amber,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding plasticCard() {
    return Padding(
      padding: defaultPaddingS,
      child: Card(
        child: Padding(
          padding: defaultPaddingS,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'icons/waste_icons/plastic_button.png',
                    width: 60,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Plastic',
                    style: bodySlimBody,
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          (initialPlastic > 0) ? initialPlastic-- : null;
                        });
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline_outlined,
                        color: Colors.amber,
                      )),
                  Text(
                    '$initialPlastic Kg',
                    style: bodySlimBody,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          initialPlastic++;
                        });
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                        color: Colors.amber,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding glassCard() {
    return Padding(
      padding: defaultPaddingS,
      child: Card(
        margin: defaultPaddingS,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'icons/waste_icons/glass_button.png',
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Glass',
                  style: bodySlimBody,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        (initialGlass > 0) ? initialGlass-- : null;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline_outlined,
                      color: Colors.amber,
                    )),
                Text(
                  '$initialGlass Kg',
                  style: bodySlimBody,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        initialGlass++;
                      });
                    },
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      color: Colors.amber,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding sachetCard() {
    return Padding(
      padding: defaultPaddingS,
      child: Card(
        margin: defaultPaddingS,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'icons/waste_icons/sachet_button.png',
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Sachet',
                  style: bodySlimBody,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        (initialSachet > 0) ? initialSachet-- : null;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.amber,
                    )),
                Text(
                  '$initialSachet Kg',
                  style: bodySlimBody,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        initialSachet++;
                      });
                    },
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      color: Colors.amber,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding metalCard() {
    return Padding(
      padding: defaultPaddingS,
      child: Card(
        margin: defaultPaddingS,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'icons/waste_icons/metal_button.png',
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Metal',
                  style: bodySlimBody,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        (initialMetal > 0) ? initialMetal-- : null;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.amber,
                    )),
                Text(
                  '$initialMetal Kg',
                  style: bodySlimBody,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        initialMetal++;
                      });
                    },
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      color: Colors.amber,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding oilCard() {
    return Padding(
      padding: defaultPaddingS,
      child: Card(
        margin: defaultPaddingS,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'icons/waste_icons/oil_button.png',
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Oil',
                  style: bodySlimBody,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        (initialOil > 0) ? initialOil-- : null;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.amber,
                    )),
                Text(
                  '$initialOil Kg',
                  style: bodySlimBody,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        initialOil++;
                      });
                    },
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      color: Colors.amber,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
