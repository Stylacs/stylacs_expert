import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.grey[400]),
                    onPressed: () {}),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey[400])),
          ),
        ),
      ),
    );
  }
}
