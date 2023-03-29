import 'package:carewool_profitability_calculator/widget/util/space.dart';
import 'package:decimal/decimal.dart';
import 'package:event/event.dart';
import 'package:flutter/material.dart';

class BottomTotalBar extends StatefulWidget {
  const BottomTotalBar({
    Key? key,
    required this.recountEvent,
    required this.formKey,
  }) : super(key: key);

  final Event<Value<Decimal>> recountEvent;
  final GlobalKey<FormState> formKey;

  @override
  State<BottomTotalBar> createState() => _BottomTotalBarState();
}

class _BottomTotalBarState extends State<BottomTotalBar> {
  Decimal _total = Decimal.zero;

  void recount(Value<Decimal>? args) {
    setState(() => _total = args!.value);
  }

  @override
  void initState() {
    super.initState();
    if (widget.recountEvent.subscriberCount > 0) {
      widget.recountEvent.unsubscribe(recount);
    }
    widget.recountEvent.subscribe(recount);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: SizedBox(
              width: 100,
              child: Row(
                children: [
                  const Text('Итого:'),
                  const Space(4),
                  Text(
                    '$_total₽',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Save'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  widget.formKey.currentState!.reset();
                },
                child: const Text('Reset'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
