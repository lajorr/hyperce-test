import 'package:flutter/material.dart';

extension ColorExt on String {
  Color toColorObj() => Color(int.parse('0xff${substring(1)}'));
}
