import 'package:animation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../app/components.dart';

class DesignPatternsView extends StatelessWidget {
  const DesignPatternsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Design Patterns',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          SizedBox(
            height: 20,
          ),
          CustomButton(
            buttonText: 'Adapter',
            routesName: Routes.adapterRoute,
          )
        ],
      ),
    );
  }
}