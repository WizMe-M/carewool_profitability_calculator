import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../util/symbols.dart';
import '../profitability/profitability_form.dart';

class ProfitabilityPdfSaver {

  final boldDecoration = BoxDecoration(
    border: Border.all(width: 2),
    color: PdfColors.blue200,
  );

  Future<File> save(ProfitabilityFormBase profitability) async {
    final boldStyle = TextStyle(
      fontWeight: FontWeight.bold,
      font: await PdfGoogleFonts.pTSansRegular(),
    );
    final pdf = Document()
      ..addPage(
        Page(
          build: (context) {
            return Table(
              children: [
                TableRow(
                  children: [
                    Text('Параметр', style: boldStyle),
                    Text('Значение', style: boldStyle),
                  ],
                  decoration: boldDecoration,
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
                    Text('${profitability.price}', style: boldStyle),
                  ],
                  decoration: boldDecoration,
                ),
                TableRow(
                  children: [
                    Text('Расходы (без налога)'),
                    Text('${profitability.expenses}', style: boldStyle),
                  ],
                  decoration: boldDecoration,
                ),
                TableRow(
                  children: [
                    Text('Расходы (с налогом)'),
                    Text('${profitability.expensesWithTax}',
                        style: boldStyle),
                  ],
                  decoration: boldDecoration,
                ),
                TableRow(
                  children: [
                    Text('Прибыль'),
                    Text('${profitability.profit}', style: boldStyle),
                  ],
                  decoration: boldDecoration,
                ),
                TableRow(
                  children: [
                    Text('Рентабельность'),
                    Text(
                      profitability.profitabilityFormatted,
                      style: boldStyle,
                    ),
                  ],
                  decoration: boldDecoration,
                ),
              ],
            );
          },
        ),
      );

    var name = '${createName(profitability)}.pdf';
    var bytes = await pdf.save();
    var temp = await getApplicationDocumentsDirectory();
    var path = join(temp.path, name);
    var file = await File(path).writeAsBytes(bytes);
    return file;
  }

  String createName(ProfitabilityFormBase profitability) {
    var now = DateFormat('dd.MM.yy-HH:mm:ss').format(DateTime.now());
    return '${profitability.costPrice.productName} $now';
  }
}
