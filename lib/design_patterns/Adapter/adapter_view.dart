import 'package:animation/design_patterns/Adapter/adapter.dart';
import 'package:flutter/material.dart';

class AdapterView extends StatelessWidget {
  const AdapterView({super.key});

  @override
  Widget build(BuildContext context) {
    final postApi = PostAPI();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Adapter',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        itemCount: postApi.getPosts().length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          itemBuilder: (context, index) => ListTile(
                title: Text(postApi.getPosts()[index].title),
            subtitle: Text(postApi.getPosts()[index].bio),
              )),
    );
  }
}
