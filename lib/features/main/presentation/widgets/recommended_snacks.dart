import 'package:design_challenge/app/theme/app_colors.dart';
import 'package:design_challenge/features/main/data/snack_data.dart';
import 'package:design_challenge/routes/app_routes.dart';
import 'package:design_challenge/shared/widgets/glass_card.dart';
import 'package:design_challenge/shared/widgets/price_display.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecommendedSnacks extends StatelessWidget {
  const RecommendedSnacks({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('We Recommend', style: theme.textTheme.displaySmall),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.33,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: productData.length,
            separatorBuilder: (context, index) => const SizedBox(width: 24),
            itemBuilder: (context, index) {
              final product = productData[index];
              final productId = product['id'];

              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.48,
                child: GlassCard(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          '${product['image']}',
                          width: 154,
                          height: 154,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${product['name']}',
                        style: theme.textTheme.headlineMedium,
                      ),
                      Text(
                        '${product['subtitle']}',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          PriceDisplay(
                            price: product['price'],
                            style: theme.textTheme.labelLarge,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite_outline,
                                size: 16,
                                color: AppColors.textGrey60,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${product['likes']}',
                                style: theme.textTheme.bodyLarge,
                              ),
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
    );
  }
}
