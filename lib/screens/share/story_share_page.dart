import 'package:flutter/material.dart';
import 'package:song_review/design_system/design_system.dart';

class StorySharePage extends StatelessWidget {
  const StorySharePage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.artworkUrl,
    required this.kindLabel,
  });

  final String title;
  final String subtitle;
  final double rating;
  final String artworkUrl;
  final String kindLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color(0xFF1B2420),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text('Stories'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.xl,
            AppSpacing.xs,
            AppSpacing.xl,
            AppSpacing.xl,
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.xxl),
                        color: AppColors.background,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              artworkUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const ColoredBox(color: AppColors.surface),
                            ),
                          ),
                          const Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0x66000000),
                                    Color(0xCC120E18),
                                    Color(0xF0120E18),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 28,
                            left: 22,
                            right: 22,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.16),
                                    borderRadius:
                                        BorderRadius.circular(AppRadius.sm),
                                  ),
                                  child: Text(
                                    kindLabel,
                                    style: textTheme.labelLarge?.copyWith(
                                      color: Colors.white,
                                      fontSize: 11,
                                      letterSpacing: 1.1,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'Song Review',
                                  style: textTheme.titleSmall?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, -0.15),
                            child: CoverArt(
                              imageUrl: artworkUrl,
                              size: 160,
                              radius: AppRadius.xl,
                            ),
                          ),
                          Positioned(
                            left: 22,
                            right: 22,
                            bottom: 36,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: textTheme.headlineMedium?.copyWith(
                                    color: Colors.white,
                                    height: 1.15,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  subtitle,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.md),
                                RatingStars(
                                  rating: rating,
                                  size: 28,
                                  showValue: false,
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                Text(
                                  rating.toStringAsFixed(1),
                                  style: textTheme.displayMedium?.copyWith(
                                    color: Colors.white,
                                    fontSize: 42,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Prévia pronta para compartilhar nos stories.',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: AppColors.onAccent,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Compartilhamento mockado nos stories.',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.ios_share_rounded),
                  label: const Text('Compartilhar agora'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
