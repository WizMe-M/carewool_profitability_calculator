import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../domain/excel/excel_uploader.dart';

class UploadingWidget extends StatelessWidget {
  final ExcelUploader uploader;

  const UploadingWidget({super.key, required this.uploader});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Observer(
            builder: (_) => Text(uploader.currentStatus.message),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
