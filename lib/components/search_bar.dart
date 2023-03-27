import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 5,

            )
          ]
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.all(8)
          ),
        ) ,
      ),
    );
  }
}
