import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/tv%20show/tv_detail.dart';
import 'package:movieapp/tv%20show/tv_modle.dart';

class TVPage extends StatefulWidget {
  const TVPage({Key? key}) : super(key: key);

  @override
  State<TVPage> createState() => _TVPageState();
}

class _TVPageState extends State<TVPage> {
  List<TvList> TvPosts = [];
  Future<List<TvList>> getTvData() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/sauravchaulagain/MovieApp/commit2/assets/tv.json'));
    var data = jsonDecode(response.body);

    for (Map<String, dynamic> index in data) {
      TvPosts.add(TvList.fromJson(index));
    }
    return TvPosts;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTvData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: TvPosts.length,
            itemBuilder: (context, index) {
              print(TvPosts);
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TvDetail(tv: TvPosts[index]),
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
                                        TvPosts[index].posterPath,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            '${TvPosts[index].title}',
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
    );
  }
}
