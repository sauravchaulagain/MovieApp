import 'package:flutter/material.dart';
import 'package:movieapp/crud/base_client.dart';

import 'newmodel.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({Key? key}) : super(key: key);

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  List<Post> posts = [];
  var isloaded = false;
  getData() async {
    posts = (await RemoteService().getPosts())!;
    if (posts != null) {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Visibility(
      replacement: Center(child: CircularProgressIndicator()),
      visible: isloaded,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            //   trailing: Image.network('https://image.tmdb.org/t/p/w500/' +
            //       posts?[index].backdropPath),
            title: Text('${posts[index].title}'),
            leading: Image.network(
                'https://image.tmdb.org/t/p/w500/' + posts[index].backdropPath),
          );
        },
      ),
    ));
  }
}
