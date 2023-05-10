import 'package:flutter/material.dart';

import '../../../../domain/start_new_profitability/load_error.dart';

class LoadErrorWidget extends StatelessWidget {
  final LoadError error;

  const LoadErrorWidget({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              error.errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text(error.errorButtonText),
              onPressed: () => error.onTap,
            ),
          ],
        ),
      ),
    );
  }
}
