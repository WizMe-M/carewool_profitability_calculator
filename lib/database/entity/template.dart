import 'package:isar/isar.dart';

part 'template.g.dart';

@collection
class Template {
  final Id id = Isar.autoIncrement;
  final String name;
  final List<TemplateBlock> blocks;

  Template(this.name, this.blocks);
}

@embedded
class TemplateBlock {
  String? name;
  List<String>? partNames;
}