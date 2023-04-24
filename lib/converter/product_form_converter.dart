import 'package:dfunc/dfunc.dart';

import '../../entity/parameter/parameter.dart';
import '../../entity/product/product.dart';
import '../viewmodel/calculator/form/calculator_form.dart';
import 'converter_base.dart';

class ProductFormConverter implements ConverterBase<Product, CalculatorForm> {
  @override
  CalculatorForm toB(Product product) {
    throw UnimplementedError();
  }

  @override
  Product toA(CalculatorForm form) {
    var utcNow = DateTime.now().toUtc();
    var total = sum(form.allInputs.map<double>((e) => e.value));
    var parameters = form.allInputs
        .where((input) => input.value > 0)
        .map((e) => Parameter(name: e.label, cost: e.value));

    var product = Product(
      name: form.name,
      savedDate: utcNow,
      total: total,
      parameters: parameters.toList(growable: false),
    );
    return product;
  }
}
