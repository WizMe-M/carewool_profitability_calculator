import '../../database/entity/commission.dart' as db;
import '../util/formatting.dart';

class Commission {
  final db.Commission entity;

  Commission(this.entity);

  Commission.defaultValue()
      : this(db.Commission.withValues(
          'Категория по умолчанию',
          'Категория по умолчанию',
          17,
          17,
        ));

  String get category => entity.category;

  String get itemName => entity.itemName;

  double get fbo => entity.fbo;

  double get fbs => entity.fbs;

  String get fboFormatted => Formatting.formatPercentage(entity.fbo);

  String get fbsFormatted => Formatting.formatPercentage(entity.fbs);
}
