class JsonParseError extends Error {
  final dynamic json;
  final Type parsingType;
  final String missingKey;

  JsonParseError(this.json, this.parsingType, [this.missingKey = '']);

  @override
  String toString() {
    return 'Не удалось распарсить json в тип $parsingType '
        '(отсутствует ключ $missingKey): \n$json';
  }
}
