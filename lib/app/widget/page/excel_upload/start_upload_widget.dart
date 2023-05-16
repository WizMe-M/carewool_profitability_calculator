import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
          Padding(
            padding: const EdgeInsets.all(8),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Скачайте файл с ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: 'сайта WB\n',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        var url = Uri(
                          scheme: 'https',
                          host: 'seller.wildberries.ru',
                          path: '/dynamic-product-categories/delivery',
                        );
                        launchUrl(url, mode: LaunchMode.externalApplication);
                      },
                  ),
                  TextSpan(
                    text: '(раздел "Логистика, хранение, приёмка")',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Observer(
            builder: (context) {
              return ElevatedButton(
                onPressed: uploader.isExecuting
                    ? null
                    : () async => await uploader.storageUploader.upload(),
                child: const Text(
                  'Импортировать файл\n'
                  '"Логистика, хранение, приёмка гггг-мм-дд"',
                  textAlign: TextAlign.center,
                ),
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
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.all(8),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Скачайте файл с ',
                      style: Theme.of(context).textTheme.bodyMedium,),
                  TextSpan(
                    text: 'сайта WB\n',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        var url = Uri(
                          scheme: 'https',
                          host: 'seller.wildberries.ru',
                          path: '/dynamic-product-categories/commission',
                        );
                        launchUrl(url, mode: LaunchMode.externalApplication);
                      },
                  ),
                  TextSpan(
                    text: '(раздел "Коммиссия")',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Observer(
            builder: (context) {
              return ElevatedButton(
                onPressed: uploader.isExecuting
                    ? null
                    : () async => await uploader.commissionUploader.upload(),
                child: const Text('Импортировать файл "Комиссия"'),
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
