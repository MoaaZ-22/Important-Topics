// Import necessary packages and files
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

// Import the model for the Post
import '../models/post_model.dart';
// Import the repository to fetch posts
import '../repo/posts_repo.dart';

// Import the event and state classes associated with the BLoC
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  // Declare a final variable to hold the PostsRepo instance
  final PostsRepo postsRepo;

  // Constructor for the PostsBloc that takes the PostsRepo instance and sets the initial state
  PostsBloc(this.postsRepo) : super(const PostsState()) {
    // Define how the bloc should react to different events using the on method
    on<PostsEvent>((event, emit) async {
      // Check if the event is of type GetPostsEvent
      if (event is GetPostsEvent) {
        // If the current state status is loading, skip the event
        if (state.status == PostStatus.loading) {
          if (state.hasReachedMax) return;

          // Fetch posts from the repository using the getPosts method
          final result = await postsRepo.getPosts();
          // Check if the result is a Left (error) or Right (success)
          result.fold(
            // If it's a Left (error), emit an updated state with error status and error message
                  (left) => emit(state.copyWith(
                  status: PostStatus.error,
                  errorMessage: 'Failed to load posts')),
              // If it's a Right (success), emit an updated state with success status and fetched posts
                  (right) => emit(state.copyWith(
                  status: PostStatus.success,
                  posts: right,
                  hasReachedMax: false)));
        } else {
          // If the current state status is not loading, fetch more posts starting from the current number of posts
          final result =
          await postsRepo.getPosts(startIndex: state.posts.length);
          // Check if the result is a Left (error) or Right (success)
          result.fold(
            // If it's a Left (error), emit an updated state with error status and error message
                  (left) => emit(state.copyWith(
                  status: PostStatus.error,
                  errorMessage: 'Failed to load posts')),
              // If it's a Right (success), update the state with the newly fetched posts or set hasReachedMax to true if no more posts are available
                  (right) {
                if (right.isEmpty) {
                  return emit(state.copyWith(hasReachedMax: true));
                } else {
                  return emit(state.copyWith(
                      status: PostStatus.success,
                      posts: List.of(state.posts)..addAll(right),
                      hasReachedMax: false));
                }
              });
        }
      }
    }, transformer: droppable());
  }
}