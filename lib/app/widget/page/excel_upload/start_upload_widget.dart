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
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Загрузите файл с названием типа '
                      '"Логистика, хранение, приёмка гггг-мм-дд" с ',
                    style: Theme.of(context).textTheme.bodyMedium
                ),
                TextSpan(
                  text: 'сайта WB (раздел "Логистика, хранение, приёмка")',
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
              ],
            ),
          ),
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
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Загрузите файл с названием типа "Комиссия" с ',
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                TextSpan(
                  text: 'сайта WB (раздел "Коммиссия")',
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
              ],
            ),
          ),
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
