import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../../database/entity/storage.dart';
import '../../../../../../domain/profitability/storage_selector/storage_selector.dart';
import 'storage_info_widget.dart';

class StorageSelectorWidget extends StatelessWidget {
  final StorageSelector selector;

  const StorageSelectorWidget({super.key, required this.selector});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
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
                    child: Text(
                      tariff.name!,
                      style: const TextStyle(fontSize: 14),
                    ),
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
                      title:
                          Text('${isExpanded ? 'Скрыть' : 'Показать'} тарифы'),
                    );
                  },
                  body: Observer(
                    builder: (context) {
                      return selector.selected != null
                          ? StorageInfoWidget(storage: selector.selected!)
                          : const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: Text(
                                  'Выберите склад',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                    },
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
