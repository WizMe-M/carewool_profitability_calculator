const String dataToExportKey = 'data_to_export';

enum DataToExport {
  costPriceCalculations('cost_price', 'cost_price_calculations'),
  profitabilityCalculations('profitability', 'profitability_calculations');

  final String alias;
  final String blockName;
  const DataToExport(this.alias, this.blockName);
}
