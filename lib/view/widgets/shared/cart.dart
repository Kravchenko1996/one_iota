import 'package:flutter/material.dart';
import 'package:one_iota/styles/styles.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({
    Key? key,
    required this.counter,
    required this.onTap,
  }) : super(key: key);

  final int counter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (counter == 0) {
      return IconButton(
        onPressed: null,
        icon: Icon(
          Icons.shopping_cart_outlined,
          color: $styles.colors.white,
          size: 30,
        ),
      );
    }

    final String counterText = counter > 9 ? "9+" : counter.toString();
    return Stack(
      children: [
        Center(
          child: IconButton(
            onPressed: () => onTap(),
            icon: Icon(
              Icons.add_shopping_cart,
              color: $styles.colors.white,
              size: 30,
            ),
          ),
        ),
        Positioned(
          right: 14,
          top: 8,
          child: Container(
            height: 19,
            width: 19,
            decoration: BoxDecoration(
              color: $styles.colors.accent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                counterText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: $styles.colors.greyStrong,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
