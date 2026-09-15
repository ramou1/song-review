import 'package:flutter/material.dart';
import 'package:song_review/design_system/design_system.dart';
import 'package:song_review/models/song.dart';
import 'package:song_review/screens/share/story_share_page.dart';

class SongDetailPage extends StatefulWidget {
  const SongDetailPage({super.key, required this.song});

  final Song song;

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  late double _myRating;

  @override
  void initState() {
    super.initState();
    _myRating = widget.song.rating.roundToDouble().clamp(1, 5);
  }

  @override
  Widget build(BuildContext context) {
    final song = widget.song;
    final textTheme = Theme.of(context).textTheme;

    return AppPage(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Música'),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.xxl,
        ),
        children: [
          Center(
            child: CoverArt(
              color: Color(song.coverColor),
              size: 180,
              radius: AppRadius.xl,
              icon: Icons.music_note_rounded,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            song.title,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '${song.artist}\n${song.album} · ${song.year}',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
          ),
          if (song.isDeepCut) ...[
            const SizedBox(height: AppSpacing.sm),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primarySoft,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Text(
                  'Deep cut · vale ouvir no contexto do álbum',
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColors.primaryDark,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.xl),
          AppSurface(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sua nota', style: textTheme.titleMedium),
                const SizedBox(height: AppSpacing.xs),
                RatingStars(rating: _myRating, size: 28, showValue: false),
                Slider(
                  value: _myRating,
                  min: 1,
                  max: 5,
                  divisions: 8,
                  label: _myRating.toStringAsFixed(1),
                  onChanged: (value) => setState(() => _myRating = value),
                ),
                Text(
                  _myRating.toStringAsFixed(1),
                  style: textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          FilledButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => StorySharePage(
                    title: song.title,
                    subtitle: '${song.artist} · ${song.album}',
                    rating: _myRating,
                    coverColor: song.coverColor,
                    kindLabel: 'MÚSICA',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.ios_share_rounded),
            label: const Text('Compartilhar nos stories'),
          ),
          const SizedBox(height: AppSpacing.sm),
          OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Nota ${_myRating.toStringAsFixed(1)} salva (mock).',
                  ),
                ),
              );
            },
            child: const Text('Salvar review'),
          ),
        ],
      ),
    );
  }
}
