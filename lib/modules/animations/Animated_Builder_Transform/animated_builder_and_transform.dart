import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimatedBuilderAndTransform extends StatefulWidget {
  const AnimatedBuilderAndTransform({super.key});

  @override
  State<AnimatedBuilderAndTransform> createState() =>
      _AnimatedBuilderAndTransformState();
}

class _AnimatedBuilderAndTransformState
    extends State<AnimatedBuilderAndTransform>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // Initialize the AnimationController with a duration of 5 seconds
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // Create an animation that goes from 0.0 to 2 * pi (a full rotation)
    animation = Tween(begin: 0.0, end: 2 * pi).animate(controller);

    // Make the animation repeat indefinitely
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the AnimationController when the state is disposed
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*
        0.0 = 0 degrees
        0.5 = 180 degrees
        0.5 = 360 degrees
    */

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          // AnimatedBuilder widget rebuilds itself whenever the animation value changes
          builder: (context, child) {
            // Apply a rotation transform to the child widget based on the animation value
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(animation.value),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ]),
              ),
            );
          },
          // Pass the AnimationController to the animated widget
          animation: controller,
        ),
      ),
    );
  }
}
