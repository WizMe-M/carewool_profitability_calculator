class JsonToEntityConversionError extends Error {
  @override
  String toString() => 'Failed convertion from JSON-object to Entity';
}