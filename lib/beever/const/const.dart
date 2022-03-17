import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

////////////////// COLOR /////////////////
const Color mainColor1 = Color(0xff707070);
const Color mainColor2 = Color(0xfff8c503);
const Color maincolor3 = Color(0xff1f1f1f);
const Color maincolor4 = Colors.white;
const Color mainColor5 = Color(0xFF2AAE1B);
const Color mainColor6 = Color(0xFF263238);

////////////// PADDING ///////////////////////////////////
const defaultPaddingHorizontal = EdgeInsets.symmetric(horizontal: 5);
const defaultPaddingS = EdgeInsets.all(4.0);
const defaultPadding0 = EdgeInsets.all(8.0);
const defaultPadding1 = EdgeInsets.all(10);
const defaultPadding2 = EdgeInsets.all(12.0);
const defaultPadding3 = EdgeInsets.all(16.0);
const defaultPadding4 = EdgeInsets.all(20.0);
const defaultPadding5 = EdgeInsets.symmetric(horizontal: 60, vertical: 12);
const defaultPadding6 = EdgeInsets.only(left: 20, right: 20);
const defaultPadding7 = EdgeInsets.symmetric(horizontal: 20);
const defaultPadding8 = EdgeInsets.only(left: 10);
const defaultPadding9 = EdgeInsets.only(left: 40, right: 40);
const defaultPadding10 = EdgeInsets.only(top: 20, left: 40, right: 40);
const defaultPadding11 = EdgeInsets.only(top: 40, left: 40, right: 40);
const defaultPadding12 = EdgeInsets.only(top: 55);

const defaultPaddingOnly0 = EdgeInsets.only(left: 12, right: 12);

//////////////////////// TextStyle /////////////////////////////////////////

const titleBody =
  TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: mainColor1);

const titleBodyMini =
  TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: mainColor1);

const bodyBody =
  TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: mainColor1);

const bodySlimBody =
  TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: mainColor1);

const bodyBoldBody =
  TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: mainColor1);

const textBodyProfile = 
  TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: maincolor4);

const textProfileBold = 
  TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: mainColor1);

const textProfileBoldMini = 
  TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: mainColor1);

const textProfile = 
  TextStyle(fontSize: 16, fontFamily: 'DiodrumCyrillic', color: mainColor1);

const textSemiBold = 
  TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: mainColor1);

const textProfileWhite = 
  TextStyle(fontSize: 16, fontFamily: 'DiodrumCyrillic', color: maincolor4);

const textProfileBoldWhiteMedium = 
  TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: maincolor4);

const textProfileBoldWhite = 
  TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: maincolor4);

const textProfileMediumWhite = 
  TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: maincolor4);

const textProfileMediumGreen = 
  TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mainColor5);

const textProfileBoldColor = 
  TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: mainColor6);

const textProfileSemiBoldYellow = 
  TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: mainColor2);

const textProfileMini = 
  TextStyle(fontSize: 14, fontFamily: 'DiodrumCyrillic', color: mainColor1);

const textProfileMiniGreen = 
  TextStyle(fontSize: 14, fontFamily: 'DiodrumCyrillic', color: mainColor5);

const titleBold = 
  TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: mainColor1);

const onboardingGetStarted = TextStyle(
  fontSize: 21,
  fontWeight: FontWeight.bold,
  color: Color(0xffffffff),
);

const signScreenTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Color(0xff707070),
);

const onboardingTextStyleTitle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
);

const onboardingTextStyleBody = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: Color(0xff707070),
);

const onboardingTextStyleSkipDone = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Color(0xfff8c503),
);

const onboardingTextButton =
    TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
////////////////////////////// Time /////////////////////
const Duration backDuration = Duration(milliseconds: 700);
const Duration onboardingSlideDuration = Duration(milliseconds: 300);

////////////////////////FullHeight///////////////////

var roundedRectBor =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

var roundedRect = BorderRadius.circular(20);

double cubeWidth = 150.0;
double cubeHeight = 100.0;
