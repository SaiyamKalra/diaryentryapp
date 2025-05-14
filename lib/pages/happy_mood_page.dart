import 'package:diaryentryapp/models/diary.dart';
import 'package:diaryentryapp/utils/diary_card.dart';
import 'package:flutter/material.dart';
import 'package:diaryentryapp/cubit/diary_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HappyMoodPage extends StatelessWidget {
  const HappyMoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<DiaryCubit, List<Diary>>(
          builder: (context, diaries) {
            final filteredDiaries =
                diaries.where((Diary) {
                  final rating = double.tryParse(Diary.star) ?? 0.0;
                  return rating >= 3.5;
                }).toList();

            if (filteredDiaries.isEmpty) {
              return Center(
                child: Text(
                  'Nothing Good Shared With Us!!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            }
            return ListView.builder(
              itemCount: filteredDiaries.length,
              itemBuilder: (context, index) {
                final diary = filteredDiaries[index];
                return DiaryCard(
                  title: diary.title,
                  number: diary.number,
                  star: diary.star,
                  body: diary.body,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
