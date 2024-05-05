import 'package:flutter/material.dart';
import 'package:wallpaper/models/photo_models.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PhotoModel> photos = [];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Center(
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
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search_outlined)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
