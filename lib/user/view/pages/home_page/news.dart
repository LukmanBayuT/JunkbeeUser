import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:junkbee_user/user/constant/constant.dart';

class News extends StatefulWidget {
  final String? url;
  const News({Key? key, @required this.url}) : super(key: key);

  @override
  NewsState createState() => NewsState();
}

class NewsState extends State<News> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF8C503),
          title: const Text(
            'News',
            style: bodyBodyUser,
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 25,
            ),
          ),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  loading = false;
                });
              },
            ),
            loading
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    alignment: Alignment.center,
                    child: const SpinKitPouringHourGlass(
                      color: Color(0xFFF8C503),
                      size: 50,
                    ),
                  )
                : Stack()
          ],
        ));
  }
}
