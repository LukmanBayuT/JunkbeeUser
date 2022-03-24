import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatelessWidget {
  final String? url;
  const NewsScreen({Key? key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(480, 904),
        builder: () => Scaffold(
              appBar: AppBar(
                title: const Text('News', style: textBodyProfile),
                centerTitle: true,
                backgroundColor: const Color(0xFFF8C503),
                leading: TouchableOpacity(
                    onTap: () => Navigator.pop(context),
                    child:
                        const Icon(Icons.arrow_back_ios_new_rounded, size: 25)),
              ),
              body: WebView(initialUrl: url),
            ));
  }
}
