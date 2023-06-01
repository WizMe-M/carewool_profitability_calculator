import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../inputs/double_input.dart';
import '../../util/formatting.dart';

part 'size_form.g.dart';

class SizeForm = SizeFormBase with _$SizeForm;

abstract class SizeFormBase with Store {
  /// Input for width
  final DoubleInput widthInput;

  /// Input for height
  final DoubleInput heightInput;

  /// Input for length
  final DoubleInput lengthInput;

  @observable
  double width = 0;

  @observable
  double height = 0;

  @observable
  double length = 0;

  SizeFormBase()
      : widthInput = DoubleInput(),
        heightInput = DoubleInput(),
        lengthInput = DoubleInput() {
    initListeners();
  }

  SizeFormBase.withSize(double width, double height, double length)
      : widthInput = DoubleInput.withText(width.toString()),
        heightInput = DoubleInput.withText(height.toString()),
        lengthInput = DoubleInput.withText(length.toString()) {
    initListeners();
  }

  @computed
  String get widthFormatted => Formatting.formatTwoFractionDigits(width);

  @computed
  String get heightFormatted => Formatting.formatTwoFractionDigits(height);

  @computed
  String get lengthFormatted => Formatting.formatTwoFractionDigits(length);

  /// Volume in milliliters
  @computed
  double get volume => width * height * length;

  /// Ceiled volume in liters
  @computed
  int get volumeInLiters => (volume / 1000).ceil();

  /// Value of volume over liter cap (5) in liters
  @computed
  int get overLiterCap => max<int>(volumeInLiters - 5, 0);

  /// Is the size extra large?
  ///
  /// It is, if
  /// - at least one size is more than 120cm
  /// - sum of sizes is over 200cm
  @computed
  bool get isExtraLargeProduct {
    var maxMoreThan120 = length > 120 || height > 120 || width > 120;
    var sumSizeMoreThan200 = length + height + width > 200;
    return maxMoreThan120 || sumSizeMoreThan200;
  }

  void initListeners() {
    widthInput.controller.addListener(() {
      width = widthInput.value;
    });
    heightInput.controller.addListener(() {
      height = heightInput.value;
    });
    lengthInput.controller.addListener(() {
      length = lengthInput.value;
    });
  }

  /// CLears all size form's inputs
  void clear() {
    widthInput.clear();
    heightInput.clear();
    lengthInput.clear();
  }
}
