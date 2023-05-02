import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'size_input_widget.dart';
import '../../../../domain/profitability/logistic_form/size_form/size_form.dart';

class SizeFormWidget extends StatelessWidget {
  final SizeForm form;

  const SizeFormWidget({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SizeInputWidget(
                    controller: form.width.controller,
                    label: 'Ширина',
                    validate: form.width.validate,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SizeInputWidget(
                    controller: form.height.controller,
                    label: 'Высота',
                    validate: form.height.validate,
                  ),
                ),
                SizeInputWidget(
                  controller: form.length.controller,
                  label: 'Длина',
                  validate: form.length.validate,
                  action: TextInputAction.done,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Observer(
                    builder: (context) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Расчетный объем:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '${form.width.formatted}см '
                          '* ${form.height.formatted}см '
                          '* ${form.length.formatted}см '
                          '= ${form.volume}мл',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          '(будет округлен до ${form.volumeInLiters}л)',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14),
                        ),
                        if (form.overLiterCap > 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              'Превышение на ${form.overLiterCap}л',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.yellow[800],
                              ),
                            ),
                          ),
                        if (form.isExtraLargeProduct)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              'Сверхгабаритный товар',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
