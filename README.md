# Song Review

App Flutter para review de músicas. A splash aparece por ~2s e navega para a Home com uma lista de músicas mock.

## Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart `^3.7.2`)
- Chrome (para web), Xcode (iOS/macOS) e/ou Android Studio (Android)

Confira o ambiente:

```bash
flutter doctor
```

## Setup

Na raiz do projeto:

```bash
flutter pub get
```

## Como rodar

Liste os dispositivos disponíveis:

```bash
flutter devices
```

Exemplos:

```bash
flutter run -d chrome   # navegador
flutter run -d macos    # desktop
flutter run             # escolhe o dispositivo padrão
```

Durante o `flutter run`:

- `r` — hot reload
- `R` — hot restart
- `q` — encerrar

## Estrutura

```
lib/
  main.dart                 # entrypoint
  app.dart                  # MaterialApp e tema
  models/                   # modelos (Song)
  data/                     # mocks (músicas reais)
  common/constants/         # cores e constantes
  screens/splash/           # splash (~2s)
  screens/home/             # lista de músicas
```

## Análise e testes

```bash
flutter analyze
flutter test
```
