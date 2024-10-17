class Event {
  final int id;
  final String title;
  final String date;
  final String description;
  final String imageurl;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.imageurl,

  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      description: json['description'],
      imageurl:json['image']
    );
  }
}