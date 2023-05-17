import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../database/entity/profitability.dart';
import '../../../../domain/profitability/profitability_form.dart';
import '../../../../domain/validation/profitability_validator.dart';

class SaveButton extends StatelessWidget {
  final Isar _isar = GetIt.I.get();
  final ProfitabilityForm form;

  SaveButton({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () => saveProfitability(context),
        child: const Text('Сохранить расчёт'),
      ),
    );
  }

  Future<void> saveProfitability(BuildContext context) async {
    var validator = ProfitabilityValidator();
    var errors = validator.validate(form);
    if (errors.isNotEmpty) {
      final String content = errors.join('\n');
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Ошибка'),
          content: Text(content),
        ),
      );
      return;
    }

    var messenger = ScaffoldMessenger.of(context);
    FocusManager.instance.primaryFocus?.unfocus();
    var entity = form.toEntity();
    _isar.writeTxn(() async {
      await _isar.profitabilityCalcs.put(entity);
      entity.commission.save();
      entity.storage.save();
    }).then((value) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Расчёт был сохранен'),
          duration: Duration(seconds: 1),
        ),
      );
    }).onError((e, s) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Не удалось сохранить расчет'),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }
}
