import 'package:diaryentryapp/cubit/diary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diaryentryapp/cubit/diary_cubit.dart';
import 'package:diaryentryapp/models/diary.dart';
import './add_diary_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(95.0),
          child: Text(
            'D I A R Y  E N T R Y  A P P',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            BlocBuilder<DiaryCubit, List<Diary>>(
              builder: (context, diaries) {
                if (diaries.isEmpty) {
                  return Center(
                    child: Text(
                      'Tell us about your Day!',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: diaries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(diaries[index].title ?? ''),
                      subtitle: Text(diaries[index].body ?? ''),
                    );
                  },
                );
              },
            ),
            Positioned(
              bottom: 80,
              right: 30,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddDiaryPage(),
                    ),
                  );
                },
                child: Text('+', style: TextStyle(fontSize: 25)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
