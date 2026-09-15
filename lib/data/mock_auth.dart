import 'package:song_review/data/mock_users.dart';
import 'package:song_review/models/user.dart';

class MockAuth {
  MockAuth._();

  static AppUser? currentUser;

  static AppUser? login({
    required String email,
    required String password,
  }) {
    final normalized = email.trim().toLowerCase();
    for (final user in mockUsers) {
      if (user.email.toLowerCase() == normalized &&
          user.password == password) {
        currentUser = user;
        return user;
      }
    }
    return null;
  }

  static String? register({
    required String name,
    required String email,
    required String password,
  }) {
    final trimmedName = name.trim();
    final normalized = email.trim().toLowerCase();

    if (trimmedName.length < 2) {
      return 'Informe um nome válido.';
    }
    if (!normalized.contains('@') || !normalized.contains('.')) {
      return 'Informe um e-mail válido.';
    }
    if (password.length < 6) {
      return 'A senha precisa ter ao menos 6 caracteres.';
    }
    if (mockUsers.any((u) => u.email.toLowerCase() == normalized)) {
      return 'Este e-mail já está cadastrado.';
    }

    final user = AppUser(
      id: '${mockUsers.length + 1}',
      name: trimmedName,
      email: normalized,
      password: password,
      bio: 'Novo no Song Review.',
    );
    mockUsers.add(user);
    currentUser = user;
    return null;
  }

  static void logout() {
    currentUser = null;
  }
}
