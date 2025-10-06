import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient primary = LinearGradient(
    colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient success = LinearGradient(
    colors: [Color(0xFF00C853), Color(0xFFB2FF59)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const RadialGradient background = RadialGradient(
    colors: [Color(0xFFFFFDE7), Color(0xFFFFF59D)],
    center: Alignment.center,
    radius: 1.0,
  );

  // Button Gradients
  static const Gradient buttonPrimaryRadial = RadialGradient(
    center: Alignment(0.9, 0.4),
    radius: 2.0,
    colors: [Color(0xFFF69EA3), Color(0xFFE970C4)],
  );

  static const Gradient buttonPrimaryLinearOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xE5FEC8F1),
      Color(0x00ED92D7),
    ],
    stops: [0.0, 0.4],
  );

  static const Gradient buttonSecondaryRadial = RadialGradient(
    center: Alignment(0.9, 0.4),
    radius: 2.0,
    colors: [Color(0xFF2575FC), Color(0xFF6A11CB)],
  );

  static const Gradient buttonSecondaryLinearOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xE5ADD8E6), // Light Blue with opacity
      Color(0x002575FC),
    ],
    stops: [0.0, 0.4],
  );

  static const Gradient buttonBorder = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0x80000000), Color(0x80FFFFFF)],
    transform: GradientRotation(0.26), // 14.89 degrees
  );
}
