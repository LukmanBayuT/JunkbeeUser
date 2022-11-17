// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:junkbee_user/user/constant/constant.dart';

class EditProfile extends StatefulWidget{
  final dynamic image;
  final String? name;
  final String? phone;
  final String? email;
  EditProfile({Key? key, @required this.image, @required this.name, @required this.phone, @required this.email}) : super(key: key);

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController phone_number = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.name != null || widget.phone != null || widget.email != null) {
      name.text = widget.name!;
      phone_number.text = widget.phone!;
      email.text = widget.email!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8C503),
        title: const Text('Edit Profile', style: bodyBodyUserBold),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: (() => print('save')),
              child: const Text('Save', style: bodyBodyWhite),
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: widget.image == null ? Image.asset('assets/ellipse_302.png',
                            width: MediaQuery.of(context).size.width / 4.5
                          ) : Image.network('${widget.image}',
                            width: MediaQuery.of(context).size.width / 4.5,
                            fit: BoxFit.cover,
                          )
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => print('take photo'),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 13,
                              height: MediaQuery.of(context).size.height / 24,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: const Color(0xFFF8C503), borderRadius: BorderRadius.circular(30)),
                              child: Image.asset('assets/group_1666.png', width: MediaQuery.of(context).size.width / 25),
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 50),
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: const Text('Your Name', style: bodyBody),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: TextFormField(
                      controller: name,
                      style: bodyBody,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: 'Joko Widodo Sudirjo',
                        hintStyle: bodyBody
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: const Text('Mobile Number', style: bodyBody),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: TextFormField(
                      controller: phone_number,
                      style: bodyBody,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: '123456789',
                        hintStyle: bodyBody
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: const Text('Email Address', style: bodyBody),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: TextFormField(
                      controller: email,
                      style: bodyBody,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: 'example@example.com',
                        hintStyle: bodyBody
                      ),
                    ),
                  )
                ],
              )
            ]
          ),
        )
      )
    );
  }
}