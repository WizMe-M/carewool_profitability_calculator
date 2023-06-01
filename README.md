# Калькулятор себестоимости для Carewool

Мобильное приложение для расчёта себестоимости продукции.  
Текущая версия: `0.3.3` "Import/Export"

Возможности приложения представлены ниже:
1. Форма расчёта себестоимости
   - Форма делится на логические блоки ("Тара", "Упаковка", "Производство", "Логистика"...), каждый из которых содержит свои поля ввода (параметры) расчета себестоимости
   1. Валидация формы
   2. Очистка формы от всех введенных значений 
2. История калькуляций
   1. Сохранение расчёта себестоимости в историю
   2. Удаление расчёта из истории
   3. Копирование (открытие) ранее сохраненного расчёта в форме
3. Расчёт рентабельности
   1. Валидация полей ввода
4. Импорт данных из Excel-файлов
5. Информирование пользователя о...
   1. Ошибках валидации формы расчёта
   2. Ошибках валидации полей формы расчёта
   3. Успешном сохранении расчёта
   4. Неудачной попытке сохранить расчёт
   5. Отсутствии данных в истории калькуляций
   6. Уведомление о параметрах продукции
   7. Уведомление о результатах расчётов рентабельности