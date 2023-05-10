enum SimpleTaxationSystem {
  perIncome(6),
  perProfit(15);

  final double taxSize;

  const SimpleTaxationSystem(this.taxSize);
}