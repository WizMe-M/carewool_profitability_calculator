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

  late final _$lastUploadAtom =
      Atom(name: 'ExcelUploaderBase.lastUpload', context: context);

  @override
  Upload? get lastUpload {
    _$lastUploadAtom.reportRead();
    return super.lastUpload;
  }

  @override
  set lastUpload(Upload? value) {
    _$lastUploadAtom.reportWrite(value, super.lastUpload, () {
      super.lastUpload = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'ExcelUploaderBase.status', context: context);

  @override
  ParsingStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ParsingStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$updateLastUploadAsyncAction =
      AsyncAction('ExcelUploaderBase.updateLastUpload', context: context);

  @override
  Future<void> updateLastUpload() {
    return _$updateLastUploadAsyncAction.run(() => super.updateLastUpload());
  }

  late final _$uploadExcelAsyncAction =
      AsyncAction('ExcelUploaderBase.uploadExcel', context: context);

  @override
  Future<void> uploadExcel() {
    return _$uploadExcelAsyncAction.run(() => super.uploadExcel());
  }

  @override
  String toString() {
    return '''
lastUpload: ${lastUpload},
status: ${status},
isExecuting: ${isExecuting}
    ''';
  }
}
