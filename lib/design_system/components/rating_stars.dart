import 'package:flutter/material.dart';
import 'package:song_review/design_system/tokens/app_colors.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.size = 16,
    this.showValue = true,
    this.valueColor = AppColors.ink,
  });

  final double rating;
  final double size;
  final bool showValue;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(5, (index) {
          final filled = rating >= index + 1;
          final half = !filled && rating > index && rating < index + 1;
          return Icon(
            half
                ? Icons.star_half_rounded
                : filled
                    ? Icons.star_rounded
                    : Icons.star_outline_rounded,
            size: size,
            color: AppColors.accent,
          );
        }),
        if (showValue) ...[
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: size * 0.85,
              color: valueColor,
            ),
          ),
        ],
      ],
    );
  }
}
