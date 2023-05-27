import 'database_data.dart';

/// Represents optional block of JSON in [DatabaseData]
class JsonBlock {
  /// Name (key) of the block
  final String name;

  /// Array of JSON-serialized data
  final List<Map<String, dynamic>> data;

  JsonBlock(this.name, this.data);
}
