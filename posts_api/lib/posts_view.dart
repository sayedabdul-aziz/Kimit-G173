import 'package:flutter/material.dart';
import 'package:posts_api/core/api_services.dart';

class Postsview extends StatefulWidget {
  const Postsview({super.key});

  @override
  State<Postsview> createState() => _PostsviewState();
}

class _PostsviewState extends State<Postsview> {
  @override
  void initState() {
    ApiServices.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ApiServices.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var posts = snapshot.data!;
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(posts[index].title ?? ""),
                      subtitle: Text(posts[index].body ?? ''),
                      leading: Text(posts[index].id.toString()),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: posts.length);
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
