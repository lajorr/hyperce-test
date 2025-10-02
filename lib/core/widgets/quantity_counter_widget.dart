import 'package:flutter/material.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';

class QuantityCounterWidget extends StatelessWidget {
  const QuantityCounterWidget({
    super.key,
    required this.onDecrement,
    required this.onIncrement,
    required this.quantity,
    this.showQuantity = false,
  });

  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final int quantity;
  final bool showQuantity;

  @override
  Widget build(BuildContext context) {
    final canDecrement = quantity > 1;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            overlayColor: Colors.transparent,
          ),
          onPressed: canDecrement ? onDecrement : null,
          icon: Icon(Icons.remove_circle_outline),
        ),
        if (showQuantity)
          Text(quantity.toString(), style: AppTextStyles.heading300),
        IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            overlayColor: Colors.transparent,
          ),
          onPressed: onIncrement,

          icon: Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }
}
