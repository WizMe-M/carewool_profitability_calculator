// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_selector.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StorageSelector on StorageSelectorBase, Store {
  late final _$isInfoExpandedAtom =
      Atom(name: 'StorageSelectorBase.isInfoExpanded', context: context);

  @override
  bool get isInfoExpanded {
    _$isInfoExpandedAtom.reportRead();
    return super.isInfoExpanded;
  }

  @override
  set isInfoExpanded(bool value) {
    _$isInfoExpandedAtom.reportWrite(value, super.isInfoExpanded, () {
      super.isInfoExpanded = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: 'StorageSelectorBase.selected', context: context);

  @override
  Storage? get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(Storage? value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  @override
  String toString() {
    return '''
isInfoExpanded: ${isInfoExpanded},
selected: ${selected}
    ''';
  }
}