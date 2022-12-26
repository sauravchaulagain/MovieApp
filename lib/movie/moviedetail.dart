import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_models.dart';

class MovieDetail extends StatelessWidget {
  final SamplePosts sample;

  const MovieDetail({super.key, required this.sample});
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
                            sample.backdropPath),
                        opacity: 50,
                        colorFilter: ColorFilter.srgbToLinearGamma(),
                        fit: BoxFit.cover)),
                // child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       IconButton(
                //           onPressed: () => Navigator.pop(context),
                //           icon: Icon(
                //             CupertinoIcons.back,
                //             size: 40,
                //           )),
                //       IconButton(
                //           onPressed: () {},
                //           icon: Icon(
                //             Icons.favorite_border_sharp,
                //             size: 40,
                //           ))
                //     ]),
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
                                    sample.posterPath),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${sample.title}',
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
                        '⭐ ${sample.voteAverage}',
                        style: TextStyle(
                          fontFamily: 'hello',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(width: 50),
                      Text(
                        '${sample.popularity}',
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
                      '${sample.overview}',
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
                    'Release Date: ${sample.releaseDate}',
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
