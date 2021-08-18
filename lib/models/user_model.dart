class User {
    User({
        required this.state,
        required this.name,
        required this.lastName,
        required this.phoneNumber,
        required this.email,
        required this.userName,
        required this.uid,
    });

    bool state;
    String name;
    String lastName;
    String phoneNumber;
    String email;
    String userName;
    String uid;

    factory User.fromJson(Map<String, dynamic> json) => User(
        state: json["state"],
        name: json["name"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        userName: json["userName"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "name": name,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "userName": userName,
        "uid": uid,
    };
}
