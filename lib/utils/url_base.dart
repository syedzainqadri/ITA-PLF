
import 'package:flutter/foundation.dart';

class UrlBase{
  static String get baseWebURL {
    if (kReleaseMode) {
      return "https://childrensliteraturefestival.com";
    } else {
      return "https://childrensliteraturefestival.com";
    }
  }

  static String get buttonURL {
    if (kReleaseMode) {
      return "https://childrensliteraturefestival.com/clf_karachi_2021";
    } else {
      return "https://childrensliteraturefestival.com/clf_karachi_2021";
    }
  }


}