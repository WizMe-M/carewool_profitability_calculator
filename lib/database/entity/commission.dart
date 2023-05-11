import 'package:isar/isar.dart';

part 'commission.g.dart';

@collection
class CommissionUpload {
  Id? id;
  DateTime? uploadTime;
  List<Commission> commissions = [];
}

@embedded
class Commission {
  String? category;
  String? itemName;
  double? fbo;
  double? fbs;
}
