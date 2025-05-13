import 'package:diaryentryapp/pages/detail_diary_page.dart';
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
  });

  final String number;
  final String star;
  final String title;
  final VoidCallback? onDelete;
  final ValueChanged<bool>? onToggle;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.1),
              Colors.white.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 223, 140, 15),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            if (onToggle != null)
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: IconButton(
                  onPressed: () {
                    onToggle?.call(!isCompleted);
                  },
                  icon: Icon(
                    isCompleted ? Icons.check_circle : Icons.circle_outlined,
                    color: isCompleted ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            Expanded(
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DetailDiaryPage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(number, style: TextStyle(fontSize: 40)),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Text(title),
                              SizedBox(width: 20),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  Text(star),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (onDelete != null)
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete_outline, color: Colors.redAccent),
              ),
          ],
        ),
      ),
    );
  }
}
