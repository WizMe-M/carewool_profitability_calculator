import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../../inputs/double_input.dart';

part 'size_form.g.dart';

class SizeForm = SizeFormBase with _$SizeForm;

abstract class SizeFormBase with Store {
  final Logger _logger = GetIt.I.get();
  final NumberFormat _formatter = NumberFormat()
    ..minimumFractionDigits = 0
    ..maximumFractionDigits = 2;

  /// Input for width
  final width = DoubleInput();

  /// Input for height
  final height = DoubleInput();

  /// Input for length
  final length = DoubleInput();

  @observable
  double widthValue = 0;

  @observable
  double heightValue = 0;

  @observable
  double lengthValue = 0;

  SizeFormBase() {
    initListeners();
  }

  @computed
  String get widthFormatted => _formatter.format(widthValue);

  @computed
  String get heightFormatted => _formatter.format(heightValue);

  @computed
  String get lengthFormatted => _formatter.format(lengthValue);

  /// Volume in milliliters
  @computed
  double get volume => widthValue * heightValue * lengthValue;

  /// Ceiled volume in liters
  @computed
  int get volumeInLiters => (volume / 1000).ceil();

  /// Value of volume over liter cap (5) in liters
  @computed
  int get overLiterCap {
    var over = volumeInLiters - 5;
    return over > 0 ? over : 0;
  }

  /// Whether is size extra large
  /// (if so, it'll be calculated cargo delivery logistics cost)
  ///
  /// It is, if
  /// - at least one size is more than 120cm
  /// - sum of sizes is over 200cm
  @computed
  bool get isExtraLargeProduct {
    _logger.i('Extra-large product check');
    var maxMoreThan120 =
        lengthValue > 120 || heightValue > 120 || widthValue > 120;
    var sumSizeMoreThan200 = lengthValue + heightValue + widthValue > 200;
    return maxMoreThan120 || sumSizeMoreThan200;
  }

  void initListeners() {
    width.controller.addListener(() {
      widthValue = width.value;
    });
    height.controller.addListener(() {
      heightValue = height.value;
    });
    length.controller.addListener(() {
      lengthValue = length.value;
    });
  }

  /// CLears all size form's inputs
  void clear() {
    width.clear();
    height.clear();
    length.clear();
  }
}
