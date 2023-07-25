import 'package:animation/helpers/service_locator.dart';
import 'package:animation/modules/pagination/widgets/post_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/posts_bloc.dart';
import '../widgets/shimmer_widget.dart';

class PaginationView extends StatefulWidget {
  const PaginationView({super.key});

  @override
  State<PaginationView> createState() => _PaginationViewState();
}

class _PaginationViewState extends State<PaginationView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
  }

  void _onScroll() {
    final _maxScroll = _scrollController.position.maxScrollExtent;
    final _currentScroll = _scrollController.offset;
    if (_currentScroll >= (_maxScroll * 0.9)) {
      context.read<PostsBloc>().add(GetPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(getIt())..add(GetPostsEvent()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Posts',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            switch (state.status) {
              case PostStatus.loading:
                return ListView.separated(
                    itemBuilder: (context, index) =>
                        const PostsShimmerLoading(),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                    itemCount: 10);
              case PostStatus.success:
                return ListView.separated(
                    itemBuilder: (context, index) =>
                        PostListItem(post: state.posts[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                    itemCount: state.posts.length);
              case PostStatus.error:
                return Center(child: Text(state.errorMessage));
            }
          },
        ),
      ),
    );
  }
}
