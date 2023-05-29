import 'package:carewool_profitability_calculator/database/entity/cost_price.dart';
import 'package:carewool_profitability_calculator/domain/data_transfer/json/data_to_export_enum.dart';
import 'package:carewool_profitability_calculator/domain/data_transfer/json/db_json_factory.dart';
import 'package:carewool_profitability_calculator/domain/data_transfer/json/db_json_loader.dart';
import 'package:carewool_profitability_calculator/domain/data_transfer/json/structure/database_data.dart';
import 'package:carewool_profitability_calculator/domain/data_transfer/json/structure/json_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:shouldly/shouldly.dart';

import 'test_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I
    ..registerSingleton(Logger())
    ..registerSingletonAsync(() => initTestDatabase())
    ..registerSingletonWithDependencies(
      () => DbJsonFactory(),
      dependsOn: [Isar],
    )
    ..registerSingletonWithDependencies(
      () => DbJsonLoader(),
      dependsOn: [Isar],
    );
  await GetIt.I.allReady();

  group('db-tests', () {
    group('export', () {
      var factory = GetIt.I.get<DbJsonFactory>();

      test('export cost prices collection', () async {
        var copy = await factory.createDatabaseJsonCopy(toExport: {
          DataToExport.costPriceCalculations,
        });

        copy.should.containKey(dataToExportKey);
        copy.should.containKey(DataToExport.costPriceCalculations.blockName);
        copy.should.not.containKey(
          DataToExport.profitabilityCalculations.blockName,
        );

        var toExport = copy[dataToExportKey] as List<String>;
        var found = copy[DataToExport.costPriceCalculations.blockName]
            as List<Map<String, dynamic>>;

        toExport.should.haveCount(1);
        found.should.haveCount(1);
      });

      test('export profitability collection', () async {
        var copy = await factory.createDatabaseJsonCopy(toExport: {
          DataToExport.profitabilityCalculations,
        });

        copy.should.containKey(dataToExportKey);
        copy.should.not.containKey(
          DataToExport.costPriceCalculations.blockName,
        );
        copy.should.containKey(
          DataToExport.profitabilityCalculations.blockName,
        );

        var toExport = copy[dataToExportKey] as List<String>;
        var found = copy[DataToExport.profitabilityCalculations.blockName]
            as List<Map<String, dynamic>>;

        toExport.should.haveCount(1);
        found.should.haveCount(1);
      });

      test('export both collections', () async {
        var copy = await factory.createDatabaseJsonCopy(toExport: {
          DataToExport.costPriceCalculations,
          DataToExport.profitabilityCalculations,
        });

        copy.should.containKey(dataToExportKey);
        copy.should.containKey(DataToExport.costPriceCalculations.blockName);
        copy.should.containKey(
          DataToExport.profitabilityCalculations.blockName,
        );

        var toExport = copy[dataToExportKey] as List<String>;
        var foundCostPrice = copy[DataToExport.costPriceCalculations.blockName]
            as List<Map<String, dynamic>>;
        var foundProfit = copy[DataToExport.profitabilityCalculations.blockName]
            as List<Map<String, dynamic>>;

        toExport.should.haveCount(2);
        foundCostPrice.should.haveCount(1);
        foundProfit.should.haveCount(1);
      });
    });

    group('import', () {
      final isar = GetIt.I.get<Isar>();
      final loader = GetIt.I.get<DbJsonLoader>();

      test('import cost prices', () {
        isar.costPrices.countSync().should.be(1);

        var dbData = DatabaseData(
          {DataToExport.costPriceCalculations},
          [
            JsonBlock(
              DataToExport.costPriceCalculations.blockName,
              [
                <String, dynamic>{
                  'id': 2,
                  'productName': 'test product',
                  'total': 20,
                  'savedDate': 1685369763160802,
                  'blocks': [
                    {
                      'name': 'logistics',
                      'parts': [
                        {
                          'cost': 20,
                          'name': 'direct',
                        },
                      ],
                    },
                  ],
                },
              ],
            )
          ],
        );
        loader.loadImportData(dbData);

        isar.costPrices.countSync().should.be(1);
      });
    });
  });
}
