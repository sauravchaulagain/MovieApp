import 'package:flutter/material.dart';
import 'package:movieapp/Trending/trending.dart';

import '../movie/movies.dart';
import '../tv show/tv.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopDecor(),
              Text(
                ' Trending',
                style: TextStyle(
                  fontFamily: 'hello',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 310,
                child: TrendingPage(),
              ),
              Text(
                ' Movie',
                style: TextStyle(
                  fontFamily: 'hello',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 310,
                child: MoviePage(),
              ),
              Text(
                'Tv Shows',
                style: TextStyle(
                  fontFamily: 'hello',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 310,
                child: TvPage(),
              )
            ],
          ),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white38,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white38)),
            ),
          ),
          // child: Row(
          //   children: [
          //     SizedBox(width: 20),
          //     Icon(
          //       Icons.search,
          //       size: 30,
          //       color: Colors.white30,
          //     ),
          //     Text(
          //       'Search',
          //       style: TextStyle(
          //         fontFamily: 'hello',
          //         fontSize: 18,
          //         fontWeight: FontWeight.w500,
          //         color: Colors.white30,
          //       ),
          //     )
          //   ],
          // ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
