import 'package:flutter/material.dart';
import 'package:song_review/design_system/tokens/app_radius.dart';

class CoverArt extends StatelessWidget {
  const CoverArt({
    super.key,
    required this.color,
    this.size = 56,
    this.radius = AppRadius.cover,
    this.icon = Icons.album_rounded,
  });

  final Color color;
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
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            Color.lerp(color, Colors.black, 0.35)!,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.28),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white70, size: size * 0.38),
    );
  }
}
