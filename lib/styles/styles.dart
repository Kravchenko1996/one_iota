import 'package:flutter/material.dart';
import 'package:one_iota/styles/colors.dart';

final $styles = AppStyle();

@immutable
class AppStyle {
  final AppColors colors = AppColors();
  late final Insets insets = Insets();
}

@immutable
class Insets {
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 56;
  late final double offset = 80;
}