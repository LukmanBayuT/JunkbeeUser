import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:junkbee_user/user/view/pages/home_page/1.homepages.dart';
import 'package:junkbee_user/user/view/pages/collection_status/2.collection_status_active.dart';
import 'package:junkbee_user/user/view/pages/order_process/4.user_order_processed.dart';
import 'package:junkbee_user/user/view/pages/message/5.messages_chat.dart';
import 'package:junkbee_user/user/view/pages/profile/7.profile_user.dart';

class NavigatorUser extends StatefulWidget {
  const NavigatorUser({Key? key}) : super(key: key);

  @override
  _NavigatorUserState createState() => _NavigatorUserState();
}

class _NavigatorUserState extends State<NavigatorUser> {
  @override
  void initState() {
    super.initState();
  }

  final navKey = GlobalKey<CurvedNavigationBarState>();

  int index = 0;

  var pagesUser = [
    const HomepagesUser(),
    const CollectionStatusUser(),
    UserOrder(),
    const UserMessages(),
    const UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}
