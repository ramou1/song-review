import 'package:flutter/material.dart';
import 'package:song_review/design_system/design_system.dart';
import 'package:song_review/data/mock_albums.dart';
import 'package:song_review/models/album.dart';
import 'package:song_review/models/song.dart';
import 'package:song_review/screens/albums/album_detail_page.dart';
import 'package:song_review/screens/songs/song_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deepCuts = mockDeepCuts;
    final textTheme = Theme.of(context).textTheme;

    return AppPage(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
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
                    Text('Song Review', style: textTheme.headlineLarge),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Para quem ouve o álbum inteiro e celebra as faixas que não viraram single.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const AppHeroBanner(
                      title: 'Deep cuts da semana',
                      subtitle:
                          'Avalie, compare e compartilhe sua nota nos stories.',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Álbuns em destaque',
              subtitle: 'Comece pelo disco, não só pelo hit',
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 222,
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSpacing.page),
                scrollDirection: Axis.horizontal,
                itemCount: mockAlbums.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: AppSpacing.sm),
                itemBuilder: (context, index) {
                  final album = mockAlbums[index];
                  return _AlbumCard(
                    album: album,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => AlbumDetailPage(album: album),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: AppSpacing.xs),
              child: SectionHeader(
                title: 'Faixas escondidas',
                subtitle: 'As que merecem mais plays',
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final song = deepCuts[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.page,
                    0,
                    AppSpacing.page,
                    AppSpacing.sm,
                  ),
                  child: _SongRow(
                    song: song,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => SongDetailPage(song: song),
                      ),
                    ),
                  ),
                );
              },
              childCount: deepCuts.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
        ],
      ),
    );
  }
}

class _AlbumCard extends StatelessWidget {
  const _AlbumCard({required this.album, required this.onTap});

  final Album album;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppSurface(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: SizedBox(
        width: 146,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoverArt(
              color: Color(album.coverColor),
              size: 126,
              radius: AppRadius.md,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              album.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleSmall,
            ),
            Text(
              album.artist,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _SongRow extends StatelessWidget {
  const _SongRow({required this.song, required this.onTap});

  final Song song;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppSurface(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        children: [
          CoverArt(
            color: Color(song.coverColor),
            icon: Icons.music_note_rounded,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleSmall,
                ),
                const SizedBox(height: 2),
                Text(
                  '${song.artist} · ${song.album}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          RatingStars(rating: song.rating, size: 15),
        ],
      ),
    );
  }
}
