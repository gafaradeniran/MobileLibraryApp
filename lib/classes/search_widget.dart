import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
   List<String> searchs = [
    // widget.bookTitle,
    // widget.author,
    // widget.isbn,
  ];

  /// Store search variable to this string variable
  String searchValue = "";

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchResult =
        searchs.where((element) => element.contains(searchValue)).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 45,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: TextFormField(
            autofocus: false,
            controller: _searchController,
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              setState(() {
                searchValue = value;
              });
            },
            decoration: InputDecoration(
              labelText: "Search by title,author's name or ISBN",
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
