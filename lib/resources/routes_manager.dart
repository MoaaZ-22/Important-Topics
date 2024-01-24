import 'package:animation/modules/bloc_package/views/bloc_view.dart';
import 'package:animation/modules/bloc_package/widgets/generic_dialog_view.dart';
import 'package:animation/modules/bloc_package/widgets/login_bloc_view.dart';
import 'package:animation/modules/pagination/views/pagination_view.dart';
import 'package:animation/modules/responsive_ui/views/responsive_uI_view.dart';
import 'package:flutter/material.dart';

import '../modules/animations/ Curves_And_Clippers/curves_and_clippers.dart';
import '../modules/animations/Animated_Builder_Transform/animated_builder_and_transform.dart';
import '../modules/animations/vandad_animations.dart';
import '../modules/design_patterns/Adapter/adapter_view.dart';
import '../modules/design_patterns/design_patterns_view.dart';
import '../modules/start/start_view.dart';

class Routes {
  static const String startRoute = '/';
  static const String vandadAnimationRoute = '/vandadAnimationRoute';
  static const String animatedBuilderAndTransformRoute =
      '/animatedBuilderAndTransformView';
  static const String designPatternsRoute = '/designPatternsView';
  static const String adapterRoute = '/adapterView';
  static const String curvesAndClippersRoute = '/curvesAndClippersView';
  static const String paginationRoute = '/paginationView';
  static const String responsiveUIRoute = '/responsiveUI';
  static const String blocExamples = '/blocExamples';
  static const String authBLocView = '/authBLocView';
  static const String genericDialog = '/genericDialog';
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
        return MaterialPageRoute(builder: (context) => const AdapterView());
      case Routes.curvesAndClippersRoute:
        return MaterialPageRoute(
            builder: (context) => const CurvesAndClippers());
      case Routes.paginationRoute:
        return MaterialPageRoute(builder: (context) => const PaginationView());
      case Routes.responsiveUIRoute:
        return MaterialPageRoute(
            builder: (context) => const ResponsiveUIView());
      case Routes.blocExamples:
        return MaterialPageRoute(builder: (context) => const BlocView());
      case Routes.authBLocView:
        return MaterialPageRoute(builder: (context) => const AuthBlocView());
      case Routes.genericDialog:
        return MaterialPageRoute(
            builder: (context) => const GenericDialogView());

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
