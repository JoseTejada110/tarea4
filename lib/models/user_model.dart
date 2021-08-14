import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
      required this.name,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.userName,
      required this.password,
    });

    String name;
    String lastName;
    String email;
    String phoneNumber;
    String userName;
    String password;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        userName: json["userName"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "userName": userName,
        "password": password,
    };
}
