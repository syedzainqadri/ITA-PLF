




class ProgramModel {
  String name;
  String id;
  String url;
  String programUrl;
  String description;
  bool status;
  bool isFeatured;
  List buttonList;

  ProgramModel({this.id, this.name, this.url, this.programUrl, this.description, this.status, this.isFeatured, this.buttonList
  });

  ProgramModel.fromFireStore(Map<String, dynamic> doc) {
    name = doc['name'];
    id = doc['id'];
    url = doc['url'];
    programUrl = doc['programUrl'];
    description = doc['description'];
    status = doc['status'];
    isFeatured = doc['isFeatured'];
    buttonList = doc['buttonList'];
  }
}
