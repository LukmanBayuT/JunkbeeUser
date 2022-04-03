// ignore_for_file: unnecessary_const, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/base_url.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/service/api_calls_get_data.dart';
import 'package:junkbee_user/beever/widgets/profile/profile_widget.dart';
import 'editProfile.dart';

class BeeverProfile extends StatefulWidget {
  const BeeverProfile({Key? key}) : super(key: key);

  @override
  _BeeverProfileState createState() => _BeeverProfileState();
}

class _BeeverProfileState extends State<BeeverProfile> {
  @override
  void initState() {
    super.initState();
    ApiCallsGetData().getData();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(480, 904),
        builder: () => Scaffold(
              body: SingleChildScrollView(
                  child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(480),
                        height: ScreenUtil().setHeight(230),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/heading.png'),
                                fit: BoxFit.fill)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [const ProfileWidget(), text(context)],
                        ),
                      ),
                      Container(
                          transform: Matrix4.translationValues(0.0, -80.0, 0.0),
                          padding: const EdgeInsets.only(bottom: 40),
                          width: ScreenUtil().setWidth(480),
                          alignment: Alignment.topCenter,
                          child: Container(
                              padding: const EdgeInsets.only(top: 15),
                              width: ScreenUtil().setWidth(400),
                              alignment: Alignment.topCenter,
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
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: ScreenUtil().setWidth(380),
                                      child: FutureBuilder(
                                          future: ApiCallsGetData().getData(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot) {
                                            var account = snapshot.data;

                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80),
                                                    child: account.data.image ==
                                                            null
                                                        ? Image.asset(
                                                            'assets/beever_image.png',
                                                            width: ScreenUtil()
                                                                .setWidth(80),
                                                            height: ScreenUtil()
                                                                .setHeight(80),
                                                          )
                                                        : Image.network(
                                                            '${EndPoint.baseURL}storage/profile-images/${account.data.image}',
                                                            width: ScreenUtil()
                                                                .setWidth(80),
                                                            height: ScreenUtil()
                                                                .setHeight(80),
                                                            fit: BoxFit.cover),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    width: ScreenUtil()
                                                        .setWidth(270),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                            width: ScreenUtil()
                                                                .setWidth(270),
                                                            child: Text(
                                                                '${account.data.fullName}',
                                                                style:
                                                                    textProfileBoldMini,
                                                                maxLines: 1)),
                                                        Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 3),
                                                            width: ScreenUtil()
                                                                .setWidth(270),
                                                            child: Text(
                                                                '${account.data.phone}',
                                                                style:
                                                                    textProfile)),
                                                        Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 1),
                                                            width: ScreenUtil()
                                                                .setWidth(270),
                                                            child: Text(
                                                                '${account.data.email}',
                                                                style:
                                                                    textProfile))
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    width: ScreenUtil()
                                                        .setWidth(30),
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: TouchableOpacity(
                                                        onTap: () async {
                                                          if (account
                                                                  .data.image ==
                                                              null) {
                                                            final imageURL =
                                                                null;
                                                            final result = await Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => EditProfile(
                                                                        image:
                                                                            imageURL,
                                                                        name: account
                                                                            .data
                                                                            .fullName,
                                                                        phone: account
                                                                            .data
                                                                            .phone,
                                                                        email: account
                                                                            .data
                                                                            .email)));
                                                            if (result ==
                                                                'back') {
                                                              await ApiCallsGetData()
                                                                  .getData();
                                                              setState(() {});
                                                            }
                                                          } else {
                                                            final imageURL = EndPoint
                                                                    .baseURL +
                                                                'storage/profile-images/' +
                                                                account
                                                                    .data.image;
                                                            final result = await Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => EditProfile(
                                                                        image:
                                                                            imageURL,
                                                                        name: account
                                                                            .data
                                                                            .fullName,
                                                                        phone: account
                                                                            .data
                                                                            .phone,
                                                                        email: account
                                                                            .data
                                                                            .email)));
                                                            if (result ==
                                                                'back') {
                                                              await ApiCallsGetData()
                                                                  .getData();
                                                              setState(() {});
                                                            }
                                                          }
                                                        },
                                                        child: Image.asset(
                                                          'assets/edit_svgrepo_com.png',
                                                          width: ScreenUtil()
                                                              .setWidth(25),
                                                          height: ScreenUtil()
                                                              .setHeight(25),
                                                        )),
                                                  )
                                                ],
                                              );
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 4,
                                                  backgroundColor: Colors.amber,
                                                ),
                                              );
                                            }
                                          })),
                                  infoAccount(context)
                                ],
                              )))
                    ],
                  )
                ],
              )),
            ));
  }
}
