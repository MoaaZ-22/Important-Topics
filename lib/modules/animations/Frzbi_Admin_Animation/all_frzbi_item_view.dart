import 'package:animation/modules/animations/Frzbi_Admin_Animation/frzbi_admin_animation_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AllFrzbiItemView extends StatelessWidget {
  const AllFrzbiItemView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> heroTitle = [
      'firstItem',
      'secondItem',
      'thirdItem',
    ];
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        leading: const SizedBox(),
        centerTitle: false,
        toolbarHeight: 12.h,
        title: const Text(
          'Frzbi Admin',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Hero(
              tag: 'toggleBar',
              child: DefaultContainer(
                color: Colors.grey[300]!,
                height: 6,
                borderRadius: 14,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              separatorBuilder: (context, index) => SizedBox(
                height: 2.h,
              ),
              itemBuilder: (context, index) {
                return Hero(
                  tag: heroTitle[index],
                  child: const GlassMorphismCard(
                    blurAmount: 20,
                    widthFactor: 0.8,
                    child: ContentOfCard(
                        title: 'Spain Package',
                        weight: '22 KG',
                        date: '12 OCT',
                        bids: '+22 Bids'),
                  ),
                );
              },
              itemCount: 3,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back')),
          SizedBox(
            height: 3.h,
          ),
        ],
      ),
    );
  }
}
