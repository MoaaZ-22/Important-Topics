import 'package:animation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../app/components.dart';

class VandadAnimations extends StatelessWidget {
  const VandadAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Types Of Animations',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          SizedBox(height: 20,),
          CustomButton(
            buttonText: 'Animated Builder And Transform',
            routesName: Routes.animatedBuilderAndTransformRoute,
          ),
          SizedBox(height: 20,),
          CustomButton(
            buttonText: ' Curves and Clippers ',
            routesName: Routes.curvesAndClippersRoute,
          )
        ],
      ),
    );
  }
}