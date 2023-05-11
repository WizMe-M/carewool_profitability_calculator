import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../domain/profitability/commission_selector/commission_selector.dart';

class CommissionSelectorWidget extends StatelessWidget {
  final _searchController = TextEditingController();
  final CommissionSelector selector;

  CommissionSelectorWidget({required this.selector, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _searchController,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Категории',
                hintText: 'Введите название категории',
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
              return ListTile(
                title: Text(suggestion.itemName!),
                subtitle: Text(suggestion.category!),
              );
            },
            onSuggestionSelected: (suggestion) {
              selector.selected = suggestion;
              _searchController.text = suggestion.itemName!;
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
                  'Не найдено категорий',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              );
            },
            hideKeyboardOnDrag: true,
            hideSuggestionsOnKeyboardHide: false,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Observer(
              builder: (_) {
                return Text(
                  'Категория: ${selector.categoryName}\n'
                  'Коммиссия FBO = ${selector.fboCommission}%',
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
