// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/view/login_signup/login_screen.dart';
import 'package:http/http.dart' as http;

class SignUpUser extends StatefulWidget {
  const SignUpUser({Key? key}) : super(key: key);

  @override
  _SignUpUserState createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _passwordcont = TextEditingController();
  final TextEditingController _fullnamecont = TextEditingController();
  final TextEditingController _phonenumcont = TextEditingController();

  final SecureStorage secureStorage = SecureStorage();

  bool _obsecureText = true;
  final bool _validate = false;
  bool isChecked = false;

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  // void _registerUser() async {
  //   try {
  //     final response = await http
  //         .post(Uri.parse(EndPoint.baseApiURL + EndPoint.registerURL), body: {
  // 'full_name': _fullnamecont.text.trim(),
  // 'email': _emailcont.text.trim(),
  // 'phone': _phonenumcont.text.trim(),
  // 'password': _passwordcont.text.trim(),
  //     });

  //     if (response.statusCode == 200) {
  //       showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             AlertDialog dialog = AlertDialog(
  //               content:
  //                   const Text('Berhasil membuat akun, silahkan login kembali'),
  //               actions: [
  //                 ElevatedButton(
  //                   style: ElevatedButton.styleFrom(primary: Colors.amber),
  //                   onPressed: () {
  //                     Get.offAll(() => const SignInUser());
  //                   },
  //                   child: Text(
  //                     'Login',
  //                     style: bodySlimBody.copyWith(color: Colors.white),
  //                   ),
  //                 )
  //               ],
  //             );
  //             return dialog;
  //           });
  //       print(response);

  //       ///
  //     } else if (response.statusCode == 400) {
  //       Get.snackbar('Bad Request', 'Bad Request please try again',
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.amber,
  //           colorText: Colors.white,
  //           isDismissible: true,
  //           forwardAnimationCurve: Curves.easeInOutCubicEmphasized,
  //           duration: const Duration(seconds: 1),
  //           margin: const EdgeInsets.only(bottom: 300, left: 20, right: 20),
  //           icon: const Icon(
  //             Icons.error_outlined,
  //             color: Colors.red,
  //           ));
  //     }
  //   } catch (e) {
  //     print('sumthingwong');
  //   }
  // }
  showDialogue() {
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

  void _registerUser() async {
    try {
      final response = await http
          .post(Uri.parse(EndPoint.baseApiURL + EndPoint.registerURL), body: {
        'full_name': _fullnamecont.text.trim(),
        'email': _emailcont.text.trim(),
        'phone': _phonenumcont.text.trim(),
        'password': _passwordcont.text.trim(),
      });
      print(response.body);

      if (response.statusCode == 200) {
        showDialogue();
        // Get.offAll(() => const SignInUser());
      } else if (response.statusCode == 400) {
        Get.snackbar('Bad Request', '${response.body}',
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
        child: SingleChildScrollView(
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already on Junkbee?',
                        style: bodyBody,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignInUser());
                        },
                        child: Text(
                          'Sign In',
                          style: onboardingTextStyleSkipDone.copyWith(
                              fontSize: 18),
                        ),
                      )
                    ],
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
                      controller: _fullnamecont,
                      style: const TextStyle(fontSize: 22),
                      decoration: InputDecoration(
                          labelStyle: signScreenTextStyle,
                          labelText: 'Full Name',
                          errorText:
                              (_validate) ? "Name cannot be empty" : null),
                    ),
                  ),
                  Padding(
                    padding: defaultPadding5,
                    child: TextFormField(
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
                    padding: defaultPadding5,
                    child: TextFormField(
                      controller: _emailcont,
                      style: const TextStyle(fontSize: 22),
                      decoration: InputDecoration(
                          labelStyle: signScreenTextStyle,
                          labelText: 'Email',
                          errorText:
                              (_validate) ? "Username cannot be empty" : null),
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
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
                        style: bodySlimBody,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: MediaQuery.of(context).size.height / 15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary:
                            (isChecked == true) ? Colors.amber : Colors.grey,
                        shape: roundedRectBor),
                    child: const Text('Sign Up', style: onboardingGetStarted),
                    onPressed: () {
                      (isChecked == true) ? _registerUser() : null;
                    },
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
