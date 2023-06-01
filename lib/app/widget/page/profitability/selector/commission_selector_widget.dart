import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../domain/profitability/pricing/pricing_calculator.dart';

class CommissionSelectorWidget extends StatelessWidget {
  final _searchController = TextEditingController();
  final PricingCalculator pricing;

  CommissionSelectorWidget({required this.pricing, super.key});

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
          labelText: 'Категории',
          hintText: 'Введите название категории',
          suffixIcon: IconButton(
            onPressed: () {
              pricing.commissionSelector.selected = null;
              _searchController.clear();
            },
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
      suggestionsCallback: (pattern) async {
        return await pricing.commissionSelector.search(pattern);
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion.itemName),
          subtitle: Text(suggestion.category),
        );
      },
      onSuggestionSelected: (suggestion) {
        pricing.commissionSelector.selected = suggestion;
        _searchController.text = suggestion.itemName;
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
    );
    if (pricing.commissionSelector.selected != null) {
      searchField.onSuggestionSelected(pricing.commissionSelector.selected!);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          searchField,
          Padding(
            padding: const EdgeInsets.all(8),
            child: Observer(
              builder: (_) {
                return Text(
                  'Категория: ${pricing.selected.category}\n'
                  'Коммиссия FBO = ${pricing.commissionFormatted}',
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
