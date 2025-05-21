import 'package:diaryentryapp/cubit/diary_cubit.dart';
import 'package:diaryentryapp/models/diary.dart';
import 'package:diaryentryapp/utils/diary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchText = TextEditingController();
  List<Diary> _allDiary = [];
  List<Diary> _filteredDiary = [];

  @override
  void initState() {
    super.initState();
    final diaries = context.read<DiaryCubit>().state;
    _allDiary = diaries;
    _filteredDiary = diaries;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: searchText,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onChanged: (query) {
              setState(() {
                _filteredDiary =
                    _allDiary
                        .where(
                          (e) => e.body.toLowerCase().contains(
                            query.toLowerCase(),
                          ),
                        )
                        .toList();
              });
            },
          ),
          Expanded(
            child:
                _filteredDiary.isEmpty
                    ? Center(
                      child: Text(
                        'No matching expenses.',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                    : ListView.builder(
                      itemCount: _filteredDiary.length,
                      itemBuilder: (context, index) {
                        final e = _filteredDiary[index];
                        return DiaryCard(
                          title: e.title,
                          number: e.number,
                          star: e.star,
                          body: e.body,
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
