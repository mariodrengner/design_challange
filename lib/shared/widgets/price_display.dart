import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceDisplay extends StatelessWidget {
  final double price;
  final TextStyle? style;

  const PriceDisplay({
    super.key,
    required this.price,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveStyle = style ??
        theme.textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/images/currency.svg',
          width: 16,
          height: 16,
          colorFilter: ColorFilter.mode(
            effectiveStyle?.color ?? Colors.white,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          price.toStringAsFixed(2),
          style: effectiveStyle,
        ),
      ],
    );
  }
}
