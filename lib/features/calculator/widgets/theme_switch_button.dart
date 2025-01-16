import 'package:flutter/material.dart';

class ThemeSwitchButton extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggle;

  const ThemeSwitchButton({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
      onPressed: onToggle,
      tooltip: 'Switch Theme',
    );
  }
}
