import 'package:flutter/material.dart';
import 'package:song_review/design_system/tokens/app_colors.dart';

/// Página com fundo em gradiente suave do design system.
class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.padding,
  });

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.softGradient,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -90,
              right: -50,
              child: _Glow(color: AppColors.primary, size: 240),
            ),
            Positioned(
              bottom: 40,
              left: -70,
              child: _Glow(color: const Color(0xFF6D28D9), size: 200),
            ),
            Positioned.fill(
              child: padding == null
                  ? child
                  : Padding(padding: padding!, child: child),
            ),
          ],
        ),
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: 0.38),
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}
