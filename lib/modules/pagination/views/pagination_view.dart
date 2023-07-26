import 'package:animation/helpers/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/posts_bloc.dart';
import '../widgets/posts_page.dart';

class PaginationView extends StatelessWidget {
  const PaginationView({super.key});

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
        body: const PostsPage(),
      ),
    );
  }
}