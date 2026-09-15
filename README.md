# Song Review

App Flutter para descobrir, avaliar e compartilhar **álbuns** e **músicas** — especialmente as faixas que ficam escondidas por não virarem singles.

A proposta é unir pessoas que ouvem álbuns completos, dão nota no que mais (e menos) gostaram e compartilham reviews no stories.

## Screenshots

| Login | Cadastro | Início |
| :---: | :---: | :---: |
| ![Login](https://i.imgur.com/mz6Bvo9.png) | ![Cadastro](https://i.imgur.com/jy1FkIe.png) | ![Início](https://i.imgur.com/xdBSnPj.png) |

| Álbum | Música | Stories |
| :---: | :---: | :---: |
| ![Álbum](https://i.imgur.com/DzgDkVd.png) | ![Música](https://i.imgur.com/XT3qdsT.png) | ![Stories](https://i.imgur.com/qrhAOuf.png) |

## Design system

O app usa um design system próprio em `lib/design_system/`:

- **Tokens:** cores, espaçamento (4pt) e raios
- **Tema:** Material 3 + tipografia **Inter** (`google_fonts`)
- **Componentes:** `AppPage`, `AppSurface`, `BrandMark`, `CoverArt`, `RatingStars`, `SectionHeader`

## Fluxo atual (mock)

1. Splash (~2s)
2. Login / cadastro com usuários mockados
3. Início com deep cuts e álbuns em destaque
4. Detalhe de álbum (tracklist) e de música (nota + share)
5. Prévia de compartilhamento para stories

### Conta de demonstração

| E-mail | Senha |
| --- | --- |
| `demo@songreview.com` | `demo123` |
| `ana@songreview.com` | `123456` |
| `leo@songreview.com` | `123456` |

## Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart `^3.7.2`)
- Chrome/Opera (web), Xcode (iOS/macOS) e/ou Android Studio (Android)

```bash
flutter doctor
```

## Setup

```bash
flutter pub get
```

## Como rodar

```bash
flutter devices
flutter run -d chrome
```

No Windows, para abrir no Opera GX:

```powershell
$env:CHROME_EXECUTABLE = "$env:LOCALAPPDATA\Programs\Opera GX\opera.exe"
flutter run -d chrome
```

Durante o `flutter run`:

- `r` — hot reload
- `R` — hot restart
- `q` — encerrar

## Estrutura

```
lib/
  main.dart
  app.dart
  design_system/          # tokens, tema Inter e componentes
  models/                 # Song, Album, AppUser
  data/                   # mocks + MockAuth
  screens/
    splash/
    auth/                 # login e cadastro
    shell/                # navegação principal
    home/
    albums/
    songs/
    share/                # prévia de stories
    profile/
```

## Análise e testes

```bash
flutter analyze
flutter test
```
