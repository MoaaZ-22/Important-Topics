// ignore_for_file: unused_field, library_private_types_in_public_api

import 'dart:ui';

import 'package:animation/modules/animations/Frzbi_Admin_Animation/all_frzbi_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

class FrzbiAdminAnimationView extends StatelessWidget {
  const FrzbiAdminAnimationView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: GestureDetector(
        onVerticalDragDown: (details) {
          // Check if drag is upwards and significant
          if (true) {
            Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const AllFrzbiItemView(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(0.0, 1.0);
                    var end = Offset.zero;
                    var curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ));
          }
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            DefaultContainer(
              color: Colors.grey[300]!,
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Expanded(
                  child: DefaultContainer(
                    height: 15,
                    color: Colors.yellowAccent.shade100,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                const Expanded(
                  child: DefaultContainer(
                    height: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Hero(
              tag: 'toggleBar',
              child: DefaultContainer(
                color: Colors.grey[300]!,
                height: 6,
                borderRadius: 14,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            const SizedBox(height: 280, child: GlassmorphismCardStack()),
          ],
        ),
      ),
    );
  }
}

class FrzbiAdminAnimationView2 extends StatefulWidget {
  const FrzbiAdminAnimationView2({super.key});

  @override
  State<FrzbiAdminAnimationView2> createState() =>
      _FrzbiAdminAnimationView2State();
}

class _FrzbiAdminAnimationView2State extends State<FrzbiAdminAnimationView2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final ScrollController _scrollController = ScrollController();
  bool _showFullAppBar = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 50 && _showFullAppBar) {
      setState(() {
        _showFullAppBar = false;
      });
      _controller.forward();
    } else if (_scrollController.offset < 50 && !_showFullAppBar) {
      setState(() {
        _showFullAppBar = true;
      });
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        slivers: [
          if (_showFullAppBar)
            SliverAppBar(
              leadingWidth: 8,
              leading: const SizedBox(),
              centerTitle: false,
              toolbarHeight: 45.h,
              title: Column(
                children: [
                  DefaultContainer(
                    color: Colors.grey[300]!,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DefaultContainer(
                          height: 15,
                          color: Colors.yellowAccent.shade100,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Expanded(
                        child: DefaultContainer(
                          height: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  top: _showFullAppBar ? 0 : 80,
                  left: 24,
                  right: 24,
                  bottom: _showFullAppBar ? 24 : 0),
              child: Hero(
                tag: 'toggleBar',
                child: DefaultContainer(
                  color: Colors.grey[300]!,
                  height: 6,
                  borderRadius: 14,
                ),
              ),
            ),
          ),

          SliverList.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 2.h,
            ),
            itemBuilder: (context, index) {
              Widget child;
              if (_showFullAppBar && index == 0) {
                // Your custom widget for the first item
                child = const SizedBox(
                  height: 280,
                  child:
                      GlassmorphismCardStack(), // Assume this is your custom widget
                );
              } else {
                // Other items in the list
                child = const GlassMorphismCard(
                  blurAmount: 10,
                  widthFactor: 1.0, // Front card is the fullest in width
                  child: ContentOfCard(
                    title: 'Spain Package',
                    weight: '22 KG',
                    date: '12 OCT',
                    bids: '+22 Bids',
                  ),
                );
              }

              return SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(
                            0, 0.2), // Slightly down to up animation
                        end: const Offset(0, -0.2))
                    .animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves
                        .fastOutSlowIn, // Adjust the curve for a smooth effect
                  ),
                ),
                child: child,
              );
            },
            itemCount: _showFullAppBar ? 1 : 20, // Adjust based on your logic
          ),

          // SliverPadding(
          //   padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          //   sliver: SliverList.separated(
          //     separatorBuilder: (context, index) => SizedBox(
          //       height: 2.h,
          //     ),
          //     itemBuilder: (context, index) {
          //       // Return your list item widget here
          //       // Check if you should show the GlassmorphismCardStack or a list item
          //       if (_showFullAppBar && index == 0) {
          //         return const SizedBox(
          //             height: 280,
          //             child: GlassmorphismCardStack()); // Your custom widget
          //       } else {
          //         return const GlassMorphismCard(
          //           blurAmount: 10,
          //           widthFactor: 1.0, // Front card is the fullest in width
          //           child: ContentOfCard(
          //               title: 'Spain Package',
          //               weight: '22 KG',
          //               date: '12 OCT',
          //               bids: '+22 Bids'),
          //         );
          //       }
          //     },
          //     // Adjust the child count based on your needs
          //     itemCount: _showFullAppBar ? 1 : 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class DefaultContainer extends StatelessWidget {
  const DefaultContainer({
    super.key,
    this.height = 8,
    this.width = double.infinity,
    this.color = Colors.grey,
    this.borderRadius = 30,
  });

  final double height;
  final double width;
  final Color color;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

class GlassmorphismCardStack extends StatelessWidget {
  const GlassmorphismCardStack({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        // This card will be fully blurred and not visible
        Positioned(
          top: 30,
          child: Hero(
            tag: 'thirdItem',
            child: Opacity(
              opacity: 0.4, // Set to zero to make the card invisible
              child: GlassMorphismCard(
                blurAmount: 20,
                widthFactor: 0.9, // Adjust width for perspective
                child: ContentOfCard(
                    title: 'Spain Package',
                    weight: '22 KG',
                    date: '12 OCT',
                    bids: '+22 Bids'),
              ),
            ),
          ),
        ),
        // This card will also be fully blurred and not visible
        Positioned(
          top: 60,
          child: Hero(
            tag: 'secondItem',
            child: Opacity(
              opacity: 0.2, // Set to zero to make the card invisible
              child: GlassMorphismCard(
                blurAmount: 20,
                widthFactor: 0.8, // Adjust width for perspective
                child: ContentOfCard(
                    title: 'Spain Package',
                    weight: '22 KG',
                    date: '12 OCT',
                    bids: '+22 Bids'),
              ),
            ),
          ),
        ),
        // This card will be visible with moderate blur
        Hero(
          tag: 'firstItem',
          child: GlassMorphismCard(
            blurAmount: 10,
            widthFactor: 1.0, // Front card is the fullest in width
            child: ContentOfCard(
                title: 'Spain Package',
                weight: '22 KG',
                date: '12 OCT',
                bids: '+22 Bids'),
          ),
        ),
      ],
    );
  }
}

class GlassMorphismCard extends StatelessWidget {
  final double blurAmount;
  final double widthFactor; // Add width factor to adjust the card size in stack
  final Widget child;

  const GlassMorphismCard({
    super.key,
    required this.blurAmount,
    required this.widthFactor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
        child: Container(
          height: 150.0,
          width: 90.w * widthFactor, // Use width factor for responsive width
          decoration: BoxDecoration(
            color: const Color(0x0D004638).withOpacity(0.5), // Adjust opacity
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class ContentOfCard extends StatelessWidget {
  final String title;
  final String weight;
  final String date;
  final String bids;

  const ContentOfCard({
    super.key,
    required this.title,
    required this.weight,
    required this.date,
    required this.bids,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Here you can add your text and styling
          Text(title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none)),
          const SizedBox(height: 6),
          Text(weight,
              style: const TextStyle(
                  fontSize: 18, decoration: TextDecoration.none)),
          const SizedBox(height: 6),
          Text(date,
              style: const TextStyle(
                  fontSize: 16, decoration: TextDecoration.none)),
          const SizedBox(height: 6),
          Text(bids,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.none)),
        ],
      ),
    );
  }
}

class PackageListAnimation extends StatefulWidget {
  const PackageListAnimation({super.key});

  @override
  _PackageListAnimationState createState() => _PackageListAnimationState();
}

class _PackageListAnimationState extends State<PackageListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  /// 
  /// 
  late List<Map> _packages; // Assuming you have a list of package details
  bool _isSpreadOut = false; // This flag will track the spread out state
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _packages = [
      {
        'image':
            'https://m.media-amazon.com/images/I/810b6y6rZ7S.__AC_SX300_SY300_QL70_ML2_.jpg', // Placeholder image asset name
        'destination': 'Spain Package',
        'weight': '22 KG',
        'date': '12 OCT',
        'bids': '22',
      },
      {
        'image':
            'https://m.media-amazon.com/images/I/810b6y6rZ7S.__AC_SX300_SY300_QL70_ML2_.jpg', // Another placeholder image asset name
        'destination': 'France Package',
        'weight': '15 KG',
        'date': '18 OCT',
        'bids': '18',
      },
      {
        'image':
            'https://m.media-amazon.com/images/I/810b6y6rZ7S.__AC_SX300_SY300_QL70_ML2_.jpg', // Placeholder image asset name
        'destination': 'Spain Package',
        'weight': '22 KG',
        'date': '12 OCT',
        'bids': '22',
      },
      {
        'image':
            'https://m.media-amazon.com/images/I/810b6y6rZ7S.__AC_SX300_SY300_QL70_ML2_.jpg', // Another placeholder image asset name
        'destination': 'France Package',
        'weight': '15 KG',
        'date': '18 OCT',
        'bids': '18',
      },
      {
        'image':
            'https://m.media-amazon.com/images/I/810b6y6rZ7S.__AC_SX300_SY300_QL70_ML2_.jpg', // Placeholder image asset name
        'destination': 'Spain Package',
        'weight': '22 KG',
        'date': '12 OCT',
        'bids': '22',
      },
      {
        'image':
            'https://m.media-amazon.com/images/I/810b6y6rZ7S.__AC_SX300_SY300_QL70_ML2_.jpg', // Another placeholder image asset name
        'destination': 'France Package',
        'weight': '15 KG',
        'date': '18 OCT',
        'bids': '18',
      }
    ];
    _scrollController.addListener(_scrollListener);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Consider a longer duration
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _isSpreadOut =
                true; // Set the flag to true when animation completes
          });
        } else if (status == AnimationStatus.dismissed) {
          setState(() {
            _isSpreadOut =
                false; // Set the flag to false when animation reverses
          });
        }
      });
  }

  // This method will be called when the user scrolls
  void _scrollListener() {
    // Check if we are scrolling down
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!_controller.isAnimating) {
        _controller.forward();
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_controller.isAnimating) {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          DefaultContainer(
            color: Colors.grey[300]!,
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Expanded(
                child: DefaultContainer(
                  height: 15,
                  color: Colors.yellowAccent.shade100,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              const Expanded(
                child: DefaultContainer(
                  height: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              separatorBuilder: (context, index) => SizedBox(
                height: 2.h,
              ),
              itemBuilder: (context, index) {
                // Return your list item widget here
                // Check if you should show the GlassmorphismCardStack or a list item
                if (!_isSpreadOut) {
                  return const SizedBox(
                      height: 280,
                      child: GlassmorphismCardStack()); // Your custom widget
                } else {
                  return GlassMorphismCard(
                    blurAmount: 1.0 - _animation.value,
                    widthFactor: 1.0, // Front card is the fullest in width
                    child: const ContentOfCard(
                        title: 'Spain Package',
                        weight: '22 KG',
                        date: '12 OCT',
                        bids: '+22 Bids'),
                  );
                }
              },
              // Adjust the child count based on your needs
              itemCount: !_isSpreadOut ? 1 : 20,
            ),
          ),
        ],
      ),
    );
  }
}
