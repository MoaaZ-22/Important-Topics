import 'package:animation/generated/l10n.dart';
import 'package:animation/resources/assets_manager.dart';
import 'package:animation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../app/components.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  Widget build(BuildContext context) {
    List<String> bannerImage = [
      AssetsManager.vandadImage,
      AssetsManager.designPatterns,
      AssetsManager.pagination,
      AssetsManager.responsiveUI,
      AssetsManager.blocExamples
    ];
    List<String> routesNames = [
      Routes.animationExamplesRoute,
      Routes.designPatternsRoute,
      Routes.paginationRoute,
      Routes.responsiveUIRoute,
      Routes.blocExamples
    ];
    List<String> widgetTitle(context) => [
          S.of(context).vandadAnimations,
          S.of(context).designPatterns,
          S.of(context).pagination,
          S.of(context).responsiveUi,
          S.of(context).blocExamples
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
          itemBuilder: (context, index) => CoursesWidget(
                title: widgetTitle(context)[index],
                bannerImage: bannerImage[index],
                routesName: routesNames[index],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
          itemCount: bannerImage.length),
    );
  }
}
