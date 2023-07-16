import 'package:animation/resources/assets_manager.dart';
import 'package:animation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  Widget build(BuildContext context) {
    List<String> bannerImage = [AssetsManager.vandadImage];
    List<String> routesNames = [Routes.vandadAnimation];
    List<String> widgetTitle = [
      'Vandad Animations',
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Self Study',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) =>
              CoursesWidget(
                  title: widgetTitle[index],
                  bannerImage: bannerImage[index], routesName: routesNames[index],),
          separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
          itemCount: bannerImage.length),
    );
  }
}

class CoursesWidget extends StatelessWidget {
  final String routesName;
  final String bannerImage;
  final String title;

  const CoursesWidget({
    super.key,
    required this.bannerImage, required this.title, required this.routesName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: (){
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
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}
