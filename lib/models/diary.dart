class Diary {
  final String title;
  final String body;
  final DateTime date;

  Diary({required this.title, required this.body, required this.date});

  Map<String, dynamic> toJson() {
    return {'title': title, 'body': body, 'date': date.toIso8601String()};
  }

  factory Diary.fromJson(Map<String, dynamic> json) {
    return Diary(
      title: json['title'],
      body: json['body'],
      date: DateTime.parse(json['date']),
    );
  }
}
