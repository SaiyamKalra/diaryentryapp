import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diaryentryapp/cubit/diary_cubit.dart';
import 'package:diaryentryapp/models/diary.dart';

class DetailDiaryPage extends StatelessWidget {
  const DetailDiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DiaryCubit, List<Diary>>(
        builder: (context, diaries) {
          return ListView.builder(
            itemCount: diaries.length,
            itemBuilder: (context, index) {
              final diary = diaries[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Text(
                            diary.number,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Text(
                            diary.title,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: Text(diary.body, style: TextStyle(fontSize: 15)),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
