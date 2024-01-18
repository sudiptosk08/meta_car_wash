import 'package:flutter/material.dart';
EdgeInsets myEdgeInsets =
    const EdgeInsets.only(bottom: 5.0, left: 10.0, right: 10.0);
class Helper {
  static void dissmissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
