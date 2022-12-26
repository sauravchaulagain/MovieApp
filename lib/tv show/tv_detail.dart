import 'package:flutter/material.dart';
import 'package:movieapp/tv%20show/tv_modle.dart';

class TvDetail extends StatelessWidget {
  final TvList tv;

  const TvDetail({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(),
            Padding(
              padding: const EdgeInsets.only(bottom: 550),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w500/' +
                            tv.backdropPath),
                        opacity: 50,
                        colorFilter: ColorFilter.srgbToLinearGamma(),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              top: 140,
              left: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/' +
                                    tv.posterPath),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${tv.title}',
                    style: TextStyle(
                      fontFamily: 'hello',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '⭐ ${tv.voteAverage}',
                        style: TextStyle(
                          fontFamily: 'hello',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(width: 50),
                      Text(
                        '${tv.popularity}',
                        style: TextStyle(
                          fontFamily: 'hello',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Overview",
                    style: TextStyle(
                      fontFamily: 'hello',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 350,
                    child: Text(
                      '${tv.overview}',
                      style: TextStyle(
                        fontFamily: 'hello',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Release Date: ${tv.releaseDate}',
                    style: TextStyle(
                      fontFamily: 'hello',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
