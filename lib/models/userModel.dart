class UserModel {
  String firstName;
  String lastName;
  String email;
  String password;

  UserModel({this.email, this.firstName, this.password, this.lastName});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.addAll({
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'username': email
    });

    return map;
  }
}
