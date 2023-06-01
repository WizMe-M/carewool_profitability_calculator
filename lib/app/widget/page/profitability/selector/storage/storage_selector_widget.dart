import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../../domain/profitability/logistics/logistics_calculator.dart';
import 'storage_info_widget.dart';

class StorageSelectorWidget extends StatelessWidget {
  final _searchController = TextEditingController();
  final LogisticsCalculator logistics;

  StorageSelectorWidget({required this.logistics, super.key});

  @override
  Widget build(BuildContext context) {
    var searchField = TypeAheadField(
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
              logistics.storageSelector.selected = null;
              _searchController.clear();
            },
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
      suggestionsCallback: (pattern) async {
        return await logistics.storageSelector.search(pattern);
      },
      itemBuilder: (context, suggestion) {
        return ListTile(title: Text(suggestion.name));
      },
      onSuggestionSelected: (suggestion) {
        logistics.storageSelector.selected = suggestion;
        _searchController.text = suggestion.name;
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
    );
    if (logistics.storageSelector.selected != null) {
      searchField.onSuggestionSelected(logistics.storageSelector.selected!);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          searchField,
          Padding(
            padding: const EdgeInsets.all(8),
            child: Observer(builder: (context) {
              if (logistics.storageSelector.selected == null) {
                return Text(
                  'Выберите склад',
                  style: TextStyle(color: Colors.red[600]),
                );
              }
              return const SizedBox.shrink();
            }),
          ),
          Observer(builder: (context) {
            return StorageInfoWidget(storage: logistics.selected);
          }),
        ],
      ),
    );
  }
}
