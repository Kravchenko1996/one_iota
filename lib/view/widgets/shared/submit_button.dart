import 'package:flutter/material.dart';
import 'package:one_iota/styles/styles.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap != null ? () => onTap!() : null,
      style: ElevatedButton.styleFrom(
        primary: $styles.colors.greyStrong,
        onPrimary: $styles.colors.accent,
        textStyle: $styles.text.button,
        padding: EdgeInsets.all($styles.insets.lg),
        minimumSize: Size(MediaQuery.of(context).size.width - 150, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(text.toUpperCase()),
    );
  }
}
