class Motorcycle {
  final int id;
  final int userId;
  final String name;
  final String description;

  Motorcycle({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'name': name,
    'description': description,
  };
}
