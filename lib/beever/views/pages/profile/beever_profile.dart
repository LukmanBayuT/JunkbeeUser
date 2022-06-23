// ignore_for_file: unnecessary_const, prefer_const_declarations, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/base_url.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/service/api_calls_get_data.dart';
import 'package:junkbee_user/beever/widgets/profile/profile_widget.dart';
import 'editProfile.dart';

class BeeverProfile extends StatefulWidget {
  const BeeverProfile({Key? key}) : super(key: key);

  @override
  BeeverProfileState createState() => BeeverProfileState();
}

class BeeverProfileState extends State<BeeverProfile> {
  @override
  void initState() {
    super.initState();
    ApiCallsGetDataBeever().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(alignment: Alignment.topCenter, children: [
      Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 230,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/heading.png'), fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [const ProfileWidget(), text(context)],
          ),
        ),
        Container(
            transform: Matrix4.translationValues(0.0, -80.0, 0.0),
            padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
            child: Container(
                padding: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          spreadRadius: 0.0,
                          offset: const Offset(0, 1))
                    ]),
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: FutureBuilder(
                          future: ApiCallsGetDataBeever().getData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            var account = snapshot.data;

                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                          width: 80,
                                          height: 80,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(80),
                                              child: account.data.image == null
                                                  ? Image.asset(
                                                      'assets/beever_image.png')
                                                  : Image.network(
                                                      '${EndPoint.baseURL}storage/profile-images/${account.data.image}',
                                                      fit: BoxFit.cover))),
                                      Container(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('${account.data.fullName}',
                                                    style: textProfileBoldMini,
                                                    maxLines: 1),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 3),
                                                    child: Text(
                                                        '${account.data.phone}',
                                                        style: textProfile)),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 1),
                                                    child: Text(
                                                        '${account.data.email}',
                                                        style: textProfile))
                                              ]))
                                    ]),
                                    Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: TouchableOpacity(
                                            onTap: () async {
                                              if (account.data.image == null) {
                                                final imageURL = null;
                                                final result = await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditProfile(
                                                                image: imageURL,
                                                                name: account
                                                                    .data
                                                                    .fullName,
                                                                phone: account
                                                                    .data.phone,
                                                                email: account
                                                                    .data
                                                                    .email)));
                                                if (result == 'back') {
                                                  await ApiCallsGetDataBeever()
                                                      .getData();
                                                  setState(() {});
                                                }
                                              } else {
                                                final imageURL =
                                                    '${EndPoint.baseURL}storage/profile-images/${account.data.image}';
                                                final result = await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditProfile(
                                                                image: imageURL,
                                                                name: account
                                                                    .data
                                                                    .fullName,
                                                                phone: account
                                                                    .data.phone,
                                                                email: account
                                                                    .data
                                                                    .email)));
                                                if (result == 'back') {
                                                  await ApiCallsGetDataBeever()
                                                      .getData();
                                                  setState(() {});
                                                }
                                              }
                                            },
                                            child: Image.asset(
                                                'assets/edit_svgrepo_com.png',
                                                width: 25)))
                                  ]);
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator(
                                      strokeWidth: 4,
                                      backgroundColor: Colors.amber));
                            }
                          })),
                  infoAccount(context)
                ])))
      ])
    ])));
  }
}
