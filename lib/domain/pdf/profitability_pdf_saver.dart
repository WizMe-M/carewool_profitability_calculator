import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../profitability/profitability_form.dart';
import '../util/strings.dart';

class ProfitabilityPdfCreator {
  final Font font;
  final ThemeData textTheme;

  final importantRowDecoration = BoxDecoration(
    border: Border.all(width: 2),
    color: PdfColors.blue200,
  );

  ProfitabilityPdfCreator._(this.font)
      : textTheme = ThemeData(
          defaultTextStyle: TextStyle(font: font),
          tableHeader: TextStyle(font: font, fontWeight: FontWeight.bold),
        );

  static Future<ProfitabilityPdfCreator> init() async {
    var font = await PdfGoogleFonts.pTSansRegular();
    var saver = ProfitabilityPdfCreator._(font);
    return saver;
  }

  Future<Uint8List> create(ProfitabilityFormBase profitability) async {
    final pdf = Document()
      ..addPage(
        Page(
          pageFormat: PdfPageFormat.a4,
          theme: textTheme,
          build: (context) {
            return Table(
              children: [
                TableRow(
                  children: [
                    Text('Параметр'),
                    Text('Значение'),
                  ],
                  decoration: importantRowDecoration,
                ),
                TableRow(
                  children: [
                    Text('Продукция'),
                    Text('${profitability.costPrice.productName}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Себестоимость'),
                    Text('${profitability.costPrice.total}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Длина'),
                    Text('${profitability.sizeForm.lengthValue}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Ширина'),
                    Text('${profitability.sizeForm.widthValue}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Высота'),
                    Text('${profitability.sizeForm.heightValue}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Объём'),
                    Text('${profitability.sizeForm.volumeInLiters}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Склад'),
                    Text('${profitability.storageSelector.selected?.name}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Логистика $rubleCurrency'),
                    Text('${profitability.logisticTotalCost}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Цена продажи'),
                    Text('${profitability.pricingForm.customerPrice}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Исходная цена'),
                    Text(profitability.pricingForm.priceFormatted),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Комиссия %'),
                    Text('${profitability.categorySelector.selected?.fbs}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Комиссия $rubleCurrency'),
                    Text('${profitability.commissionForCost}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Налог %'),
                    Text('${profitability.selectedTax.taxSize}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Налог $rubleCurrency'),
                    Text('${profitability.taxSize}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Доходы'),
                    Text(
                      '${profitability.price}',
                      style: Theme.of(context).tableHeader,
                    ),
                  ],
                  decoration: importantRowDecoration,
                ),
                TableRow(
                  children: [
                    Text('Расходы (без налога)'),
                    Text(
                      '${profitability.expenses}',
                      style: Theme.of(context).tableHeader,
                    ),
                  ],
                  decoration: importantRowDecoration,
                ),
                TableRow(
                  children: [
                    Text('Расходы (с налогом)'),
                    Text(
                      '${profitability.expensesWithTax}',
                      style: Theme.of(context).tableHeader,
                    ),
                  ],
                  decoration: importantRowDecoration,
                ),
                TableRow(
                  children: [
                    Text('Прибыль'),
                    Text(
                      '${profitability.profit}',
                      style: Theme.of(context).tableHeader,
                    ),
                  ],
                  decoration: importantRowDecoration,
                ),
                TableRow(
                  children: [
                    Text('Рентабельность'),
                    Text(
                      profitability.profitabilityFormatted,
                      style: Theme.of(context).tableHeader,
                    ),
                  ],
                  decoration: importantRowDecoration,
                ),
              ],
            );
          },
        ),
      );

    return await pdf.save();
  }

  String createFileName(ProfitabilityFormBase profitability) {
    var now = DateFormat('dd.MM.yy HH:mm:ss').format(DateTime.now());
    return '${profitability.costPrice.productName} $now.pdf';
  }
}
