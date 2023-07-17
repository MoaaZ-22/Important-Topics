import 'package:animation/design_patterns/Singleton/singleton_example.dart';
import 'package:animation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AdvancedTopicsApp());
}

class AdvancedTopicsApp extends StatelessWidget {
  const AdvancedTopicsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SingletonExample singletonExample1 = SingletonExample.getInstance();
    SingletonExample singletonExample2 = SingletonExample.getInstance();
    SingletonExample1 singletonExample3 = SingletonExample1();
    SingletonExample1 singletonExample4 = SingletonExample1();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startRoute,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: ThemeData(useMaterial3: true),
    );
  }
}