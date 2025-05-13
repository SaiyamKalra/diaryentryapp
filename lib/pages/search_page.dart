import 'package:diaryentryapp/cubit/diary_cubit.dart';
import 'package:diaryentryapp/models/diary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchText = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchText,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
      body: BlocBuilder<DiaryCubit, List<Diary>>(
        builder: (context, diaries) {
          return ListView.builder(
            itemCount: diaries.length,
            itemBuilder: (context, index) {
              final diary = diaries[index];
              return ListTile();
            },
          );
        },
      ),
    );
  }
}
