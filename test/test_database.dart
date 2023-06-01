import 'dart:io';

import 'package:carewool_profitability_calculator/database/entity/commission.dart';
import 'package:carewool_profitability_calculator/database/entity/cost_price.dart';
import 'package:carewool_profitability_calculator/database/entity/profitability.dart';
import 'package:carewool_profitability_calculator/database/entity/storage.dart';
import 'package:carewool_profitability_calculator/database/simple_taxation_system_enum.dart';
import 'package:isar/isar.dart';

Future<Isar> initTestDatabase() async {
  await Isar.initializeIsarCore(download: true);

  await Directory('/test_db').create(recursive: true);

  var isar = await Isar.open(
    [
      CostPriceSchema,
      CommissionUploadSchema,
      CommissionSchema,
      StorageUploadSchema,
      StorageSchema,
      ProfitabilityCalcSchema,
    ],
    directory: '/test_db',
  );
  await isar.writeTxn(() async {
    await isar.clear();

    var costPrice = CostPrice(
      'test product',
      DateTime.now(),
      [
        Block.withValues('logistics', [
          Part.withValues('direct', 10),
          Part.withValues('reverse', 10),
        ]),
        Block.withValues('manufacture', [
          Part.withValues('cap', 10),
          Part.withValues('form', 10),
          Part.withValues('fill', 10),
        ]),
      ],
      50,
    );

    var profitability = ProfitabilityCalc.withValues(
      DateTime.now(),
      14,
      Size.withValues(12, 15, 20),
      Pricing.withValues(200, 5, 10),
      SimpleTaxationSystem.perIncome,
    );

    await isar.costPrices.put(costPrice);
    await isar.profitabilityCalcs.put(profitability);
  });
  return isar;
}
