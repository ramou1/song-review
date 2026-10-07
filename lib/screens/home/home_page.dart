import 'package:flutter/material.dart';
import 'package:song_review/data/catalog.dart';
import 'package:song_review/design_system/design_system.dart';
import 'package:song_review/models/album.dart';
import 'package:song_review/models/song.dart';
import 'package:song_review/screens/albums/album_detail_page.dart';
import 'package:song_review/screens/songs/song_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final albums = Catalog.albums;
    final songs = Catalog.songs;
    final featured = albums.isEmpty ? null : albums.first;

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
                      '${albums.length} álbuns · ${songs.length} músicas',
                      style: textTheme.bodyMedium,
                    ),
                    if (featured != null) ...[
                      const SizedBox(height: AppSpacing.lg),
                      _FeaturedAlbum(album: featured),
                    ],
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SectionHeader(title: 'Álbuns'),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 230,
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSpacing.page),
                scrollDirection: Axis.horizontal,
                itemCount: albums.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: AppSpacing.sm),
                itemBuilder: (context, index) {
                  final album = albums[index];
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
              child: SectionHeader(title: 'Músicas'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final song = songs[index];
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
              childCount: songs.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
        ],
      ),
    );
  }
}

class _FeaturedAlbum extends StatelessWidget {
  const _FeaturedAlbum({required this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppSurface(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => AlbumDetailPage(album: album),
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          CoverArt(imageUrl: album.artworkUrl, size: 108, radius: AppRadius.lg),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EM DESTAQUE',
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColors.accent,
                    fontSize: 11,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(album.title, style: textTheme.titleLarge),
                const SizedBox(height: 2),
                Text(
                  '${album.artist} · ${album.year}',
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                RatingStars(rating: album.rating),
              ],
            ),
          ),
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
        width: 148,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoverArt(
              imageUrl: album.artworkUrl,
              size: 132,
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
          CoverArt(imageUrl: song.artworkUrl, icon: Icons.music_note_rounded),
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
          RatingStars(rating: song.rating, size: 14),
        ],
      ),
    );
  }
}
