import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../../profitability/profitability_form.dart';
import '../../util/strings.dart';
import '../file.dart';

class ProfitabilityPdfCreator {
  final Font regular;
  final Font bold;
  final ThemeData textTheme;

  final importantRowDecoration = BoxDecoration(
    border: Border.all(width: 2),
    color: PdfColors.blue200,
  );

  ProfitabilityPdfCreator._(this.regular, this.bold)
      : textTheme = ThemeData(
          defaultTextStyle: TextStyle(
            font: regular,
            fontSize: 14,
          ),
          tableHeader: TextStyle(
            font: bold,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        );

  static Future<ProfitabilityPdfCreator> init() async {
    var regularFont = await PdfGoogleFonts.pTSansRegular();
    var boldFont = await PdfGoogleFonts.pTSansBold();
    var saver = ProfitabilityPdfCreator._(regularFont, boldFont);
    return saver;
  }

  static String _createFileName(ProfitabilityForm form) {
    var now = DateFormat('dd.MM.yy HH:mm:ss').format(DateTime.now());
    return '${form.costPrice.productName} $now.pdf';
  }

  /// Creates PDF-file with table of profitability form's data
  Future<File<ProfitabilityForm>> create(ProfitabilityForm form) async {
    final pdf = Document()
      ..addPage(
        Page(
          pageFormat: PdfPageFormat.a4,
          theme: textTheme,
          build: (context) {
            return Table(
              border: TableBorder.all(),
              children: [
                NormalTableRow(
                  'Параметр',
                  'Значение',
                  importantRowDecoration,
                ),
                NormalTableRow(
                  'Продукция',
                  form.costPrice.productName,
                ),
                NormalTableRow(
                  'Себестоимость $rubleCurrency',
                  form.expenseProductionFormatted,
                ),
                NormalTableRow(
                  'Длина см',
                  '${form.logistics.size.lengthFormatted} см',
                ),
                NormalTableRow(
                  'Ширина см',
                  '${form.logistics.size.widthFormatted} см',
                ),
                NormalTableRow(
                  'Высота см',
                  '${form.logistics.size.heightFormatted} см',
                ),
                NormalTableRow(
                  'Объём л',
                  '${form.logistics.size.volumeInLiters}л',
                ),
                NormalTableRow(
                  'Склад',
                  form.logistics.selected.name,
                ),
                NormalTableRow(
                  'Логистика $rubleCurrency',
                  form.logistics.totalCostFormatted,
                ),
                NormalTableRow(
                  'Цена продажи $rubleCurrency',
                  form.pricing.form.priceBeforeRCDFormatted,
                ),
                NormalTableRow(
                  'Исходная цена $rubleCurrency',
                  form.pricing.form.priceFormatted,
                ),
                NormalTableRow(
                  'Комиссия %',
                  form.pricing.commissionFormatted,
                ),
                NormalTableRow(
                  'Комиссия $rubleCurrency',
                  form.expensesCommissionFormatted,
                ),
                NormalTableRow(
                  'Налог %',
                  form.taxFormatted,
                ),
                NormalTableRow(
                  'Налог $rubleCurrency',
                  form.taxSizeFormatted,
                ),
                NormalTableRow(
                  'Доходы',
                  form.incomeFormatted,
                  importantRowDecoration,
                  Theme.of(context).tableHeader,
                ),
                NormalTableRow(
                  'Расходы (без налога)',
                  form.expensesFormatted,
                  importantRowDecoration,
                  Theme.of(context).tableHeader,
                ),
                NormalTableRow(
                  'Расходы (с налогом)',
                  form.expensesWithTaxFormatted,
                  importantRowDecoration,
                  Theme.of(context).tableHeader,
                ),
                NormalTableRow(
                  'Прибыль',
                  form.profitFormatted,
                  importantRowDecoration,
                  Theme.of(context).tableHeader,
                ),
                NormalTableRow(
                  'Рентабельность',
                  form.profitabilityFormatted,
                  importantRowDecoration,
                  Theme.of(context).tableHeader,
                ),
              ],
            );
          },
        ),
      );

    var bytes = await pdf.save();
    var name = _createFileName(form);
    return File(form, name, bytes);
  }
}

class NormalTableRow extends TableRow {
  const NormalTableRow._({required super.children, super.decoration});

  factory NormalTableRow(
    String leftCell,
    String rightCell, [
    BoxDecoration? decoration,
    TextStyle? textStyle,
  ]) {
    return NormalTableRow._(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            leftCell,
            style: textStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            rightCell,
            style: textStyle,
          ),
        ),
      ],
      decoration: decoration,
    );
  }
}
