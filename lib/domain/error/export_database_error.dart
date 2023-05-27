class ExportDatabaseError extends Error {
  @override
  String toString() => 'Не удалось экспортировать данные из базы данных';
}
