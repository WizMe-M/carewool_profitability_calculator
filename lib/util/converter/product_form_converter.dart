import 'package:carewool_profitability_calculator/entity/parameter/parameter.dart';
import 'package:carewool_profitability_calculator/entity/product/product.dart';
import 'package:carewool_profitability_calculator/util/converter/converter_base.dart';
import 'package:carewool_profitability_calculator/viewmodel/form/calculator_form.dart';
import 'package:dfunc/dfunc.dart';

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
