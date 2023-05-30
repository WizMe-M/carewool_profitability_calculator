// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PricingForm on PricingFormBase, Store {
  Computed<double>? _$priceBeforeRCDComputed;

  @override
  double get priceBeforeRCD =>
      (_$priceBeforeRCDComputed ??= Computed<double>(() => super.priceBeforeRCD,
              name: 'PricingFormBase.priceBeforeRCD'))
          .value;
  Computed<double>? _$priceComputed;

  @override
  double get price => (_$priceComputed ??=
          Computed<double>(() => super.price, name: 'PricingFormBase.price'))
      .value;
  Computed<String>? _$priceBeforeRCDFormattedComputed;

  @override
  String get priceBeforeRCDFormatted => (_$priceBeforeRCDFormattedComputed ??=
          Computed<String>(() => super.priceBeforeRCDFormatted,
              name: 'PricingFormBase.priceBeforeRCDFormatted'))
      .value;
  Computed<String>? _$priceFormattedComputed;

  @override
  String get priceFormatted =>
      (_$priceFormattedComputed ??= Computed<String>(() => super.priceFormatted,
              name: 'PricingFormBase.priceFormatted'))
          .value;

  late final _$customerPriceAtom =
      Atom(name: 'PricingFormBase.customerPrice', context: context);

  @override
  double get customerPrice {
    _$customerPriceAtom.reportRead();
    return super.customerPrice;
  }

  @override
  set customerPrice(double value) {
    _$customerPriceAtom.reportWrite(value, super.customerPrice, () {
      super.customerPrice = value;
    });
  }

  late final _$regularCustomerDiscountAtom =
      Atom(name: 'PricingFormBase.regularCustomerDiscount', context: context);

  @override
  int get regularCustomerDiscount {
    _$regularCustomerDiscountAtom.reportRead();
    return super.regularCustomerDiscount;
  }

  @override
  set regularCustomerDiscount(int value) {
    _$regularCustomerDiscountAtom
        .reportWrite(value, super.regularCustomerDiscount, () {
      super.regularCustomerDiscount = value;
    });
  }

  late final _$sellerDiscountAtom =
      Atom(name: 'PricingFormBase.sellerDiscount', context: context);

  @override
  int get sellerDiscount {
    _$sellerDiscountAtom.reportRead();
    return super.sellerDiscount;
  }

  @override
  set sellerDiscount(int value) {
    _$sellerDiscountAtom.reportWrite(value, super.sellerDiscount, () {
      super.sellerDiscount = value;
    });
  }

  @override
  String toString() {
    return '''
customerPrice: ${customerPrice},
regularCustomerDiscount: ${regularCustomerDiscount},
sellerDiscount: ${sellerDiscount},
priceBeforeRCD: ${priceBeforeRCD},
price: ${price},
priceBeforeRCDFormatted: ${priceBeforeRCDFormatted},
priceFormatted: ${priceFormatted}
    ''';
  }
}
