// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_const_constructors_in_immutables, await_only_futures

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:junkbee_user/user/service/storage/secure_storage.dart';
import 'package:junkbee_user/user/constant/base_url.dart';
import 'package:junkbee_user/user/constant/constant.dart';

final SecureStorage secureStorage = SecureStorage();

class EditProfile extends StatefulWidget {
  final dynamic image;
  final String? name;
  final String? phone;
  final String? email;
  EditProfile({Key? key, this.image, this.name, this.phone, this.email})
      : super(key: key);

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
          'full_name': name.text,
          'phone': phone_number.text,
          'email': email.text,
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

  _onWillPop() async {
    Navigator.pop(context, 'back');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onWillPop(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFF8C503),
              title: const Text('Edit Profile', style: bodyBodyUserBold),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context, 'back'),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white),
              ),
              actions: [
                Container(
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => updateData(),
                      child: const Text('Save', style: bodyBodyWhite),
                    ))
              ],
            ),
            body: SingleChildScrollView(
                child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              child: Stack(children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: widget.image == null
                                  ? Image.asset('assets/beever_image.png',
                                      width: MediaQuery.of(context).size.width /
                                          4.5)
                                  : Image.network(
                                      '${widget.image}',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    )),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () => takePhoto(),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF8C503),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Image.asset('assets/group_1666.png',
                                      width: MediaQuery.of(context).size.width /
                                          25),
                                ),
                              ))
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
                            hintStyle: bodyBody),
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
                            hintText: '123456789', hintStyle: bodyBody),
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
                            hintStyle: bodyBody),
                      ),
                    )
                  ],
                )
              ]),
            ))));
  }
}
