import 'package:isar/isar.dart';

part 'template.g.dart';

@collection
class Template {
  Id? id;
  String? name;
  List<TemplateBlock> blocks = [];
}

@embedded
class TemplateBlock {
  String? name;
  List<String> partNames = [];
}
