class AppUser {
  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.bio = '',
  });

  final String id;
  final String name;
  final String email;
  final String password;
  final String bio;
}
