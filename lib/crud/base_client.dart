import 'package:http/http.dart' as http;
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
