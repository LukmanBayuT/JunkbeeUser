// ignore_for_file: file_names, avoid_print, await_only_futures, unused_local_variable, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'dart:convert';
import 'package:junkbee_user/beever/service/api_calls_get_data.dart';
import 'package:junkbee_user/beever/const/base_url.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:junkbee_user/beever/widgets/profile/editProfile_widget.dart';

final SecureStorage secureStorage = SecureStorage();

GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '359679760003-ekq8juiku5p1k5f386i19v7a7udph28f.apps.googleusercontent.com');

class EditProfile extends StatefulWidget {
  final dynamic image;
  final String? name;
  final String? phone;
  final String? email;
  const EditProfile(
      {Key? key,
      @required this.image,
      @required this.name,
      @required this.phone,
      @required this.email})
      : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isSwitchFB = false;
  bool isSwitchGoogle = false;
  bool loadingImage = false;

  @override
  void initState() {
    super.initState();
    if (widget.name != null || widget.phone != null || widget.email != null) {
      nameController.text = widget.name!;
      phoneController.text = widget.phone!;
      emailController.text = widget.email!;
    }
  }

  updateData() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    final updateData = await http.put(
        Uri.parse(EndPoint.baseApiURL + EndPoint.updateUserData),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({
          'full_name': nameController.text,
          'phone': phoneController.text,
          'email': emailController.text,
          'address': 'Jln. Jrg Checkin'
        }));
    Map<String, dynamic> bodyJSON = jsonDecode(updateData.body);
    if (bodyJSON['message'] == 'data has been updated') {
      Navigator.pop(context, 'back');
    }
  }

  takePhoto() async {
    if (await Permission.camera.request().isGranted) {
      var status = await Permission.camera.status;
      if (status.isGranted) {
        print('access granted');
        var photo = await ImagePicker().pickImage(
            source: ImageSource.camera, maxWidth: 500.0, maxHeight: 500.0);
        if (photo != null) {
          var authToken = await secureStorage.readSecureData('token');
          var token = authToken;

          String typeImage = photo.name.split('.').last;
          final request = await http.MultipartRequest('POST',
              Uri.parse(EndPoint.baseApiURL + EndPoint.updateProfileImage));
          final file = await http.MultipartFile.fromPath('image', photo.path,
              contentType: MediaType('image', typeImage));
          request.files.add(file);
          if (widget.image == null) {
            request.fields['oldImage'] = '';
          } else {
            request.fields['oldImage'] = widget.image;
          }
          request.headers['Authorization'] = 'Bearer $token';

          try {
            final streamedResponse = await request.send();
            final response = await http.Response.fromStream(streamedResponse);
            Map<String, dynamic> responseJSON = jsonDecode(response.body);
            if (responseJSON['message'] == 'data has been updated') {
              Navigator.pop(context, 'back');
            }
          } catch (e) {
            print(e);
          }
        }
      } else {
        print('access denied');
      }
    }
  }

  _onFacebookSignIn() async {
    final fb = FacebookLogin();

    final res = await fb.logIn(permissions: [FacebookPermission.publicProfile]);
    switch (res.status) {
      case FacebookLoginStatus.success:
        final profile = await fb.getUserProfile();
        if (profile != null) {
          var authToken = await secureStorage.readSecureData('token');
          var token = authToken;

          final response = await http.put(
              Uri.parse(EndPoint.baseApiURL + EndPoint.updateSocialMedia),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token'
              },
              body: json.encode({'facebook_id': profile.userId}));
          Map<String, dynamic> bodyJSON = jsonDecode(response.body);
          if (bodyJSON['message'] == 'data has been updated') {
            await ApiCallsGetData().getData();
            setState(() {});
          }
        }
        break;
      case FacebookLoginStatus.cancel:
        print('You cancel Facebook login');
        break;
      case FacebookLoginStatus.error:
        print('Facebook login error');
        break;
    }
  }

  _onFacebookSignOut() async {
    final fb = FacebookLogin();
    final res = await fb.logOut();
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;

    final response = await http.put(
        Uri.parse(EndPoint.baseApiURL + EndPoint.updateSocialMedia),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({'facebook_id': null}));
    Map<String, dynamic> bodyJSON = jsonDecode(response.body);
    if (bodyJSON['message'] == 'data has been updated') {
      await ApiCallsGetData().getData();
      setState(() {});
    }
  }

  _onGoogleSigninSuccess(GoogleSignInAccount account) async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;

    final response = await http.put(
        Uri.parse(EndPoint.baseApiURL + EndPoint.updateSocialMedia),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({'google_id': account.id}));
    Map<String, dynamic> bodyJSON = jsonDecode(response.body);
    if (bodyJSON['message'] == 'data has been updated') {
      await ApiCallsGetData().getData();
      setState(() {});
    }
  }

  _onGoogleSignIn() async {
    try {
      final account = await _googleSignIn.signIn();
      _onGoogleSigninSuccess(account!);
    } catch (error) {
      print(error);
    }
  }

  _onGoogleSignOut() async {
    _googleSignIn.disconnect();
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;

    final response = await http.put(
        Uri.parse(EndPoint.baseApiURL + EndPoint.updateSocialMedia),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({'google_id': 'null'}));
    Map<String, dynamic> bodyJSON = jsonDecode(response.body);
    if (bodyJSON['message'] == 'data has been updated') {
      await ApiCallsGetData().getData();
      setState(() {});
    }
  }

  _onWillPop() async {
    Navigator.pop(context, 'back');
  }

  @override
  Widget build(BuildContext) {
    return WillPopScope(
        onWillPop: () => _onWillPop(),
        child: ScreenUtilInit(
            designSize: const Size(480, 904),
            builder: () => Scaffold(
                  appBar: AppBar(
                    title: const Text('Edit Profile', style: textBodyProfile),
                    centerTitle: true,
                    backgroundColor: const Color(0xFFF8C503),
                    leading: TouchableOpacity(
                        onTap: () => Navigator.pop(context, 'back'),
                        child: const Icon(Icons.arrow_back_ios_new_rounded,
                            size: 25)),
                    actions: [
                      Container(
                          padding: const EdgeInsets.only(right: 20),
                          alignment: Alignment.centerRight,
                          child: TouchableOpacity(
                              onTap: () => updateData(),
                              child: const Text('Save',
                                  style: textProfileMediumWhite)))
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          const EditProfileWidget(),
                          SizedBox(
                            width: ScreenUtil().setWidth(110),
                            height: ScreenUtil().setHeight(110),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(110),
                                  child: widget.image == null
                                      ? Image.asset(
                                          'assets/beever_image.png',
                                          width: ScreenUtil().setWidth(110),
                                          height: ScreenUtil().setHeight(110),
                                        )
                                      : Image.network('${widget.image}',
                                          width: ScreenUtil().setWidth(110),
                                          height: ScreenUtil().setHeight(110),
                                          fit: BoxFit.cover),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 8,
                                    child: TouchableOpacity(
                                        onTap: () => takePhoto(),
                                        child: Container(
                                            width: ScreenUtil().setWidth(35),
                                            height: ScreenUtil().setHeight(35),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFF8C503),
                                                borderRadius:
                                                    BorderRadius.circular(35)),
                                            child: Image.asset(
                                              'assets/group_1666.png',
                                              width: ScreenUtil().setWidth(20),
                                              height:
                                                  ScreenUtil().setHeight(20),
                                            ))))
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 49),
                            width: ScreenUtil().setWidth(342),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(342),
                                  child: const Text(
                                    'Your Name',
                                    style: textProfile,
                                  ),
                                ),
                                TextFormField(
                                  controller: nameController,
                                  style: textProfile,
                                  textCapitalization: TextCapitalization.words,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 24),
                                  width: ScreenUtil().setWidth(342),
                                  child: const Text(
                                    'Mobile Number',
                                    style: textProfile,
                                  ),
                                ),
                                TextFormField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    style: textProfile),
                                Container(
                                  padding: const EdgeInsets.only(top: 24),
                                  width: ScreenUtil().setWidth(342),
                                  child: const Text(
                                    'Email Address',
                                    style: textProfile,
                                  ),
                                ),
                                TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: textProfile)
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 40),
                            width: ScreenUtil().setWidth(400),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(400),
                                  child: const Text(
                                    'Linked Account',
                                    style: textProfileBold,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: ScreenUtil().setWidth(40),
                                              child: Image.asset(
                                                  'assets/group_1669.png')),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: const Text(
                                              'Facebook',
                                              style: textProfile,
                                            ),
                                          ),
                                        ],
                                      ),
                                      FutureBuilder(
                                          future: ApiCallsGetData().getData(),
                                          builder: (context,
                                              AsyncSnapshot snapshot) {
                                            var editProfile = snapshot.data;
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return Container(
                                                  child: (editProfile.data
                                                                  .facebookId) ==
                                                              'null' ||
                                                          (editProfile.data
                                                                  .facebookId) ==
                                                              null
                                                      ? Transform.rotate(
                                                          angle: 3.15,
                                                          child: FlutterSwitch(
                                                              width:
                                                                  ScreenUtil()
                                                                      .setWidth(
                                                                          70),
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          40),
                                                              inactiveColor:
                                                                  const Color(
                                                                      0xFFDEDEDE),
                                                              inactiveToggleColor:
                                                                  const Color(
                                                                      0xFFF0F0F0),
                                                              value: isSwitchFB,
                                                              onToggle: (value) =>
                                                                  _onFacebookSignIn()),
                                                        )
                                                      : Transform.rotate(
                                                          angle: 3.15,
                                                          child: FlutterSwitch(
                                                              width:
                                                                  ScreenUtil()
                                                                      .setWidth(
                                                                          70),
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          40),
                                                              activeColor:
                                                                  const Color(
                                                                      0xFFC2ECBD),
                                                              activeToggleColor:
                                                                  const Color(
                                                                      0xFF2AAE1B),
                                                              value:
                                                                  !isSwitchFB,
                                                              onToggle: (value) =>
                                                                  _onFacebookSignOut()),
                                                        ));
                                            } else {
                                              return SizedBox(
                                                  width:
                                                      ScreenUtil().setWidth(40),
                                                  height: ScreenUtil()
                                                      .setHeight(40),
                                                  child:
                                                      const CircularProgressIndicator(
                                                    strokeWidth: 4,
                                                    color: Color(0xFFF8C503),
                                                  ));
                                            }
                                          })
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 23),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: ScreenUtil().setWidth(40),
                                              child: Image.asset(
                                                  'assets/group_1670.png')),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: const Text(
                                              'Google',
                                              style: textProfile,
                                            ),
                                          ),
                                        ],
                                      ),
                                      FutureBuilder(
                                          future: ApiCallsGetData().getData(),
                                          builder: (context,
                                              AsyncSnapshot snapshot) {
                                            var editProfile = snapshot.data;
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return Container(
                                                  child: (editProfile.data
                                                                  .googleId) ==
                                                              'null' ||
                                                          (editProfile.data
                                                                  .googleId) ==
                                                              null
                                                      ? Transform.rotate(
                                                          angle: 3.15,
                                                          child: FlutterSwitch(
                                                              width:
                                                                  ScreenUtil()
                                                                      .setWidth(
                                                                          70),
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          40),
                                                              inactiveColor:
                                                                  const Color(
                                                                      0xFFDEDEDE),
                                                              inactiveToggleColor:
                                                                  const Color(
                                                                      0xFFF0F0F0),
                                                              value:
                                                                  isSwitchGoogle,
                                                              onToggle: (value) =>
                                                                  _onGoogleSignIn()),
                                                        )
                                                      : Transform.rotate(
                                                          angle: 3.15,
                                                          child: FlutterSwitch(
                                                              width:
                                                                  ScreenUtil()
                                                                      .setWidth(
                                                                          70),
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          40),
                                                              activeColor:
                                                                  const Color(
                                                                      0xFFC2ECBD),
                                                              activeToggleColor:
                                                                  const Color(
                                                                      0xFF2AAE1B),
                                                              value:
                                                                  !isSwitchGoogle,
                                                              onToggle: (value) =>
                                                                  _onGoogleSignOut()),
                                                        ));
                                            } else {
                                              return SizedBox(
                                                  width:
                                                      ScreenUtil().setWidth(40),
                                                  height: ScreenUtil()
                                                      .setHeight(40),
                                                  child:
                                                      const CircularProgressIndicator(
                                                    strokeWidth: 4,
                                                    color: Color(0xFFF8C503),
                                                  ));
                                            }
                                          })
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
