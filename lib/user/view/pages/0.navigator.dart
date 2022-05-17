import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_user_permission.dart';
import 'package:junkbee_user/user/view/pages/home_page/homepages.dart';
import 'package:junkbee_user/user/view/pages/collection_status/collection_status_active.dart';
import 'package:junkbee_user/user/view/pages/order_process/user_order_processed.dart';
import 'package:junkbee_user/user/view/pages/message/messages_chat.dart';
import 'package:junkbee_user/user/view/pages/profile/profile_user.dart';

class NavigatorUser extends StatefulWidget {
  const NavigatorUser({Key? key}) : super(key: key);

  @override
  NavigatorUserState createState() => NavigatorUserState();
}

class NavigatorUserState extends State<NavigatorUser> {
  DateTime timeBackPressed = DateTime.now();
  @override
  void initState() {
    super.initState();
    PermissionHandler().listenForPermission();
  }

  final navKey = GlobalKey<CurvedNavigationBarState>();

  int index = 0;

  var pagesUser = [
    const HomepagesUser(),
    const CollectionStatusUser(),
    const UserOrder(),
    const UserMessages(),
    const UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= const Duration(seconds: 2);
          timeBackPressed = DateTime.now();
          if (isExitWarning) {
            Fluttertoast.showToast(
                msg: 'Tekan lagi untuk keluar',
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: const Color(0xFFF8C503));
            return false;
          } else {
            Fluttertoast.cancel();
            return true;
          }
        },
        child: ClipRRect(
          child: Scaffold(
            extendBody: true,
            bottomNavigationBar: CurvedNavigationBar(
              animationDuration: const Duration(milliseconds: 500),
              height: 50,
              key: navKey,
              animationCurve: Curves.easeInOutExpo,
              backgroundColor: Colors.transparent,
              index: index,
              items: [
                Image.asset(
                  (index == 0)
                      ? 'icons/icons_button/hm.png'
                      : 'icons/icons_button/hmx.png',
                  width: 25,
                  height: 25,
                ),
                Image.asset(
                  (index == 1)
                      ? 'icons/icons_button/cbx.png'
                      : 'icons/icons_button/cb.png',
                  width: 25,
                  height: 25,
                ),
                Image.asset(
                  (index == 2)
                      ? 'icons/icons_button/ob.png'
                      : 'icons/icons_button/ob.png',
                  width: 50,
                  height: 50,
                ),
                Image.asset(
                  (index == 3)
                      ? 'icons/icons_button/ibx.png'
                      : 'icons/icons_button/ib.png',
                  width: 25,
                  height: 25,
                ),
                Image.asset(
                  (index == 4)
                      ? 'icons/icons_button/prx.png'
                      : 'icons/icons_button/pr.png',
                  width: 25,
                  height: 25,
                ),
              ],
              onTap: (index) => setState(() {
                this.index = index;
              }),
            ),
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: pagesUser[index]),
          ),
        ));
  }
}
