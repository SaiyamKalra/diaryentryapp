import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diaryentryapp/models/diary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiaryCubit extends Cubit<List<Diary>> {
  DiaryCubit() : super([]) {
    _loadDiary();
  }

  void addData(Diary diary) {
    if (diary.title.isEmpty) {
      emitError("Title is empty");
      return;
    } else if (diary.body.isEmpty) {
      emitError("Body is empty");
      return;
    } else if (diary.star == 0) {
      emitError("Star is empty");
      return;
    }
    emit([...state, diary]);
    _saveDiary();
  }

  void removeData(Diary diary) {
    emit(state.where((e) => e != diary).toList());
  }

  void emitError(String message) {
    if (kDebugMode) {
      print(message);
    }
  }

  Future<void> _saveDiary() async {
    final diaryJson = jsonEncode(state.map((e) => e.toJson()).toList());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('diary', diaryJson);
  }

  Future<void> _loadDiary() async {
    final prefs = await SharedPreferences.getInstance();
    final diaryJson = prefs.getString('diary');
    if (diaryJson != null) {
      final List<dynamic> diaryList = jsonDecode(diaryJson);
      final diary = diaryList.map((e) => Diary.fromJson(e)).toList();
      emit(diary);
    }
  }
}
