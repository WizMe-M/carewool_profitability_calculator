// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_input.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SizeInput on SizeInputBase, Store {
  Computed<double>? _$valueComputed;

  @override
  double get value => (_$valueComputed ??=
          Computed<double>(() => super.value, name: 'SizeInputBase.value'))
      .value;
  Computed<String>? _$formattedComputed;

  @override
  String get formatted =>
      (_$formattedComputed ??= Computed<String>(() => super.formatted,
              name: 'SizeInputBase.formatted'))
          .value;

  late final _$_valueAtom =
      Atom(name: 'SizeInputBase._value', context: context);

  @override
  double get _value {
    _$_valueAtom.reportRead();
    return super._value;
  }

  @override
  set _value(double value) {
    _$_valueAtom.reportWrite(value, super._value, () {
      super._value = value;
    });
  }

  late final _$SizeInputBaseActionController =
      ActionController(name: 'SizeInputBase', context: context);

  @override
  void _onInputChanges(String? s) {
    final _$actionInfo = _$SizeInputBaseActionController.startAction(
        name: 'SizeInputBase._onInputChanges');
    try {
      return super._onInputChanges(s);
    } finally {
      _$SizeInputBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
formatted: ${formatted}
    ''';
  }
}
