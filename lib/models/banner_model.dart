

class BannersModel {
  String id;
  String eventUrl;
  bool status;
  String url;

  BannersModel({this.id, this.eventUrl, this.status, this.url});

  BannersModel.fromFireStore(Map<String, dynamic> doc) {
    id = doc['id'];
    eventUrl = doc['eventUrl'];
    status = doc['status'];
    url = doc['url'];
  }
}
