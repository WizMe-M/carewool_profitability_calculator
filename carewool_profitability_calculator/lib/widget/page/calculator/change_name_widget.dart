import 'package:carewool_profitability_calculator/widget/util/space.dart';
import 'package:event/event.dart';
import 'package:flutter/material.dart';

class ChangeNameWidget extends StatefulWidget {
  const ChangeNameWidget({
    super.key,
    required this.titleChangeEvent,
    required this.titleResetEvent,
  });

  final Event<Value<String>> titleChangeEvent;
  final Event titleResetEvent;

  @override
  State<ChangeNameWidget> createState() => _ChangeNameWidgetState();
}

class _ChangeNameWidgetState extends State<ChangeNameWidget> {
  final _controller = TextEditingController();

  bool isApplied = false;

  String get _btnText => isApplied ? 'Изменить' : 'Применить';

  void apply() {
    var name = _controller.text;
    if (name.isEmpty) return;

    setState(() => isApplied = true);
    widget.titleChangeEvent.broadcast(Value(name));
  }

  void reset() {
    setState(() => isApplied = false);
    widget.titleResetEvent.broadcast();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _controller,
            readOnly: isApplied,
            decoration: const InputDecoration(
              label: Text('Наименование товара'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
        ),
        const Space(16),
        ElevatedButton(
          onPressed: () {
            if (isApplied) {
              reset();
            } else {
              apply();
            }
          },
          child: Text(_btnText),
        ),
      ],
    );
  }
}
