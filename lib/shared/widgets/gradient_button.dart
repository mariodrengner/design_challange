import 'package:design_challenge/app/theme/app_colors.dart';
import 'package:design_challenge/app/theme/app_gradients.dart';
import 'package:flutter/material.dart';

enum GradientButtonType { primary, secondary }

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height = 48,
    this.width = double.infinity,
    this.padding,
    this.type = GradientButtonType.primary,
  });

  final VoidCallback onPressed;
  final Widget child;
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final GradientButtonType type;

  @override
  Widget build(BuildContext context) {
    final isPrimary = type == GradientButtonType.primary;

    return Stack(
      children: [
        Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: AppGradients.buttonBorder,
              boxShadow: [
                BoxShadow(
                  color: isPrimary
                      ? AppColors.buttonPrimaryShadow
                      : AppColors.buttonSecondaryShadow,
                  offset: const Offset(0, 10),
                  blurRadius: 30.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0), // Border width
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  gradient: isPrimary
                      ? AppGradients.buttonPrimaryRadial
                      : AppGradients.buttonSecondaryRadial,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onPressed,
                    borderRadius: BorderRadius.circular(9),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            gradient: isPrimary
                                ? AppGradients.buttonPrimaryLinearOverlay
                                : AppGradients.buttonSecondaryLinearOverlay,
                          ),
                        ),
                        Padding(
                          padding: padding ?? EdgeInsets.zero,
                          child: Center(child: child),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
