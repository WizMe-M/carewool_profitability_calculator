import 'package:mobx/mobx.dart';

import '../../database/entity/upload.dart';
import 'logistic_form/logistic_form.dart';

part 'profitability_form.g.dart';

class ProfitabilityForm = ProfitabilityFormBase with _$ProfitabilityForm;

abstract class ProfitabilityFormBase with Store {
  final Upload upload;
  final LogisticCalculator logistic;

  ProfitabilityFormBase(this.upload):logistic = LogisticCalculator();
}