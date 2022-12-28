import 'package:flutter/material.dart';
import 'package:movieapp/Trending/trendingdetail.dart';
import 'package:movieapp/Trending/trendingmodle.dart';
import 'package:movieapp/crud/base_client.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List<TrendingPost> moviepost = [];
  var isloaded = false;

  getMovie() async {
    moviepost = (await MovieApiClass().getMovieData())!;
    if (moviepost != null) {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isloaded,
      replacement: Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviepost.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TrendingDetail(trending: moviepost[index]),
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
                          border: Border.all(color: Colors.white),
                          image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/${moviepost[index].posterPath}',
                              ),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        moviepost[index].title,
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
      ),
    );
  }
}
