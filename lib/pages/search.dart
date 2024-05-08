import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/models/photo_models.dart';
import 'package:wallpaper/widget/widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PhotoModel> photos = [];
  TextEditingController searchController = TextEditingController();

  getSearchWallpaper(String searchQuery) async {
    await http.get(
      Uri.parse(
        "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30",
      ),
      headers: {
        "Authorization":
            "HAY6KTU4pxe96slnVBEzwWDj6qoeZBmgkr4dZ2df8sk3xXSHSidIOXfh"
      },
    ).then((value) {
      if (value.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(value.body);
        jsonData["photos"].forEach((element) {
          PhotoModel photoModel = PhotoModel.fromMap(element);
          photos.add(photoModel);
        });
        setState(() {});
      } else {
        print('Request failed with status: ${value.statusCode}.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Center(
              child: Text(
                "Search",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              margin: const EdgeInsets.symmetric(horizontal: 28),
              decoration: BoxDecoration(
                color: const Color(0xFFececf8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          getSearchWallpaper(searchController.text);
                        },
                        child: Icon(Icons.search_outlined))),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: walpaper(photos, context))
          ],
        ),
      ),
    );
  }
}
