import 'package:flutter/material.dart';
import 'package:song_review/data/catalog.dart';
import 'package:song_review/design_system/design_system.dart';
import 'package:song_review/screens/albums/album_detail_page.dart';

class AlbumsPage extends StatelessWidget {
  const AlbumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final albums = Catalog.albums;

    return AppPage(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              child: SectionHeader(title: 'Álbuns'),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.page,
              0,
              AppSpacing.page,
              AppSpacing.xl,
            ),
            sliver: SliverList.separated(
              itemCount: albums.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final album = albums[index];
                final textTheme = Theme.of(context).textTheme;

                return AppSurface(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => AlbumDetailPage(album: album),
                    ),
                  ),
                  child: Row(
                    children: [
                      CoverArt(
                        imageUrl: album.artworkUrl,
                        size: 84,
                        radius: AppRadius.md,
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(album.title, style: textTheme.titleMedium),
                            const SizedBox(height: 2),
                            Text(
                              '${album.artist} · ${album.year}',
                              style: textTheme.bodySmall,
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              '${album.genre} · ${album.tracks.length} faixas',
                              style: textTheme.bodySmall,
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            RatingStars(rating: album.rating),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
