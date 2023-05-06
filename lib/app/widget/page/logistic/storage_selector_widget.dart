import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../database/entity/storage.dart';
import '../../../../domain/profitability/logistic_form/storage_selector/storage_selector.dart';

class StorageSelectorWidget extends StatelessWidget {
  final StorageSelector selector;

  const StorageSelectorWidget({super.key, required this.selector});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Observer(
            builder: (context) {
              return DropdownButton<Storage>(
                value: selector.selected,
                onChanged: (selected) => selector.selected = selected,
                items: selector.storages.map((tariff) {
                  return DropdownMenuItem<Storage>(
                    value: tariff,
                    child: Text(tariff.name!),
                  );
                }).toList(),
              );
            },
          ),
          Observer(
            builder: (context) => ExpansionPanelList(
              expansionCallback: (_, isExpanded) =>
                  selector.isInfoExpanded = !isExpanded,
              children: [
                ExpansionPanel(
                  isExpanded: selector.isInfoExpanded,
                  canTapOnHeader: true,
                  headerBuilder: (_, isExpanded) {
                    return ListTile(
                      title: Text('${isExpanded ? 'Скрыть' : 'Показать'} тарифы'),
                    );
                  },
                  body: Observer(
                    builder: (context) => Column(
                      children: [
                        if (selector.selected == null)
                          const Center(child: Text('Выберите склад'))
                        else
                          ...selector.selected!.tariffs!.map((tariff) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  label: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      tariff.name!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Базовая стоимость: ${tariff.baseCost}руб.',
                                    ),
                                    Text(
                                      'Доп. стоимость: ${tariff.costPerLiter}руб.',
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
