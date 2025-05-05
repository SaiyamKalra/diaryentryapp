class Diary {
  final String title;
  final String body;
  final DateTime date;
  final double star;

  Diary({required this.title, required this.body, required this.date,required this.star});

  Map<String, dynamic> toJson() {
    return {'title': title, 'body': body, 'date': date.toIso8601String(),'star':star};
  }

  factory Diary.fromJson(Map<String, dynamic> json) {
    return Diary(
      title: json['title'],
      body: json['body'],
      date: DateTime.parse(json['date']),
      star: json['star'],
    );
  }
}
