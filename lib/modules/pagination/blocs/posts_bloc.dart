import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../models/post_model.dart';
import '../repo/posts_repo.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepo postsRepo;

  PostsBloc(this.postsRepo) : super(const PostsState()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetPostsEvent) {
        if (state.status == PostStatus.loading) {
          if (state.hasReachedMax) return;
          final result = await postsRepo.getPosts();
          result.fold(
              (left) => emit(state.copyWith(
                  status: PostStatus.error,
                  errorMessage: 'Failed to load posts')),
              (right) => emit(state.copyWith(
                  status: PostStatus.success,
                  posts: right,
                  hasReachedMax: false)));
        } else {
          final result =
              await postsRepo.getPosts(startIndex: state.posts.length);
          result.fold(
              (left) => emit(state.copyWith(
                  status: PostStatus.error,
                  errorMessage: 'Failed to load posts')), (right) {
            if (right.isEmpty) {
              emit(state.copyWith(hasReachedMax: true));
            } else {
              emit(state.copyWith(
                  status: PostStatus.success,
                  posts: List.of(state.posts)..addAll(right),
                  hasReachedMax: false));
            }
          });
        }
      }
    });
  }
}
