// dedicated Motorcycle model class. This improves type safety, makes the code more maintainable, and allows to add methods for data manipulation and validation in the future.

class Motorcycle {
  final String name;
  final String description;

  const Motorcycle({required this.name, required this.description});

  factory Motorcycle.fromMap(Map<String, dynamic> map) {
    return Motorcycle(name: map['name'], description: map['description']);
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'description': description};
  }
}
