class User {
  String? name;
  int? age;

  User({this.name, this.age});

  @override
  String toString() {
    return "name: $name, age: $age";
  }
}
