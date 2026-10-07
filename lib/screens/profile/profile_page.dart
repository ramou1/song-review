import 'package:flutter/material.dart';
import 'package:song_review/design_system/design_system.dart';
import 'package:song_review/data/mock_auth.dart';
import 'package:song_review/screens/auth/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = MockAuth.currentUser;
    final textTheme = Theme.of(context).textTheme;

    return AppPage(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.page,
            AppSpacing.lg,
            AppSpacing.page,
            AppSpacing.xxl,
          ),
          children: [
            Text('Perfil', style: textTheme.headlineLarge),
            const SizedBox(height: AppSpacing.lg),
            AppSurface(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColors.primarySoft,
                    foregroundColor: AppColors.primaryDark,
                    child: Text(
                      (user?.name.isNotEmpty == true)
                          ? user!.name.substring(0, 1).toUpperCase()
                          : '?',
                      style: textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.name ?? 'Visitante',
                          style: textTheme.titleLarge,
                        ),
                        const SizedBox(height: 2),
                        Text(user?.email ?? '', style: textTheme.bodyMedium),
                        if (user?.bio.isNotEmpty == true) ...[
                          const SizedBox(height: AppSpacing.xs),
                          Text(user!.bio, style: textTheme.bodySmall),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            AppSurface(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sua vibe', style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Suas notas ficam aqui, junto com o que você compartilha.',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            OutlinedButton.icon(
              onPressed: () {
                MockAuth.logout();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(
                    builder: (_) => const LoginPage(),
                  ),
                  (_) => false,
                );
              },
              icon: const Icon(Icons.logout_rounded),
              label: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
