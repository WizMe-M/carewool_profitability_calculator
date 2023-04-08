import 'dart:async';

import 'package:mobx/mobx.dart';

part 'input.g.dart';

class Input = InputBase with _$Input;

abstract class InputBase with Store {
  final StreamController _streamController = StreamController();
  final String label;
  late List<ReactionDisposer> _disposers;

  @observable
  String text = '';

  @observable
  String? error;

  InputBase({required this.label});

  Stream get stream => _streamController.stream;

  @computed
  double get value => isValid ? double.tryParse(text) ?? 0 : 0;

  @computed
  bool get isValid => error == null;

  void setupReaction() {
    _disposers = [
      reaction((_) => text, validate),
      reaction((_) => text, _streamController.add),
    ];
  }

  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }

  @action
  void clear() => text = '';

  @action
  void validate(String s) {
    if (s.isEmpty) {
      error = null;
      return;
    }

    var num = double.tryParse(s);
    if (num == null) {
      error = 'Введите число';
      return;
    }

    if (num <= 0) {
      error = 'Число должно быть больше нуля';
      return;
    }

    error = null;
  }
}
