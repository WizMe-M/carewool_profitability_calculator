import 'package:isar/isar.dart';

part 'commission.g.dart';

@collection
class CommissionUpload {
  Id? id;
  late String fileName;

  @Index(unique: true)
  late DateTime uploadTime;

  final IsarLinks<Commission> commissions = IsarLinks();
}

@collection
class Commission {
  Id? id;
  String? category;
  String? itemName;
  double? fbo;
  double? fbs;

  @Backlink(to: 'commissions')
  final IsarLink<CommissionUpload> upload = IsarLink();

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get tagWords {
    var itemWords = Isar.splitWords(itemName!);
    var categoryWords = Isar.splitWords(category!);
    var words = categoryWords..addAll(itemWords);
    var lowercaseWords = words.map((e) => e.toLowerCase());
    var uniqueTags = [
      ...{...lowercaseWords}
    ];
    return uniqueTags;
  }
}
