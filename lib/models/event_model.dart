

class EventModel {
  String name;
  String id;
  String url;
  String description;
  String eventDate;
  bool tarana;
  bool poster;
  bool sponsors;
  bool program;
  bool resource_Persons;
  bool gallery;
  bool media;
  bool getInvolved;
  bool testimonials;
  bool venue;
  bool registration;
  bool videos;
  bool book_launches;
  bool status;

  EventModel({this.id,
    this.name, this.url, this.description, this.eventDate, this.tarana, this.poster, this.sponsors, this.program,
    this.resource_Persons, this.gallery, this.media, this.getInvolved, this.testimonials,
    this.venue, this.registration, this.videos, this.book_launches, this.status,
  });

  EventModel.fromFireStore(Map<String, dynamic> doc) {
    name = doc['name'];
    id = doc['id'];
    url = doc['url'];
    description = doc['description'];
    eventDate = doc['eventDate'];
    tarana = doc['tarana'];
    poster = doc['poster'];
    sponsors = doc['sponsors'];
    program = doc['program'];
    resource_Persons = doc['resource_person'];
    gallery = doc['gallery'];
    media = doc['media'];
    getInvolved = doc['getInvolved'];
    testimonials = doc['testimonials'];
    venue = doc['venue'];
    registration = doc['registration'];
    videos = doc['video'];
    book_launches = doc['book_launches'];
    status = doc['status'];
  }
}
