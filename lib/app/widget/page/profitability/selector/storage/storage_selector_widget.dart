import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../../domain/profitability/storage_selector/storage_selector.dart';
import 'storage_info_widget.dart';

class StorageSelectorWidget extends StatelessWidget {
  final _searchController = TextEditingController();
  final StorageSelector selector;

  StorageSelectorWidget({super.key, required this.selector});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _searchController,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Склады',
                hintText: 'Введите название склада',
                suffixIcon: IconButton(
                  onPressed: () {
                    selector.selected = null;
                    _searchController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            suggestionsCallback: (pattern) async {
              return await selector.search(pattern);
            },
            itemBuilder: (context, suggestion) {
              return ListTile(title: Text(suggestion.name!));
            },
            onSuggestionSelected: (suggestion) {
              selector.selected = suggestion;
              _searchController.text = suggestion.name!;
            },
            loadingBuilder: (_) {
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error) {
              return const Center(
                child: Text('Произошла ошибка. Попробуйте еще раз'),
              );
            },
            noItemsFoundBuilder: (context) {
              return const Center(
                child: Text(
                  'Не найдено складов',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              );
            },
          ),
          Observer(
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
        ],
      ),
    );
  }
}
