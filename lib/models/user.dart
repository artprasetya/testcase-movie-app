class User {
  String? email;
  String? username;
  String? password;

  User({
    this.email,
    this.username,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        username = json['username'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'username': username,
      };
}
