class UserModel {
  String id;
  String name;
  String email;
  String phone;
  String city;
  String type;
  String project;
  String event;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.city,
      this.type,
      this.project,
      this.event});

  UserModel.fromFirestore(Map<String, dynamic> doc) {
    id = doc['id'];
    name = doc['name'];
    email = doc['email'];
    phone = doc['phoneNo'];
    city = doc['city'];
    type = doc['type'];
    project = doc['project'];
    event = doc['event'];
  }
}
