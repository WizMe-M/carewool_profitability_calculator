import 'package:auto_route/annotations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

@RoutePage()
class ProfitabilityPage extends StatelessWidget {
  const ProfitabilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Future<void> pickExcelFile() async {
    var downloads = await getDownloadsDirectory();

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
      initialDirectory: downloads!.path,
      withReadStream: true,
    );
    // result.files.single.;
  }
}
