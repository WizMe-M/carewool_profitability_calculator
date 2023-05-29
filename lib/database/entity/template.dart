import 'package:isar/isar.dart';

part 'template.g.dart';

@collection
class Template {
  Id? id;
  late String name;
  late List<TemplateBlock> blocks = [];

  Template();

  Template.withValues(this.name, this.blocks);
}

@embedded
class TemplateBlock {
  late String name;
  late List<String> partNames = [];

  TemplateBlock();

  TemplateBlock.withValues(this.name, this.partNames);
}
