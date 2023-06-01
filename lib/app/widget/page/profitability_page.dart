import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../domain/data_transfer/pdf/profitability_pdf_creator.dart';
import '../../../domain/data_transfer/mime_type_enum.dart';
import '../../../domain/file_dialog/file_dialog.dart';
import '../../../domain/profitability/profitability_form.dart';
import '../side_bar.dart';
import 'profitability/pricing/pricing_form_widget.dart';
import 'profitability/result/logistic_result_widget.dart';
import 'profitability/size/size_form_widget.dart';
import 'profitability/selector/storage/storage_selector_widget.dart';
import 'profitability/result/calculations_result_widget.dart';
import 'profitability/save_button.dart';
import 'profitability/selector/commission_selector_widget.dart';
import 'profitability/selector/tax_selector_widget.dart';

@RoutePage()
class ProfitabilityPage extends StatelessWidget {
  final Logger _logger = GetIt.I.get();
  final ProfitabilityPdfCreator _pdf = GetIt.I.get();
  final FileDialog _fileDialog = GetIt.I.get();
  final ProfitabilityForm form;

  ProfitabilityPage({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Рентабельность', style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(
            onPressed: () => exportPdf(context),
            icon: const Icon(Icons.file_download),
            tooltip: 'Экспортировать расчёт в PDF',
          )
        ],
      ),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StorageSelectorWidget(logistics: form.logistics),
                SizeFormWidget(form: form.logistics.size),
                LogisticResultWidget(logistics: form.logistics),
                CommissionSelectorWidget(pricing: form.pricing),
                PricingFormWidget(form: form.pricing.form),
                TaxSelectorWidget(form: form),
                CalculationsResultWidget(form: form),
                SaveButton(form: form),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> exportPdf(BuildContext context) async {
    var messenger = ScaffoldMessenger.of(context);

    var status = await Permission.storage.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Требуется разрешение на запись'),
          duration: Duration(seconds: 1),
        ),
      );
      return;
    }

    _pdf.create(form).then((pdf) {
      _fileDialog.pickDirectoryAndSaveFile(pdf, MimeType.pdf).then((path) {
        if (path == null) return;
        messenger.showSnackBar(
          const SnackBar(
            content: Text('Файл успешно сохранен'),
            duration: Duration(seconds: 1),
          ),
        );
      }).onError((error, stackTrace) {
        _logger.e('Error happen on file saving', error, stackTrace);
        messenger.showSnackBar(
          const SnackBar(
            content: Text('Не удалось сохранить PDF'),
            duration: Duration(seconds: 1),
          ),
        );
      });
    }).onError((error, stackTrace) {
      _logger.e('Unable to create PDF', error, stackTrace);
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Не удалось сформировать PDF'),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }
}
