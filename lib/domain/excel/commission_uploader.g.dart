// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_uploader.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommissionUploader on CommissionUploaderBase, Store {
  Computed<DateTime?>? _$lastUpdatedComputed;

  @override
  DateTime? get lastUpdated =>
      (_$lastUpdatedComputed ??= Computed<DateTime?>(() => super.lastUpdated,
              name: 'CommissionUploaderBase.lastUpdated'))
          .value;
  Computed<bool>? _$isExecutingComputed;

  @override
  bool get isExecuting =>
      (_$isExecutingComputed ??= Computed<bool>(() => super.isExecuting,
              name: 'CommissionUploaderBase.isExecuting'))
          .value;

  late final _$lastUploadAtom =
      Atom(name: 'CommissionUploaderBase.lastUpload', context: context);

  @override
  CommissionUpload? get lastUpload {
    _$lastUploadAtom.reportRead();
    return super.lastUpload;
  }

  @override
  set lastUpload(CommissionUpload? value) {
    _$lastUploadAtom.reportWrite(value, super.lastUpload, () {
      super.lastUpload = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'CommissionUploaderBase.status', context: context);

  @override
  ImportExcelStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ImportExcelStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('CommissionUploaderBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$uploadAsyncAction =
      AsyncAction('CommissionUploaderBase.upload', context: context);

  @override
  Future<void> upload() {
    return _$uploadAsyncAction.run(() => super.upload());
  }

  @override
  String toString() {
    return '''
lastUpload: ${lastUpload},
status: ${status},
lastUpdated: ${lastUpdated},
isExecuting: ${isExecuting}
    ''';
  }
}
