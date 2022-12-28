import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'movie_models.dart';
import 'moviedetail.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List<SamplePosts> samplePosts = [];
  Future<List<SamplePosts>> getData() async {
    final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/sauravchaulagain/MovieApp/main/assets/movie.json',
    ));
//        'https://raw.githubusercontent.com/sauravchaulagain/MovieApp/commit2/assets/trending.json'));
    var data = jsonDecode(response.body);

    for (Map<String, dynamic> index in data) {
      samplePosts.add(SamplePosts.fromJson(index));
    }
    return samplePosts;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                  child: SizedBox(
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
                                    'https://image.tmdb.org/t/p/w500/${samplePosts[index].posterPath}',
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            samplePosts[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
