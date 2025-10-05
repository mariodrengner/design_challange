import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height = 50,
    this.padding,
  });

  final VoidCallback onPressed;
  final Widget child;
  final double height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0x80000000), Color(0x80FFFFFF)],
          transform: GradientRotation(0.26), // 14.89 degrees
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x80EA71C5),
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
            gradient: const RadialGradient(
              center: Alignment(0.9, 0.4),
              radius: 2.0,
              colors: [Color(0xFFF69EA3), Color(0xFFE970C4)],
            ),
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
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xE5FEC8F1),
                          Color(0x00ED92D7),
                        ],
                        stops: [0.0, 0.4],
                      ),
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
    );
  }
}
