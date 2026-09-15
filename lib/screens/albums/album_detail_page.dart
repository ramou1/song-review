import 'package:flutter/material.dart';
import 'package:song_review/design_system/design_system.dart';
import 'package:song_review/models/album.dart';
import 'package:song_review/screens/share/story_share_page.dart';
import 'package:song_review/screens/songs/song_detail_page.dart';

class AlbumDetailPage extends StatelessWidget {
  const AlbumDetailPage({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: AppColors.primaryDark,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(album.coverColor),
                      Color.lerp(Color(album.coverColor), Colors.black, 0.45)!,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.page,
                      56,
                      AppSpacing.page,
                      AppSpacing.lg,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CoverArt(
                          color: Color(album.coverColor),
                          size: 114,
                          radius: AppRadius.lg,
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                album.title,
                                style: textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${album.artist} · ${album.year} · ${album.genre}',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              RatingStars(
                                rating: album.rating,
                                size: 18,
                                valueColor: Colors.white,
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.lg,
                AppSpacing.page,
                AppSpacing.xs,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(album.tagline, style: textTheme.bodyMedium),
                  const SizedBox(height: AppSpacing.md),
                  FilledButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => StorySharePage(
                            title: album.title,
                            subtitle: album.artist,
                            rating: album.rating,
                            coverColor: album.coverColor,
                            kindLabel: 'ÁLBUM',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.ios_share_rounded),
                    label: const Text('Compartilhar nota nos stories'),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text('Tracklist', style: textTheme.titleLarge),
                ],
              ),
            ),
          ),
          SliverList.separated(
            itemCount: album.tracks.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final song = album.tracks[index];
              return ListTile(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => SongDetailPage(song: song),
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: AppColors.primarySoft,
                  foregroundColor: AppColors.primary,
                  child: Text('${song.trackNumber}'),
                ),
                title: Text(
                  song.title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: song.isDeepCut
                    ? const Text(
                        'Deep cut',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : Text(song.genre),
                trailing: RatingStars(rating: song.rating, size: 14),
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
        ],
      ),
    );
  }
}
