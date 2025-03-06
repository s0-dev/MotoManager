class User {
  final int id;
  final String email;
  final String passwordHash;

  User({required this.id, required this.email, required this.passwordHash});

  Map<String, dynamic> toJson() => {'id': id, 'email': email};
}
