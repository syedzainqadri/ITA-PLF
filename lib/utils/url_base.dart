import 'package:flutter/foundation.dart';

class UrlBase {
  static String get baseWebURL {
    if (kReleaseMode) {
      return "https://pakistanlearningfestival.com";
    } else {
      return "https://pakistanlearningfestival.com";
    }
  }

  static String get buttonURL {
    if (kReleaseMode) {
      return "https://pakistanlearningfestival.com/clf_karachi_2021";
    } else {
      return "https://pakistanlearningfestival.com/clf_karachi_2021";
    }
  }
}
