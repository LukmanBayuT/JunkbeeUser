// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:junkbee_user/beever/const/base_url.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/service/secure_storage.dart';
import 'package:junkbee_user/beever/widgets/sign_in_widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:junkbee_user/beever/views/pages/0.navigator.dart';

class SignInDriver extends StatefulWidget {
  const SignInDriver({Key? key}) : super(key: key);

  @override
  State<SignInDriver> createState() => _SignInDriverState();
}

class _SignInDriverState extends State<SignInDriver> {
  final TextEditingController _logincont = TextEditingController();
  final TextEditingController _passwordcont = TextEditingController();

  bool loading = false;
  bool _obsecureText = true;
  bool _validate = false;

  final SecureStorage secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();
    getDeviceToken();
  }

  getDeviceToken() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyDUQzGA_M5A5icZARIG16wGh06Mpj54KkM',
            appId: '1:359679760003:android:2c6050331a3d3c6b2dadb6',
            messagingSenderId: '359679760003',
            projectId: 'junkbee-7f763'));
    FirebaseMessaging.instance
        .getToken()
        .then((deviceToken) => print(deviceToken));
  }

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  void _loginDriver() async {
    setState(() => loading = true);
    await secureStorage.deleteAllSecureData();
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyDUQzGA_M5A5icZARIG16wGh06Mpj54KkM',
              appId: '1:359679760003:android:2c6050331a3d3c6b2dadb6',
              messagingSenderId: '359679760003',
              projectId: 'junkbee-7f763'));
      FirebaseMessaging.instance.getToken().then((deviceToken) async {
        final response = await http
            .post(Uri.parse(EndPoint.baseApiURL + EndPoint.loginURL), body: {
          'email': _logincont.text.trim(),
          'password': _passwordcont.text.trim(),
        });
        Map<String, dynamic> output = jsonDecode(response.body);
        if (output['message'] == 'login success') {
          await secureStorage.writeSecureData('token', output['data']['token']);

          final resp = await http.put(
              Uri.parse(EndPoint.baseApiURL + EndPoint.deviceToken),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ${output['data']['token']}'
              },
              body: json.encode({'device_token': deviceToken}));
          Map<String, dynamic> updateDeviceToken = jsonDecode(resp.body);
          if (updateDeviceToken['message'] == 'data has been updated') {
            setState(() => loading = false);
            Get.offAll(() => const NavigatorPages());
          }
        } else {
          var errorMessage = output['message'];
          setState(() => loading = false);
          Get.defaultDialog(
              textCancel: 'Ok',
              middleText: errorMessage,
              title: 'Please Try Again');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
          body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
              child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const LogoType(),
                  Column(
                    children: [
                      Padding(
                        padding: defaultPadding9,
                        child: TextFormField(
                          controller: _logincont,
                          keyboardType: TextInputType.emailAddress,
                          style: signScreenTextStyle,
                          decoration: InputDecoration(
                              labelStyle: signScreenTextStyle,
                              labelText: 'Phone Number or Email',
                              errorText: (_validate)
                                  ? "Username cannot be empty"
                                  : null),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: defaultPadding9,
                        child: TextFormField(
                          controller: _passwordcont,
                          style: signScreenTextStyle,
                          obscureText: (_obsecureText) ? true : false,
                          decoration: InputDecoration(
                              labelStyle: signScreenTextStyle,
                              labelText: 'Password',
                              errorText: (_validate)
                                  ? "Password Cannot be Empty"
                                  : null,
                              suffixIcon: IconButton(
                                  onPressed: () => _toggle(),
                                  icon: Icon((_obsecureText)
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                        ),
                      ),
                      const ForgotPassword(),
                      const SizedBox(height: 20),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1,
                          height: MediaQuery.of(context).size.height / 13,
                          child: Padding(
                            padding: defaultPadding9,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_logincont.text.isEmpty) {
                                  setState(() => _validate = true);
                                } else {
                                  setState(() => _validate = false);
                                  _loginDriver();
                                }
                              },
                              child: const Text('Sign In',
                                  style: onboardingTextButton),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          )),
                    ],
                  ),
                  const BecomeABeever()
                ],
              ),
              Container(
                color: Colors.transparent,
                child: (loading)
                    ? Container(
                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                        alignment: Alignment.center,
                        child: Lottie.asset("assets/animation/booble.json",
                            width: 250,
                            height: MediaQuery.of(context).size.height * 1,
                            animate: true))
                    : null,
              )
            ],
          )),
        ),
      )),
    );
  }
}
