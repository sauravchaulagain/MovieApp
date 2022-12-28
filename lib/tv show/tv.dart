import 'package:flutter/material.dart';
import 'package:movieapp/Trending/trendingdetail.dart';
import 'package:movieapp/Trending/trendingmodle.dart';
import 'package:movieapp/crud/base_client.dart';

class TvPage extends StatefulWidget {
  const TvPage({Key? key}) : super(key: key);

  @override
  State<TvPage> createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {
  List<TrendingPost> Tvpost = [];
  var isloaded = false;

  getTrending() async {
    Tvpost = (await TvApiClass().getTvData())!;
    if (Tvpost != null) {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getTrending();
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
        itemCount: Tvpost.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrendingDetail(trending: Tvpost[index]),
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
                                'https://image.tmdb.org/t/p/w500/${Tvpost[index].posterPath}',
                              ),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        Tvpost[index].title,
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
