import 'package:flutter/material.dart';

import 'size_form_widget.dart';
import '../../../../domain/profitability/logistic_form/logistic_form.dart';
import '../../../../domain/entity/storage_tariff/storage_tariff.dart';

class LogisticFormWidget extends StatelessWidget {
  final form = LogisticForm();

  LogisticFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<StorageTariff>(
          items: [
            for (var tariff in form.storageTariffs)
              DropdownMenuItem<StorageTariff>(
                value: tariff,
                child: Text(tariff.storageName),
              ),
          ],
          onChanged: (selectedItem) {
            form.selectedTariff = selectedItem;
          },
        ),
        SizeFormWidget(form: form.sizeForm),
      ],
    );
  }
}
