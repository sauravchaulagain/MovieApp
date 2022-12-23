import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SamplePosts> samplePosts = [];
  Future<List<SamplePosts>> getData() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/sauravchaulagain/MovieApp/main/assets/movie.json'));
    var data = jsonDecode(response.body);

    for (Map<String, dynamic> index in data) {
      samplePosts.add(SamplePosts.fromJson(index));
    }
    return samplePosts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "MovieApp",
            style: TextStyle(
              fontFamily: 'hello',
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            Container(
              height: 270,
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: samplePosts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://image.tmdb.org/t/p/w500/' +
                                    samplePosts[index].posterPath,
                                height: 200,
                                fit: BoxFit.fitHeight,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Title: ${samplePosts[index].title}',
                                style: TextStyle(
                                  fontFamily: 'hello',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
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
      ],
    );
  }
}
