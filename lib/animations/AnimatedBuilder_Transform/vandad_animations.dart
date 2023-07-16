import 'package:animation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

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
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String routesName;
  final String buttonText;
  const CustomButton({
    super.key, required this.routesName, required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.lightBlue),
      onPressed: (){
      Navigator.pushNamed(context, routesName);
    },child:  Text(buttonText, style: const TextStyle(color: Colors.white),),);
  }
}
