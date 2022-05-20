// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';

class AddBankAccount extends StatefulWidget {
  const AddBankAccount({Key? key}) : super(key: key);

  @override
  AddBankAccountState createState() => AddBankAccountState();
}

class AddBankAccountState extends State<AddBankAccount> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Bank Account',
          style: textBodyProfile,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF8C503),
        leading: TouchableOpacity(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(top: 40),
            width: ScreenUtil().setWidth(480),
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: ScreenUtil().setWidth(400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bank Name',
                    style: textProfile,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: TextFormField(
                        style: textProfile,
                        decoration: const InputDecoration(
                            hintText: 'BCA', hintStyle: textProfile),
                      )),
                  const Text(
                    'Your Account',
                    style: textProfile,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: TextFormField(
                        style: textProfile,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: 'Account Number', hintStyle: textProfile),
                      )),
                  const Text(
                    'Alias',
                    style: textProfile,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: TextFormField(
                        style: textProfile,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                            hintText: 'Your Name', hintStyle: textProfile),
                      )),
                  Container(
                    padding: const EdgeInsets.only(top: 200),
                    child: TouchableOpacity(
                        // ignore: avoid_print
                        onTap: () => print('add bank account'),
                        child: Container(
                          width: ScreenUtil().setWidth(400),
                          height: ScreenUtil().setHeight(75),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF8C503),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    spreadRadius: 0.0,
                                    offset: Offset(0, 1))
                              ]),
                          child: const Text(
                            'Continue',
                            style: textBodyProfile,
                          ),
                        )),
                  )
                ],
              ),
            )),
      ),
    );
    // return ScreenUtilInit(
    //     designSize: const Size(480, 904),
    //     builder: (_) => );
  }
}
