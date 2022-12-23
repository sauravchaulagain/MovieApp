import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SamplePosts> samplePosts = [];
  Future<List<SamplePosts>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body);

    for (Map<String, dynamic> index in data) {
      samplePosts.add(SamplePosts.fromJson(index));
    }
    return samplePosts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Row(
            children: [
              const Icon(
                Icons.menu_outlined,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(width: 100),
              Text(
                'MovieApp',
                style: TextStyle(
                  fontFamily: 'hello',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: ListView(
          children: [
            TopDecor(),
            Text(
              "Trending",
              style: TextStyle(
                fontFamily: 'hello',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget TopDecor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          "Find best \nmovie for you",
          style: TextStyle(
            fontFamily: 'hello',
            fontSize: 34,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.black54),
              color: Colors.grey),
        ),
        SizedBox(height: 20),
        Container(
          height: 250,
          width: 550,
          color: Colors.red,
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    var list = snapshot.data;
                    return Text(
                        '{samplePosts[index].totalResults["original_language"]}');
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        )
      ],
    );
  }
}
