// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/view/login_signup/signup_screen.dart';
import 'package:http/http.dart' as http;
import 'package:junkbee_user/user/view/pages/0.navigator.dart';

class SignInUser extends StatefulWidget {
  const SignInUser({Key? key}) : super(key: key);

  @override
  _SignInUserState createState() => _SignInUserState();
}

class _SignInUserState extends State<SignInUser> {
  final TextEditingController _logincont = TextEditingController();
  final TextEditingController _passwordcont = TextEditingController();

  bool _obsecureText = true;
  final bool _validate = false;

  final SecureStorage secureStorage = SecureStorage();

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  void _loginUser() async {
    try {
      final response = await http
          .post(Uri.parse(EndPoint.baseApiURL + EndPoint.loginURL), body: {
        'email': _logincont.text.trim(),
        'password': _passwordcont.text.trim(),
      });
      String? fcmToken = await FirebaseMessaging.instance.getToken();

      if (response.statusCode == 200) {
        Map<String, dynamic> output = jsonDecode(response.body);
        var authToken = output['data']['token'];
        await secureStorage.writeSecureData('token', authToken);
        await secureStorage.writeSecureData('fcmToken', fcmToken!);
        print(authToken);
        print(fcmToken);

        Get.offAll(() => const NavigatorUser());
      } else {
        Map<String, dynamic> output = jsonDecode(response.body);
        var errorMessage = output['message'];
        Get.defaultDialog(
            textCancel: 'Ok',
            middleText: errorMessage,
            title: 'Please Try Again');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets_signscreen/logo.png',
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    const Text(
                      'User App',
                      style: onboardingTextStyleSkipDone,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: defaultPadding5,
                      child: TextFormField(
                        controller: _logincont,
                        style: const TextStyle(fontSize: 22),
                        decoration: InputDecoration(
                            labelStyle: signScreenTextStyle,
                            labelText: 'Email',
                            errorText: (_validate)
                                ? "Username cannot be empty"
                                : null),
                      ),
                    ),
                    Padding(
                      padding: defaultPadding5,
                      child: TextFormField(
                        controller: _passwordcont,
                        style: const TextStyle(fontSize: 22),
                        obscureText: (_obsecureText) ? true : false,
                        decoration: InputDecoration(
                            labelStyle: signScreenTextStyle,
                            labelText: 'Password',
                            errorText:
                                (_validate) ? "Password Cannot be Empty" : null,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _toggle();
                                },
                                icon: Icon((_obsecureText)
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: defaultPadding5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      const Text(
                        'Forgot Password?',
                        style: signScreenTextStyle,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: MediaQuery.of(context).size.height / 15,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.amber, shape: roundedRectBor),
                      child: const Text('Login', style: onboardingGetStarted),
                      onPressed: () {
                        _loginUser();
                      },
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets_signscreen/google_icon.png',
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Image.asset(
                      'assets_signscreen/facebook_icon.png',
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Dont have account yet?',
                      style: signScreenTextStyle,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignUpUser());
                      },
                      child: const Text(
                        'Sign Up',
                        style: onboardingTextStyleSkipDone,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
