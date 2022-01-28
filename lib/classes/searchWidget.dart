import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: TextFormField(
            autofocus: false,
            controller: _searchController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              labelText: "Search by title/author's name, ISBN",
              labelStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(
                Icons.search,
                size: 32,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  /* Clear the search field */
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
