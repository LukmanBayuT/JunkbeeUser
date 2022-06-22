// ignore_for_file: avoid_print, unnecessary_string_interpolations, unused_import, empty_catches

import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:junkbee_user/beever/widgets/home/show_notification.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/view/login_signup/login_screen.dart';
import 'package:junkbee_user/user/view/pages/0.navigator.dart';

class SignUpUser extends StatefulWidget {
  const SignUpUser({Key? key}) : super(key: key);

  @override
  SignUpUserState createState() => SignUpUserState();
}

class SignUpUserState extends State<SignUpUser> {
  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _passwordcont = TextEditingController();
  final TextEditingController _fullnamecont = TextEditingController();
  final TextEditingController _phonenumcont = TextEditingController();

  final SecureStorage secureStorage = SecureStorage();

  bool loading = false;
  bool _obsecureText = true;
  final bool _validate = false;
  bool isChecked = false;

  var email = false.obs;

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  void _registerUser() async {
    setState(() => loading = true);
    try {
      final response = await http
          .post(Uri.parse(EndPoint.baseApiURL + EndPoint.registerURL), body: {
        'full_name': _fullnamecont.text.trim(),
        'email': _emailcont.text.trim(),
        'phone': _phonenumcont.text.trim(),
        'password': _passwordcont.text.trim(),
      });

      if (response.statusCode == 200) {
        setState(() => loading = false);
        Fluttertoast.showToast(
            msg: 'Berhasil membuat akun, silahkan login kembali',
            toastLength: Toast.LENGTH_LONG);
        // Navigator.pop(context);
        Get.back();
      } else if (response.statusCode == 400) {
        setState(() => loading = false);

        // ignore: use_build_context_synchronously
        ShowNotification().showErrorSignUp(context);
      }
    } catch (e) {
      setState(() => loading = false);
      print('sumthingwong');
    }
  }

  void displayMessage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          AlertDialog dialog = AlertDialog(
            content:
                const Text('Berhasil membuat akun, silahkan login kembali'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.amber),
                onPressed: () {
                  Get.offAll(() => const SignInUser());
                },
                child: Text(
                  'Login',
                  style: bodySlimBody.copyWith(color: Colors.white),
                ),
              )
            ],
          );
          return dialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets_signscreen/logo.png',
                          height: MediaQuery.of(context).size.height / 7,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already on Junkbee?', style: bodyBody),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text('Sign In',
                                  style: onboardingTextStyleSkipDone.copyWith(
                                      fontSize: 18)),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    Column(
                      children: [
                        Padding(
                          padding: defaultPadding10,
                          child: TextFormField(
                            controller: _fullnamecont,
                            style: const TextStyle(fontSize: 22),
                            decoration: InputDecoration(
                                labelStyle: signScreenTextStyle,
                                labelText: 'Full Name',
                                errorText: (_validate)
                                    ? "Name cannot be empty"
                                    : null),
                          ),
                        ),
                        Padding(
                          padding: defaultPadding10,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _phonenumcont,
                            style: const TextStyle(fontSize: 22),
                            decoration: InputDecoration(
                                labelStyle: signScreenTextStyle,
                                labelText: 'Phone Number',
                                errorText: (_validate)
                                    ? "Phone number cannot be empty"
                                    : null),
                          ),
                        ),
                        Padding(
                          padding: defaultPadding10,
                          child: Obx(() => TextFormField(
                                onChanged: (asd) {
                                  if (EmailValidator.validate(asd)) {
                                    email(true);
                                  } else {
                                    email(false);
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailcont,
                                style: const TextStyle(fontSize: 22),
                                decoration: const InputDecoration(
                                  labelStyle: signScreenTextStyle,
                                  labelText: 'Email',
                                ),
                              )),
                        ),
                        Padding(
                          padding: defaultPadding10,
                          child: TextFormField(
                            controller: _passwordcont,
                            style: const TextStyle(fontSize: 22),
                            obscureText: (_obsecureText) ? true : false,
                            decoration: InputDecoration(
                                labelStyle: signScreenTextStyle,
                                labelText: 'Password',
                                errorText: (_validate)
                                    ? "Password Cannot be Empty"
                                    : null,
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
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Row(
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.7,
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text(
                                'I agree with terms conditions and privacy policy',
                                style: bodySlimBody),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        height: MediaQuery.of(context).size.height / 13,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: (isChecked == true)
                                  ? Colors.amber
                                  : Colors.grey,
                              shape: roundedRectBor),
                          child: const Text('Sign Up',
                              style: onboardingGetStarted),
                          onPressed: () {
                            (isChecked == true && email == true)
                                ? _registerUser()
                                : null;
                          },
                        ))
                  ],
                ),
              ),
              (loading)
                  ? Container(
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                      alignment: Alignment.center,
                      child: Lottie.asset("assets/animation/bee_loading.json",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          animate: true))
                  : Container()
            ],
          )),
    );
  }
}
