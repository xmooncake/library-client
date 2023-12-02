enum UserRole { admin, user }

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    this.userRole = UserRole.user,
  });

  final int id;
  final String name;
  final String email;
  final UserRole userRole;
}
