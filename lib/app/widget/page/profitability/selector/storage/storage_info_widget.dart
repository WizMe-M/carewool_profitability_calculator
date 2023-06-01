import 'package:flutter/material.dart';

import '../../../../../../domain/model/storage.dart';

class StorageInfoWidget extends StatelessWidget {
  final Storage storage;

  const StorageInfoWidget({required this.storage, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InputDecorator(
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              storage.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Коэффициент: ${storage.coefficientFormatted}'),
            const Divider(),
            const Text(
              'Логистика',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Базовая стоимость: ${storage.baseLogisticsFormatted}'),
            Text(
              'Дополнительная стоимость (за литр после 5-го): '
              '${storage.additionalLogisticsFormatted}',
            ),
          ],
        ),
      ),
    );
  }
}
