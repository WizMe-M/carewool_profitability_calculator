import 'package:flutter/material.dart';

import '../../../../../../database/entity/storage.dart';

class StorageInfoWidget extends StatelessWidget {
  final Storage storage;

  const StorageInfoWidget({required this.storage, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...storage.tariffs.map((tariff) {
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
                    tariff.name!,
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
                  Text(
                    'Базовая стоимость: '
                    '${tariff.baseCost == null ? 'Не принимает' : '${tariff.baseCost}руб.'}',
                  ),
                  Text(
                    'Доп. стоимость: '
                    '${tariff.costPerLiter == null ? 'Не принимает' : '${tariff.costPerLiter}руб.'}',
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
