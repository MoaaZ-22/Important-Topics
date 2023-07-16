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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startView,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: ThemeData(useMaterial3: true),
    );
  }
}