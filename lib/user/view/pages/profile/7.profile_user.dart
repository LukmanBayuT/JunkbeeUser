// ignore_for_file: avoid_init_to_null, non_constant_identifier_names, unnecessary_const

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:junkbee_user/user/constant/constant.dart';
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_get_data.dart';
import 'package:junkbee_user/user/view/login_signup/login_screen.dart';

final SecureStorage secureStorage = SecureStorage();

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  dynamic token_local = null;

  @override
  void initState() {
    super.initState();

    checkToken();
  }

  checkToken() async {
    var authToken = await secureStorage.readSecureData('token');
    var token = authToken;
    setState(() {
      token_local = token;
    });
    if (token != null) {
      getRole(token);
      await ApiCallsGetData().getUserData();
      setState(() {});
    }
  }

  getRole(token) async {
    final userData = await http.get(
      Uri.parse(EndPoint.baseApiURL + EndPoint.getUserData),
      headers: {'Authorization': 'Bearer $token'}
    );
    Map<String, dynamic> bodyJSON = jsonDecode(userData.body);
    var role = bodyJSON['data']['role'];
    await secureStorage.writeSecureData('role', role);
  }

  logOut() async {
    await secureStorage.deleteAllSecureData();
    await checkToken();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 30,
                color: Colors.amberAccent,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.5,
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(image: DecorationImage(image: const AssetImage('assets/heading.png'), fit: BoxFit.cover)),
                child: Container(
                  padding: const EdgeInsets.only(top: 25),
                  child: const Text('My Account', style: bodyBodyUser,)
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0, -85, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1,
                  child: Column(
                    children: [
                      Card(
                        shape: roundedRectBor,
                        margin: defaultPadding4,
                        child: Column(
                          children: [
                            if (token_local == null) ...[
                              Container(
                                padding: const EdgeInsets.only(top: 20),
                                child: GestureDetector(
                                  onTap: () async {
                                    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInUser()));
                                    if (result == 'back') {
                                      await checkToken();
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    height: MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: const LinearGradient(colors: [const Color(0xFFF8C503), const Color(0xFFFFE067)])
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text('Login / Register', style: bodyBodyUserMini,),
                                  ),
                                )
                              )
                            ] else ...[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1,
                                height: MediaQuery.of(context).size.height / 7,
                                child: FutureBuilder(
                                  future: ApiCallsGetData().getUserData(),
                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      var userdata = snapshot.data;
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/beever_image.png', width: MediaQuery.of(context).size.width / 5),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('${userdata?.data.fullName}', style: bodyBoldBody),
                                              Text('${userdata?.data.phone}', style: bodySlimBody),
                                              Text('${userdata?.data.email}', style: bodySlimBody),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.draw_rounded, color: Colors.amber))
                                        ],
                                      );
                                    } else {
                                      return const Center(child: SpinKitWave(size: 50, color: mainColor2));
                                    }
                                  },
                                ),
                              )
                            ],
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                const ListTile(
                                  title: Text('Saved Location', style: bodySlimBody),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                                ),
                                const ListTile(
                                  title: Text('Invite Friends', style: bodySlimBody),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                                ),
                                const ListTile(
                                  title: Text('Help Center', style: bodySlimBody),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                                ),
                                const ListTile(
                                  title: Text('Setting', style: bodySlimBody),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                                ),
                                const ListTile(
                                  title: Text('Share Feedback', style: bodySlimBody),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                                ),
                                const ListTile(
                                  title: Text('Privacy Policy', style: bodySlimBody),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                                ),
                                const ListTile(
                                  title: Text('Terms of Services', style: bodySlimBody),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                                ),
                                const ListTile(
                                  title: Text('Rate us', style: bodySlimBody),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                                ),
                                const ListTile(
                                  title: Text('About App', style: bodySlimBody),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                                ),
                                if (token_local != null) ...[
                                  GestureDetector(
                                    onTap: () => logOut(),
                                    child: const ListTile(
                                      title: Text('Log Out', style: bodySlimBody),
                                      trailing: Icon(Icons.logout_outlined, size: 20,),
                                    )
                                  )
                                ]
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
