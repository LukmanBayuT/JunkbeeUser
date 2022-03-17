import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';

class AddBankAccount extends StatefulWidget {
  const AddBankAccount({Key? key}) : super(key: key);

  _AddBankAccountState createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(480, 904),
      builder: () => Scaffold(
        appBar: AppBar(
          title: Text('Add Bank Account', style: textBodyProfile,),
          centerTitle: true,
          backgroundColor: Color(0xFFF8C503),
          leading: TouchableOpacity(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_new_rounded)
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 40),
            width: ScreenUtil().setWidth(480),
            alignment: Alignment.topCenter,
            child: Container(
              width: ScreenUtil().setWidth(400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bank Name', style: textProfile,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: TextFormField(
                      style: textProfile,
                      decoration: InputDecoration(
                        hintText: 'BCA',
                        hintStyle: textProfile
                      ),
                    )
                  ),

                  Text('Your Account', style: textProfile,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: TextFormField(
                      style: textProfile,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Account Number',
                        hintStyle: textProfile
                      ),
                    )
                  ),

                  Text('Alias', style: textProfile,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: TextFormField(
                      style: textProfile,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Your Name',
                        hintStyle: textProfile
                      ),
                    )
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 200),
                    child: TouchableOpacity(
                      onTap: () => print('add bank account'),
                      child: Container(
                        width: ScreenUtil().setWidth(400),
                        height: ScreenUtil().setHeight(75),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8C503),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0.0, offset: Offset(0, 1))]
                        ),
                        child: Text('Continue', style: textBodyProfile,),
                      )
                    ),
                  )
                ],
              ),
            )
          ),
        ),
      )
    );
  }
}