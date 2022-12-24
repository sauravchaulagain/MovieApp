import 'package:flutter/material.dart';
import 'package:movieapp/models.dart';

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
                        image: AssetImage(
                            'assets/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg'),
                        opacity: 50,
                        colorFilter: ColorFilter.srgbToLinearGamma(),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              top: 160,
              left: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Black Adam',
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
                        '⭐ 8.7',
                        style: TextStyle(
                          fontFamily: 'hello',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(width: 50),
                      Text(
                        'en',
                        style: TextStyle(
                          fontFamily: 'hello',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ],
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
