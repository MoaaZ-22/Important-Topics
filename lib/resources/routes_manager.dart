import 'package:animation/animations/AnimatedBuilder_Transform/vandad_animations.dart';
import 'package:animation/design_patterns/Adapter/adapter_view.dart';
import 'package:flutter/material.dart';

import '../animations/AnimatedBuilder_Transform/animated_builder_and_transform.dart';
import '../design_patterns/design_patterns_view.dart';
import '../start/start_view.dart';

class Routes {
  static const String startRoute = '/';
  static const String vandadAnimationRoute = '/vandadAnimationRoute';
  static const String animatedBuilderAndTransformRoute =
      '/animatedBuilderAndTransformView';
  static const String designPatternsRoute = '/designPatternsView';
  static const String adapterRoute = '/adapterView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startRoute:
        return MaterialPageRoute(builder: (context) => const StartView());
      case Routes.vandadAnimationRoute:
        return MaterialPageRoute(
            builder: (context) => const VandadAnimations());
      case Routes.animatedBuilderAndTransformRoute:
        return MaterialPageRoute(
            builder: (context) => const AnimatedBuilderAndTransform());
      case Routes.designPatternsRoute:
        return MaterialPageRoute(
            builder: (context) => const DesignPatternsView());
      case Routes.adapterRoute:
        return MaterialPageRoute(
            builder: (context) => const AdapterView());

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
