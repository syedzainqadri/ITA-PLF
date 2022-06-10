




class ProgramModel {
  String name;
  String id;
  String url;
  String programUrl;
  String description;
  String programDate;
  bool status;
  bool isFeatured;
  List buttonList;

  ProgramModel({this.id, this.name, this.url, this.programUrl, this.description, this.programDate, this.status, this.isFeatured, this.buttonList
  });

  ProgramModel.fromFireStore(Map<String, dynamic> doc) {
    name = doc['name'];
    id = doc['id'];
    url = doc['url'];
    programUrl = doc['programUrl'];
    description = doc['description'];
    programDate = doc['programDate'];
    status = doc['status'];
    isFeatured = doc['isFeatured'];
    buttonList = doc['buttonList'];
  }
}
