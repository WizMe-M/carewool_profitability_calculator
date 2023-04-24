import 'package:dfunc/dfunc.dart';

import '../entity/block/block.dart';
import '../viewmodel/calculator/form_block.dart';
import '../viewmodel/calculator/input.dart';
import '../viewmodel/calculator/form/calculator_form.dart';
import '../../entity/parameter/parameter.dart';
import '../../entity/product/product.dart';
import 'converter_base.dart';

class ProductFormConverter implements ConverterBase<Product, CalculatorForm> {
  @override
  CalculatorForm toB(Product product) {
    var blocks = product.blocks.map((block) {
      return FormBlock(
        title: block.name,
        inputs: block.parameters.map((parameter) {
          var text = parameter.cost != 0 ? parameter.cost.toString() : '';
          return Input(label: parameter.name)..controller.text = text;
        }).toList(),
      );
    }).toList();
    var form = CalculatorForm(productName: product.name, blocks: blocks);
    return form;
  }

  @override
  Product toA(CalculatorForm form) {
    var product = Product(
      name: form.name,
      savedDate: DateTime.now().toUtc(),
      total: sum(form.allInputs.map<double>((e) => e.value)),
      blocks: form.blocks.map((block) {
        return Block(
          name: block.title,
          parameters: block.inputs.map((input) {
            return Parameter(name: input.label, cost: input.value);
          }).toList(),
        );
      }).toList(),
    );
    return product;
  }
}
