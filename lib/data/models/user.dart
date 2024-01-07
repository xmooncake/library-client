enum UserAccountType { admin, user }

class User {
  User({
    required this.id,
    this.userAccountType = UserAccountType.user,
    required this.name,
    required this.email,
    this.adress,
  });

  final int id;
  final UserAccountType userAccountType;
  final String name;
  final String email;
  final String? adress;
}
