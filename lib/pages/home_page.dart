import 'package:diaryentryapp/cubit/diary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diaryentryapp/cubit/diary_cubit.dart';
import 'package:diaryentryapp/models/diary.dart';
import './add_diary_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Center(
            child: Text(
              'D I A R Y  E N T R Y  A P P',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
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
              bottom: 150,
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
            BottomNavigationBar(
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color.fromARGB(28, 41, 4, 206),
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.white),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mood, color: Colors.white),
                  label: 'Happy Mood',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mood_bad, color: Colors.white),
                  label: 'Sad Mood',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
