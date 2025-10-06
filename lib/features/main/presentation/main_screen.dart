import 'package:design_challenge/app/assets.dart';
import 'package:design_challenge/features/detail/presentation/detail_screen.dart';
import 'package:design_challenge/routes/app_routes.dart';
import 'package:design_challenge/shared/widgets/glass_card.dart';
import 'package:design_challenge/shared/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

import '/shared/widgets/glass_chip.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categories = [
      "All Categories",
      "Salty",
      "Sweet",
      "Spicy",
      "Bitter",
      "Sour",
      "Umami",
    ];
    final List<Map<String, dynamic>> productData = [
      {
        "id": 1,
        "name": "Mogli's Cup",
        "subtitle": "Strawberry ice cream",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl eget aliquam aliquet, nisl nisl aliquam nisl, eget aliquam nisl nisl eget nisl.",
        "price": 8.99,
        "image": "assets/images/cupcake_cat.png",
        "likes": 200
      },
      {
        "id": 2,
        "name": "Balu's Cup",
        "subtitle": "Pistachio ice cream",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl eget aliquam aliquet, nisl nisl aliquam nisl, eget aliquam nisl nisl eget nisl.",
        "price": 8.99,
        "image": "assets/images/icecream.png",
        "likes": 165
      },
      {
        "id": 3,
        "name": "Smiling David",
        "subtitle": "Coffee ice cream",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl eget aliquam aliquet, nisl nisl aliquam nisl, eget aliquam nisl nisl eget nisl.",
        "price": 3.99,
        "image": "assets/images/icecream_stick.png",
        "likes": 310
      },
      {
        "id": 4,
        "name": "Kai in a Cone",
        "subtitle": "A box of cookies",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl eget aliquam aliquet, nisl nisl aliquam nisl, eget aliquam nisl nisl eget nisl.",
        "price": 3.99,
        "image": "assets/images/icecream_cone.png",
        "likes": 290
      },
    ];

    return Stack(
        children: [
          // SvgPicture.asset(AppAssets.bg, alignment: Alignment.topCenter),
          // SvgPicture.asset(AppAssets.swoosh, alignment: Alignment.topCenter),
          Image.asset(AppAssets.bgMain),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    "Choose Your Favorite \nSnack",
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: categories.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final label = categories[index];
                      final selected = index == _selectedIndex;

                      return GlassChip(
                        label: label,
                        selected: selected,
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                          debugPrint("Ausgewählt: $label");
                        },
                        borderRadius: BorderRadius.circular(30),
                        selectedTextColor: const Color.fromRGBO(48, 44, 35, 1),
                        leading: index == 0
                            ? Icon(Icons.restaurant, color: selected ? const Color.fromRGBO(48, 44, 35, 1) : Colors.white70, size: 18)
                            : null,
                        trailing: index == 0
                            ? Icon(Icons.keyboard_arrow_down, color: selected ? const Color.fromRGBO(48, 44, 35, 1) : Colors.white70, size: 18)
                            : null,
                      );
                    },
                  ),
                ),
                const Spacer(),
                Container(
                  height: 260,
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GlassCard(
                        tilted: true,
                        opacity: 0.04,
                        padding: const EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Angi’s Yummy Burger ', style: theme.textTheme.headlineMedium),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: EdgeInsetsGeometry.only(right: 180),
                                    child: Text('Delish vegan burger that tastes like heaven', style: theme.textTheme.bodyMedium),
                                  ),
                                  SizedBox(height: 8),
                                  Text('13.99 €', style: theme.textTheme.labelLarge),
                                  const Spacer(),
                                  GradientButton(
                                    onPressed: () {},
                                    child: Text('Add to order'),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: Color.fromRGBO(234, 113, 197, 1), size: 15),
                                  const SizedBox(width: 4),
                                  Text('4.8')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -30, right: 0,
                        child: Image.asset('assets/images/burger.png', width: 217, height: 217)
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('We Recommend', style: theme.textTheme.displaySmall),
                ),
                SizedBox(
                  height: 260,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: productData.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 24),
                    itemBuilder: (context, index) {
                      final product = productData[index];
                      final productId = product['id'];

                      return GlassCard(
                        onTap: () {
                          context.push(
                            '${AppRoutes.main.path}/detail/$productId',
                            extra: product,
                          );
                        },
                        opacity: 0.5,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.9, -1.0),
                            end: Alignment(-0.9, 1.0),
                            colors: [
                              Colors.white.withValues(alpha: 0),
                              const Color.fromRGBO(144, 140, 245, 0.74),
                              const Color.fromRGBO(140, 91, 234, 0.74),
                            ],
                            stops: const [0.0, 0.47, 0.96],
                          ),
                        ),
                        child: SizedBox(
                          width: 190,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('${product['image']}', width: 154, height: 154, fit: BoxFit.cover),
                              Text('${product['name']}', style: theme.textTheme.headlineMedium),
                              Text('${product['subtitle']}', style: theme.textTheme.bodyMedium),
                              const Spacer(),
                              Row(
                                children: [
                                  Text('${product['price']} €', style: theme.textTheme.labelLarge),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      const Icon(Icons.favorite_outline, size: 16, color: Colors.white),
                                      const SizedBox(width: 4),
                                      Text('${product['likes']}'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
    );
  }
}
