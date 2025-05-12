class Diary {
  final String number;
  final String title;
  final String body;
  final DateTime date;
  final String star;

  Diary({
    required this.title,
    required this.body,
    required this.date,
    required this.star,
    required this.number,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'date': date.toIso8601String(),
      'star': star,
      'number': number,
    };
  }

  factory Diary.fromJson(Map<String, dynamic> json) {
    return Diary(
      title: json['title'],
      body: json['body'],
      date: DateTime.parse(json['date']),
      star: json['star'],
      number: json['number'],
    );
  }
}
