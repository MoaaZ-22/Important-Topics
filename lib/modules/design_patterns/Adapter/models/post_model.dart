abstract class IPostAPI {
  List<AdapterPostModel> getPosts();
}

class AdapterPostModel {
  final String title;
  final String bio;
  AdapterPostModel({
    required this.title,
    required this.bio,
  });
}