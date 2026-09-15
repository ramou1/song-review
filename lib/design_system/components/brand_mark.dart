import 'package:flutter/material.dart';
import 'package:song_review/design_system/tokens/app_colors.dart';
import 'package:song_review/design_system/tokens/app_spacing.dart';

class BrandMark extends StatelessWidget {
  const BrandMark({
    super.key,
    this.size = 72,
    this.showWordmark = true,
    this.tagline,
    this.light = false,
  });

  final double size;
  final bool showWordmark;
  final String? tagline;
  final bool light;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleColor = light ? Colors.white : AppColors.ink;
    final subtitleColor = light ? Colors.white70 : AppColors.muted;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size * 0.28),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.brandGradient,
            ),
          ),
          child: Icon(
            Icons.graphic_eq_rounded,
            color: Colors.white,
            size: size * 0.48,
          ),
        ),
        if (showWordmark) ...[
          const SizedBox(height: AppSpacing.md),
          Text(
            'Song Review',
            style: textTheme.headlineLarge?.copyWith(color: titleColor),
          ),
          if (tagline != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              tagline!,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(color: subtitleColor),
            ),
          ],
        ],
      ],
    );
  }
}
