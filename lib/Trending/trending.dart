import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/Trending/trending_model.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List<TrendingList> trendingPosts = [];
  Future<List<TrendingList>> getData() async {
    final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/sauravchaulagain/MovieApp/main/assets/movie.json',
    ));
    var data = jsonDecode(response.body);

    for (Map<String, dynamic> index in data) {
      trendingPosts.add(SamplePosts.fromJson(index));
    }
    return trendingPosts;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingPosts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) =>
                  //           MovieDetail(sample: samplePosts[index]),
                  //     ),
                  //   );
                  // },
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
                                          trendingPosts[index].posterPath,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              '${trendingPosts[index].title}',
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
    );
  }
}
