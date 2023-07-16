import 'package:animation/animations/modules/vandad_animations.dart';
import 'package:flutter/material.dart';

import '../animations/modules/AnimatedBuilder_Transform/animated_builder_and_transform.dart';
import '../start/start_view.dart';

class Routes {
  static const String startView = '/';
  static const String vandadAnimation = '/vandadAnimationRoute';
  static const String animatedBuilderAndTransformRoute =
      '/animatedBuilderAndTransformView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startView:
        return MaterialPageRoute(builder: (context) => const StartView());
      case Routes.vandadAnimation:
        return MaterialPageRoute(
            builder: (context) => const VandadAnimations());
      case Routes.animatedBuilderAndTransformRoute:
        return MaterialPageRoute(
            builder: (context) => const AnimatedBuilderAndTransform());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Routes Manager'),
              ),
              body: const Center(child: Text('No routes found')),
            ));
  }
}
