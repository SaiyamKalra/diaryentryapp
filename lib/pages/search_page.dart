import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchText = TextEditingController();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/search.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: TextField(
          controller: searchText,
          decoration: InputDecoration(
            hintText: 'Search Diary',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
