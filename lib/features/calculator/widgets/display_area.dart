import 'package:flutter/material.dart';

class DisplayArea extends StatelessWidget {
  final String input;
  final String result;

  const DisplayArea({
    super.key,
    required this.input,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            input,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            result,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              // ignore: deprecated_member_use
              color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7),
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
