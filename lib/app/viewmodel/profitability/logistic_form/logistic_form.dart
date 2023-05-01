import 'package:mobx/mobx.dart';

import 'size_form/size_form.dart';

part 'logistic_form.g.dart';

class LogisticForm = LogisticFormBase with _$LogisticForm;

abstract class LogisticFormBase with Store {
  final SizeForm sizeForm = SizeForm();
}
