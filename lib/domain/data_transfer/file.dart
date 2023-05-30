import 'dart:typed_data';

class File<T> {
  final T source;
  final String fileName;
  final Uint8List fileData;

  File(this.source, this.fileName, this.fileData);
}