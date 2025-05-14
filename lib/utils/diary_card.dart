import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  const DiaryCard({
    super.key,
    required this.title,
    this.onDelete,
    this.onToggle,
    this.isCompleted = false,
    required this.number,
    required this.star,
    required this.body,
  });

  final String number;
  final String star;
  final String title;
  final VoidCallback? onDelete;
  final ValueChanged<bool>? onToggle;
  final bool isCompleted;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(color: const Color.fromARGB(255, 11, 140, 232)),
          ],
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 231, 62, 16).withAlpha(100),
              const Color.fromARGB(255, 247, 196, 29).withAlpha(100),
            ],
          ),
        ),
        child: ExpansionTile(
          leading: Column(
            children: [Text(number, style: TextStyle(fontSize: 25))],
          ),
          title: Text(title.toUpperCase()),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 10),
                  Text(star),
                ],
              ),
            ],
          ),
          children: <Widget>[Text(body, style: TextStyle(fontSize: 18))],
        ),
      ),
    );
  }
}
