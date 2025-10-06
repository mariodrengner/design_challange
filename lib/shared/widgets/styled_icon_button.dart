import 'package:flutter/material.dart';

class StyledIconButton extends StatelessWidget {
  const StyledIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints.tight(const Size(30, 30)),
      style: IconButton.styleFrom(
        backgroundColor: Colors.white.withAlpha(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        side: const BorderSide(color: Colors.white12, width: 1),
      ),
      icon: Icon(icon, color: Colors.white70, size: 20),
      onPressed: onPressed,
    );
  }
}
