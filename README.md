# Song Review

App Flutter para avaliar e compartilhar **álbuns** e **músicas**.

Desenvolvido com **Flutter 3.29** e **Dart 3.7**. O catálogo de teste vem da [iTunes Search API](https://performance-partners.apple.com/search-api) (gratuita, sem chave), com nomes e capas oficiais.

## Screenshots

| Login | Cadastro | Início |
| :---: | :---: | :---: |
| ![Login](https://i.imgur.com/3M3zNqR.png) | ![Cadastro](https://i.imgur.com/wOdjZQe.png) | ![Início](https://i.imgur.com/3ehXgQX.png) |

| Lista Álbuns | Álbum | Música |
| :---: | :---: | :---: |
| ![Lista Álbuns](https://i.imgur.com/tFfzcGv.png) | ![Álbum](https://i.imgur.com/oHLJktu.png) | ![Música](https://i.imgur.com/nTuJNyd.png) |

## Design system

O app usa um design system próprio em `lib/design_system/`:

- **Tokens:** cores (ameixa, rosa de palco, âmbar), espaçamento (4pt) e raios
- **Tema:** Material 3 escuro + tipografia **Inter** (`google_fonts`)
- **Componentes:** `AppPage`, `AppSurface`, `BrandMark`, `CoverArt`, `RatingStars`, `SectionHeader`

## Fluxo atual (mock)

1. Splash (~2s)
2. Login / cadastro com usuários mockados
3. Início com álbuns e músicas do catálogo
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
  data/                   # catálogo iTunes, mocks de auth
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
