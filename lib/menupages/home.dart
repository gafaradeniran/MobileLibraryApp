import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
         IconButton(
            icon: const Icon(Icons.navigate_before, color: Colors.white),
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        elevation: 0,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 12.0, horizontal: 12),
        child: SizedBox(
          height: 35,
          child: TextFormField(
            autofocus: false,
            controller: searchController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              labelText: "Search by title/author's name, ISBN",
              labelStyle: const TextStyle(color: Colors.white38),
              prefixIcon: const Icon(
                Icons.search,
                size: 32,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20.0),
              ),
              fillColor: Colors.white54,
            ),
          ),
        ),
      ),
    );
  }
}