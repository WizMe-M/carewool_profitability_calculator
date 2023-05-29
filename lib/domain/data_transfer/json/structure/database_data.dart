import 'package:dfunc/dfunc.dart';

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
    var toExportAlias = json[dataToExportKey] as Set<String>?;
    if (toExportAlias == null) {
      throw JsonParseError(json, Set<String>, dataToExportKey);
    }

    var toExport = <DataToExport>{};
    var blocks = <JsonBlock>[];

    for (var alias in toExportAlias) {
      var item = DataToExport.values.maybeFirstWhere((e) => e.alias == alias);
      if (item == null) {
        throw JsonParseError(json, DataToExport, alias);
      }

      if (toExport.add(item)) {
        var collection = json[item.blockName] as List<Map<String, dynamic>>?;
        if (collection == null) {
          throw JsonParseError(
            json,
            List<Map<String, dynamic>>,
            item.blockName,
          );
        }
        blocks.add(JsonBlock(item.blockName, collection));
      } else {
        throw JsonParseError(json, DatabaseData);
      }
    }
    return DatabaseData(toExport, blocks);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      dataToExportKey: toExport.map((e) => e.alias).toList(),
      for (var block in blocks) block.name: block.data
    };
  }
}
