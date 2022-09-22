import 'package:flutter/material.dart';

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
    return counter == 0
        ? const IconButton(
            onPressed: null,
            icon: Icon(Icons.shopping_cart_outlined),
          )
        : Stack(
            children: [
              IconButton(
                onPressed: () => onTap(),
                icon: const Icon(
                  Icons.add_shopping_cart,
                ),
              ),
              Positioned(
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
