// ADAPTER
import 'dart:convert';

import 'models/post_model.dart';
import 'models/request_dummy_data.dart';

class PostAPI1Adapter implements IPostAPI {
  final api = PostAPI1();
  @override
  List<AdapterPostModel> getPosts() {
    final data = jsonDecode(api.getYouTubePosts()) as List;
    return data
        .map(
          (e) => AdapterPostModel(
        title: e['title'],
        bio: e['description'],
      ),
    )
        .toList();
  }
}

class PostAPI2Adapter implements IPostAPI {
  final api = PostAPI2();
  @override
  List<AdapterPostModel> getPosts() {
    final data = jsonDecode(api.getMediumPosts()) as List;
    return data
        .map(
          (e) => AdapterPostModel(
        title: e['header'],
        bio: e['bio'],
      ),
    )
        .toList();
  }
}

class PostAPI implements IPostAPI {
  final api1 = PostAPI1Adapter();
  final api2 = PostAPI2Adapter();
  @override
  List<AdapterPostModel> getPosts() {
    return api1.getPosts() + api2.getPosts();
  }
}