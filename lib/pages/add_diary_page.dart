import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diaryentryapp/models/diary.dart';
import '../cubit/diary_cubit.dart';

class AddDiaryPage extends StatefulWidget {
  const AddDiaryPage({super.key});

  @override
  State<AddDiaryPage> createState() => _AddDiaryPageState();
}

class _AddDiaryPageState extends State<AddDiaryPage> {
  final TextEditingController _diaryTitleController = TextEditingController();
  final TextEditingController _diaryBodyController = TextEditingController();
  final TextEditingController _diaryStarController = TextEditingController();
  final TextEditingController _diaryNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A D D  N E W  D I A R Y'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _diaryTitleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _diaryBodyController,
              decoration: InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 20),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: TextField(
                      controller: _diaryStarController,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text('/5', style: TextStyle(fontSize: 25)),
                  SizedBox(width: 50),
                  Text('Number', style: TextStyle(fontSize: 20)),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: TextField(
                      controller: _diaryNumberController,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final numbertext = _diaryNumberController.text.trim();
                final titletext = _diaryTitleController.text.trim();
                final startext = _diaryStarController.text.trim();
                final bodytext = _diaryBodyController.text.trim();
                if (numbertext.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a number.')),
                  );
                } else if (startext.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please Enter a Rating')),
                  );
                } else if (bodytext.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please Enter the Body')),
                  );
                } else if (titletext.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please Enter the Title')),
                  );
                } else {
                  final diaryCubit = BlocProvider.of<DiaryCubit>(context);
                  final count = diaryCubit.state.length;
                  final newDiary = Diary(
                    title: titletext,
                    body: bodytext,
                    star: startext,
                    date: DateTime.now(),
                    number: numbertext,
                    count: count,
                  );
                  BlocProvider.of<DiaryCubit>(context).addData(newDiary);
                  Navigator.pop(context);
                }
              },
              child: Text('Add Diary'),
            ),
          ],
        ),
      ),
    );
  }
}
