import 'package:flutter/cupertino.dart';

class NavBarKey {
  NavBarKey._();
  static final GlobalKey _key = GlobalKey();
  static GlobalKey getKey() => _key;
}
