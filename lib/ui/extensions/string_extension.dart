import 'package:flutter/material.dart';

extension StringExtension on String {
  Color toHexColor() {
    String value = toUpperCase().replaceAll("#", "");
    if (value.length == 6) {
      value = "FF$value";
    }
    return Color(int.parse(value, radix: 16));
  }
}
