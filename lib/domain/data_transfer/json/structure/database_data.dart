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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      dataToExportKey: toExport.map((e) => e.alias),
      for (var block in blocks) block.name: block.data
    };
  }
}
