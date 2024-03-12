import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Screen {
  double getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  double getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  bool isWeb = kIsWeb;
}
