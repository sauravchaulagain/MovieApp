import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/pages/moviedetail.dart';

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
      backgroundColor: Colors.black,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopDecor(),
            Text(
              'Trending',
              style: TextStyle(
                fontFamily: 'hello',
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 310,
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(samplePosts[2].title);
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: samplePosts.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetail(sample: samplePosts[index]),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 290,
                              width: 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 220,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),

                                        //  border: Border.all(color: Colors.white),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500/' +
                                                  samplePosts[index].posterPath,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      '${samplePosts[index].title}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'hello',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
            color: Color(0xFF292b37),
          ),
          child: Row(
            children: [
              SizedBox(width: 20),
              Icon(
                Icons.search,
                size: 30,
                color: Colors.white30,
              ),
              Text(
                'Search',
                style: TextStyle(
                  fontFamily: 'hello',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white30,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
