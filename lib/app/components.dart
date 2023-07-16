import 'package:flutter/material.dart';

class CoursesWidget extends StatelessWidget {
  final String routesName;
  final String bannerImage;
  final String title;

  const CoursesWidget({
    super.key,
    required this.bannerImage,
    required this.title,
    required this.routesName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.pushNamed(context, routesName);
      },
      child: Card(
        child: Container(
          height: 180,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    bannerImage,
                    height: 120,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
              const SizedBox(
                height: 16,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )
            ],
          ),
        ),
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
