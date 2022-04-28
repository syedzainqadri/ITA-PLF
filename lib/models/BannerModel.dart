class BannerModel {
  String eventUrl;
  String id;
  String url;
  bool status;

  BannerModel({this.id, this.eventUrl, this.url, this.status});
  BannerModel.fromFireStore(Map<String, dynamic> doc) {
    eventUrl = doc['eventUrl'];
    id = doc['id'];
    url = doc['url'];
    status = doc['status'];
  }
}
