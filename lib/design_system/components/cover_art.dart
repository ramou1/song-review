import 'package:flutter/material.dart';
import 'package:song_review/design_system/tokens/app_colors.dart';
import 'package:song_review/design_system/tokens/app_radius.dart';

class CoverArt extends StatelessWidget {
  const CoverArt({
    super.key,
    required this.imageUrl,
    this.size = 56,
    this.radius = AppRadius.cover,
    this.icon = Icons.album_rounded,
  });

  final String imageUrl;
  final double size;
  final double radius;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.28),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: imageUrl.isEmpty
            ? _fallback()
            : Image.network(
                imageUrl,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _fallback(),
              ),
      ),
    );
  }

  Widget _fallback() {
    return ColoredBox(
      color: AppColors.surfaceMuted,
      child: Icon(icon, color: AppColors.accent, size: size * 0.38),
    );
  }
}
