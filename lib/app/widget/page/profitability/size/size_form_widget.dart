import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../domain/profitability/logistics/size_form.dart';
import 'size_input_widget.dart';

class SizeFormWidget extends StatelessWidget {
  final SizeForm form;

  const SizeFormWidget({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SizeInputWidget(
                    controller: form.widthInput.controller,
                    label: 'Ширина',
                    validate: form.widthInput.validate,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SizeInputWidget(
                    controller: form.heightInput.controller,
                    label: 'Высота',
                    validate: form.heightInput.validate,
                  ),
                ),
                SizeInputWidget(
                  controller: form.lengthInput.controller,
                  label: 'Длина',
                  validate: form.lengthInput.validate,
                  action: TextInputAction.done,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Observer(
                builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Объем:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${form.widthFormatted}см '
                      '* ${form.heightFormatted}см '
                      '* ${form.lengthFormatted}см '
                      '= ${form.volume}мл',
                    ),
                    Text('(будет округлен до ${form.volumeInLiters}л)'),
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
                          'Крупногабаритный товар',
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
          )
        ],
      ),
    );
  }
}
