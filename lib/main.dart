import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
<<<<<<< Updated upstream
import 'package:junkbee_user/view/splashscreen/1.%20onboarding_splash_screen.dart';
import 'package:junkbee_user/view/pages/0.navigator.dart';
=======
import 'package:junkbee_user/user/view/splashscreen/1.%20onboarding_splash_screen.dart';
>>>>>>> Stashed changes

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'DiodrumCyrillic',
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Color(0xff707070)),
      ),
      home: const NavigatorUser(),
    );
  }
}
