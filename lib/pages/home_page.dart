import 'package:diaryentryapp/cubit/diary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diaryentryapp/models/diary.dart';
import './add_diary_page.dart';
import 'package:diaryentryapp/utils/diary_card.dart';
import './search_page.dart';
import './happy_mood_page.dart';
import './sad_mood_page.dart';

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

  Widget _getSelectedPage() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomePage();
      case 1:
        return SearchPage();
      case 2:
        return HappyMoodPage();
      case 3:
        return SadMoodPage();
      default:
        return _buildHomePage();
    }
  }

  Widget _buildHomePage() {
    return BlocBuilder<DiaryCubit, List<Diary>>(
      builder: (context, diaries) {
        if (diaries.isEmpty) {
          return Center(
            child: Text(
              'Tell us about your Day!',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 100), // Space for FAB
          itemCount: diaries.length,
          itemBuilder: (context, index) {
            final diary = diaries[index];
            return Dismissible(
              key: Key(diary.title),
              direction: DismissDirection.horizontal,
              background: Container(
                height: 20,
                color: Colors.red,
                alignment: Alignment.center,
                child: Icon(Icons.delete),
              ),
              onDismissed: (direction) {
                context.read<DiaryCubit>().removeData(diary);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Diary "${diary.number}" deleted')),
                );
              },
              child: DiaryCard(
                number: diary.number,
                title: diary.title,
                star: diary.star,
                body: diary.body,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'D I A R Y  E N T R Y  A P P',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: _getSelectedPage(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const AddDiaryPage()));
        },
        child: Icon(Icons.add, size: 30),
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(28, 41, 4, 206),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.mood), label: 'Happy Mood'),
          BottomNavigationBarItem(
            icon: Icon(Icons.mood_bad),
            label: 'Sad Mood',
          ),
        ],
      ),
    );
  }
}
