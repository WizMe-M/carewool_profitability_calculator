import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../database/entity/commission.dart';
import '../../../../database/entity/cost_price.dart';
import '../../../../database/entity/storage.dart';
import '../../../../domain/util/utility_strings.dart';
import '../../../navigation/app_router.dart';

class CostPriceSelectorWidget extends StatelessWidget {
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy HH:mm');
  final List<CostPrice> costPrices;
  final CommissionUpload lastCommissionUpload;
  final StorageUpload lastStorageUpload;

  CostPriceSelectorWidget({
    required this.costPrices,
    required this.lastCommissionUpload,
    required this.lastStorageUpload,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Выберите расчёт себестоимости, на основании '
            'которого будет производиться расчёт рентабельности',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.separated(
            itemCount: costPrices.length,
            itemBuilder: (context, index) {
              var costPrice = costPrices[index];
              return ListTile(
                title: Text(
                  '${costPrice.productName} '
                  '(${costPrice.total}$rubleCurrency)',
                ),
                subtitle: Text(_dateFormat.format(costPrice.savedDate!)),
                trailing: IconButton.outlined(
                  icon: const Icon(Icons.navigate_next),
                  onPressed: () {
                    context.router.push(
                    ProfitabilityRoute(
                      costPrice: costPrice,
                      lastCommissionUpload: lastCommissionUpload,
                      lastStorageUpload: lastStorageUpload,
                    ),
                  );
                  },
                ),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
          ),
        ),
      ],
    );
  }
}
