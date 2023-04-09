// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Input on InputBase, Store {
  Computed<double>? _$valueComputed;

  @override
  double get value => (_$valueComputed ??=
          Computed<double>(() => super.value, name: 'InputBase.value'))
      .value;
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: 'InputBase.isValid'))
      .value;

  late final _$textAtom = Atom(name: 'InputBase.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$errorAtom = Atom(name: 'InputBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$InputBaseActionController =
      ActionController(name: 'InputBase', context: context);

  @override
  void clear() {
    final _$actionInfo =
        _$InputBaseActionController.startAction(name: 'InputBase.clear');
    try {
      return super.clear();
    } finally {
      _$InputBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validate(String s) {
    final _$actionInfo =
        _$InputBaseActionController.startAction(name: 'InputBase.validate');
    try {
      return super.validate(s);
    } finally {
      _$InputBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text},
error: ${error},
value: ${value},
isValid: ${isValid}
    ''';
  }
}
