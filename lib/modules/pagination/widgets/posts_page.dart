import 'package:animation/modules/pagination/widgets/post_list_item.dart';
import 'package:animation/modules/pagination/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/posts_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({
    super.key,
  });

  @override
  State<PostsPage> createState() =>
      _PostsPageState(); // Creating the state for the PostsPage
}

class _PostsPageState extends State<PostsPage> {
  final _scrollController =
      ScrollController(); // ScrollController to track the scrolling behavior

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
        _onScroll); // Adding a scroll listener to the ScrollController
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose(); // Removing the scroll listener and disposing the ScrollController
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController
        .position.maxScrollExtent; // Getting the maximum scroll extent
    final currentScroll =
        _scrollController.offset; // Getting the current scroll offset
    if (currentScroll >= (maxScroll * 0.7)) {
      // If the user has scrolled 70% of the page, trigger an event to get more posts
      context.read<PostsBloc>().add(GetPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.loading:
            // Display a list of shimmer loading widgets while loading posts
            return ListView.separated(
                itemBuilder: (context, index) => const PostsShimmerLoading(),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount: 10);
          case PostStatus.success:
            // Display the list of posts if loading is successful
            if (state.posts.isEmpty) {
              return const Center(
                child: Text('No Posts'),
              ); // If there are no posts, display a message
            } else {
              return ListView.separated(
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    // Create a list of PostListItems for each post
                    return index >= state.posts.length
                        ? const PostsShimmerLoading() // Display shimmer loading for additional items that are not loaded yet
                        : PostListItem(post: state.posts[index]);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                  // if list has reached max length then hide shimmer
                  itemCount: state.hasReachedMax
                      ? state.posts.length
                      : state.posts.length + 1);
            }
          case PostStatus.error:
            return Center(
                child: Text(state
                    .errorMessage)); // If there's an error, display an error message
        }
      },
    );
  }
}
