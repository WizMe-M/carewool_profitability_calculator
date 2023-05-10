// Represents statuses of uploading Excel data
enum ImportExcelStatus {
  notExecuting(''),
  downloadingFile('Загружаем файл'),
  importing('Импортируем данные из Excel...'),
  error('Произошла ошибка');

  final String message;

  const ImportExcelStatus(this.message);
}
