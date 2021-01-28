class User {
  int id;
  String email;
  String name;

  User({this.id, this.email, this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
