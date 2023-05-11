import 'package:isar/isar.dart';

abstract class UploadBase<T> {
  Id? id;
  DateTime? uploadTime;
  List<T> uploadedItems = [];
}