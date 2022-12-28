import 'package:http/http.dart' as http;
import 'package:movieapp/Trending/trendingmodle.dart';
import 'package:movieapp/crud/newmodel.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://raw.githubusercontent.com/sauravchaulagain/MovieApp/main/assets/trending.json');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}

class TrendingApiClass {
  Future<List<TrendingPost>?> getTrendingData() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://raw.githubusercontent.com/sauravchaulagain/MovieApp/main/assets/trending.json');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return trendingPostFromJson(json);
    }
  }
}

class MovieApiClass {
  Future<List<TrendingPost>?> getMovieData() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://raw.githubusercontent.com/sauravchaulagain/MovieApp/main/assets/movie.json');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return trendingPostFromJson(json);
    }
  }
}

class TvApiClass {
  Future<List<TrendingPost>?> getTvData() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://raw.githubusercontent.com/sauravchaulagain/MovieApp/main/assets/tv.json');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return trendingPostFromJson(json);
    }
  }
}
