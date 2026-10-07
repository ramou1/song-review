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
            expandedHeight: 280,
            pinned: true,
            backgroundColor: AppColors.background,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    album.artworkUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const ColoredBox(color: AppColors.surface),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x66000000),
                          Color(0xCC120E18),
                          AppColors.background,
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
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
                            imageUrl: album.artworkUrl,
                            size: 112,
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.md,
                AppSpacing.page,
                AppSpacing.xs,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilledButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => StorySharePage(
                            title: album.title,
                            subtitle: album.artist,
                            rating: album.rating,
                            artworkUrl: album.artworkUrl,
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
                  foregroundColor: AppColors.accent,
                  child: Text('${song.trackNumber}'),
                ),
                title: Text(
                  song.title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(song.genre),
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
