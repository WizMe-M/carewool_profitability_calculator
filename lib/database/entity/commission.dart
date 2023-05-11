import 'package:isar/isar.dart';

import 'upload_base.dart';

part 'commission.g.dart';

@collection
class CommissionUpload extends UploadBase<Commission> {
}

@embedded
class Commission {
  String? category;
  String? itemName;
  double? fbo;
  double? fbs;
}
