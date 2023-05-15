import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../domain/profitability/size_form/size_form.dart';
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
