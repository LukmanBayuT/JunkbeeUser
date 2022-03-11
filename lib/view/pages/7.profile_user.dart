import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:junkbee_user/constant/constant.dart';
import 'package:junkbee_user/service/api_service/api_calls_get_data.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'My Account',
          style: onboardingGetStarted,
        ),
        centerTitle: true,
        backgroundColor: mainColor2,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1.12,
          child: FutureBuilder(
            future: ApiCallsGetData().getUserData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var userdata = snapshot.data;
                return Stack(
                  children: [
                    Image.asset('assets/heading.png'),
                    Positioned(
                      top: 20,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1,
                        child: Column(
                          children: [
                            Card(
                              shape: roundedRectBor,
                              margin: defaultPadding4,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height:
                                        MediaQuery.of(context).size.height / 7,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Image.asset(
                                          'assets/beever_image.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${userdata?.data.fullName}',
                                              style: bodyBoldBody,
                                            ),
                                            Text(
                                              '${userdata?.data.phone}',
                                              style: bodySlimBody,
                                            ),
                                            Text(
                                              '${userdata?.data.email}',
                                              style: bodySlimBody,
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.draw_rounded,
                                              color: Colors.amber,
                                            ))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: const [
                                      ListTile(
                                        title: Text(
                                          'Saved Location',
                                          style: bodySlimBody,
                                        ),
                                        trailing: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Invite Friends',
                                          style: bodySlimBody,
                                        ),
                                        trailing: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Help Center',
                                          style: bodySlimBody,
                                        ),
                                        trailing: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Setting',
                                          style: bodySlimBody,
                                        ),
                                        trailing: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Share Feedback',
                                          style: bodySlimBody,
                                        ),
                                        trailing: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Privacy Policy',
                                          style: bodySlimBody,
                                        ),
                                        trailing: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Terms of Services',
                                          style: bodySlimBody,
                                        ),
                                        trailing: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Rate us',
                                          style: bodySlimBody,
                                        ),
                                        trailing: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'About App',
                                          style: bodySlimBody,
                                        ),
                                        trailing: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Log Out',
                                          style: bodySlimBody,
                                        ),
                                        trailing: Icon(Icons.logout_outlined),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: SpinKitWave(
                    size: 50,
                    color: mainColor2,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
