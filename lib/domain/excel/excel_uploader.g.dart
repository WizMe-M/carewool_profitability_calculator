// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excel_uploader.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExcelUploader on ExcelUploaderBase, Store {
  Computed<bool>? _$isExecutingComputed;

  @override
  bool get isExecuting =>
      (_$isExecutingComputed ??= Computed<bool>(() => super.isExecuting,
              name: 'ExcelUploaderBase.isExecuting'))
          .value;
  Computed<ImportExcelStatus>? _$currentStatusComputed;

  @override
  ImportExcelStatus get currentStatus => (_$currentStatusComputed ??=
          Computed<ImportExcelStatus>(() => super.currentStatus,
              name: 'ExcelUploaderBase.currentStatus'))
      .value;
  Computed<DateTime?>? _$lastUpdateTimeComputed;

  @override
  DateTime? get lastUpdateTime => (_$lastUpdateTimeComputed ??=
          Computed<DateTime?>(() => super.lastUpdateTime,
              name: 'ExcelUploaderBase.lastUpdateTime'))
      .value;

  late final _$isFetchingAtom =
      Atom(name: 'ExcelUploaderBase.isFetching', context: context);

  @override
  bool get isFetching {
    _$isFetchingAtom.reportRead();
    return super.isFetching;
  }

  @override
  set isFetching(bool value) {
    _$isFetchingAtom.reportWrite(value, super.isFetching, () {
      super.isFetching = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('ExcelUploaderBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
isFetching: ${isFetching},
isExecuting: ${isExecuting},
currentStatus: ${currentStatus},
lastUpdateTime: ${lastUpdateTime}
    ''';
  }
}
