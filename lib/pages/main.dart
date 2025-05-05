import 'package:diaryentryapp/cubit/diary_cubit.dart';
import 'package:diaryentryapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(
    BlocProvider(create: (context) => DiaryCubit(), child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: HomePage(),
    );
  }
}
