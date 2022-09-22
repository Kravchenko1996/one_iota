import 'package:flutter/material.dart';
import 'package:one_iota/styles/colors.dart';

final $styles = AppStyle();

@immutable
class AppStyle {
  final AppColors colors = AppColors();
  late final _Insets insets = _Insets();
  late final _Text text = _Text();
}

@immutable
class _Insets {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 16;
  late final double xl = 24;
}

@immutable
class _Text {
  final TextStyle title = const TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 24,
  );
  final TextStyle content = const TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 18,
  );
  final TextStyle button = const TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  final TextStyle price = const TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 18,
    fontWeight: FontWeight.w700
  );
}
