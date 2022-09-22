import 'package:flutter/material.dart';
import 'package:one_iota/styles/styles.dart';

import 'submit_button.dart';

class FloatingContainer extends StatelessWidget {
  const FloatingContainer({
    Key? key,
    required this.text,
    required this.buttonText,
    required this.onButtonClick,
  }) : super(key: key);

  final String text;
  final String buttonText;
  final VoidCallback? onButtonClick;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all($styles.insets.lg),
        decoration: BoxDecoration(color: $styles.colors.white, boxShadow: [
          BoxShadow(
            color: $styles.colors.greyStrong,
            spreadRadius: 10,
            blurRadius: 20,
            offset: const Offset(0, 10), // changes position of shadow
          ),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: $styles.text.price.copyWith(
                color: $styles.colors.greyStrong,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(width: $styles.insets.md),
            SubmitButton(onTap: onButtonClick, text: buttonText),
          ],
        ),
      ),
    );
  }
}
