import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../../../domain/excel/excel_uploader.dart';

class StartUploadWidget extends StatelessWidget {
  final _formatter = DateFormat('dd.MM.yy HH:mm:ss');
  final ExcelUploader uploader;

  StartUploadWidget({required this.uploader, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Observer(
            builder: (context) {
              return ElevatedButton(
                onPressed: uploader.isExecuting
                    ? null
                    : () async => await uploader.storageUploader.upload(),
                child: const Text('Загрузить склады'),
              );
            },
          ),
          Observer(
            builder: (context) {
              var upload = uploader.storageUploader.lastUpload;
              if (upload != null) {
                return Text(
                  'Файл: ${upload.fileName}\n'
                  'Загружено: ${_formatter.format(upload.uploadTime)}',
                  textAlign: TextAlign.center,
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 40),
          Observer(
            builder: (context) {
              return ElevatedButton(
                onPressed: uploader.isExecuting
                    ? null
                    : () async => await uploader.commissionUploader.upload(),
                child: const Text('Загрузить комиссии'),
              );
            },
          ),
          Observer(
            builder: (context) {
              var upload = uploader.commissionUploader.lastUpload;
              if (upload != null) {
                return Text(
                  'Файл: ${upload.fileName}\n'
                  'Загружено: ${_formatter.format(upload.uploadTime)}',
                  textAlign: TextAlign.center,
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
