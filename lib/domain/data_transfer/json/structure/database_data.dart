import '../../../error/json_parse_error.dart';
import '../data_to_export_enum.dart';
import 'json_block.dart';

/// Uploaded data from db collections
class DatabaseData {
  /// Type markers of uploaded collections
  final Set<DataToExport> toExport;

  /// Named blocks of JSON-serialized collections
  final List<JsonBlock> blocks;

  DatabaseData(this.toExport, this.blocks)
      : assert(toExport.isNotEmpty),
        assert(blocks.isNotEmpty),
        assert(toExport.length == blocks.length);

  factory DatabaseData.fromJson(Map<String, dynamic> json) {
    var toExport = <DataToExport>{};
    var blocks = <JsonBlock>[];

    try {
      var toExportAlias = json[dataToExportKey] as List;

      for (var alias in toExportAlias) {
        var item = DataToExport.values.firstWhere((e) => e.alias == alias);
        toExport.add(item);

        var collection = json[item.blockName] as List;
        var listOfJson = collection.map((e) {
          return e as Map<String, dynamic>;
        }).toList();
        blocks.add(JsonBlock(item.blockName, listOfJson));
      }
    } on Error {
      throw JsonParseError(json, DatabaseData);
    }
    return DatabaseData(toExport, blocks);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      dataToExportKey: toExport.map((e) => e.alias).toList(),
      for (var block in blocks) block.name: block.data
    };
  }

  String getInfo() {
    var info = StringBuffer();
    for (var block in blocks) {
      info.write('\n');
      if (block.name == DataToExport.costPriceCalculations.blockName) {
        info.write('Расчёты себестоимости');
      } else if (block.name ==
          DataToExport.profitabilityCalculations.blockName) {
        info.write('Расчёты рентабельности');
      }
      info.write(' в количестве ${block.count} ед.');
    }
    return info.toString();
  }
}
