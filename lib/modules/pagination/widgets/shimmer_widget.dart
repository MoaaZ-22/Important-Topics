import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostsShimmerLoading extends StatelessWidget {
  const PostsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListTile(
          leading: Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          title: Container(
            width: double.infinity,
            height: 16,
            color: Colors.white,
          ),
          subtitle: Container(
            width: double.infinity,
            height: 16,
            color: Colors.white,
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
