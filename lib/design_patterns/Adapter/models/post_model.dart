abstract class IPostAPI {
  List<Post> getPosts();
}

class Post {
  final String title;
  final String bio;
  Post({
    required this.title,
    required this.bio,
  });
}