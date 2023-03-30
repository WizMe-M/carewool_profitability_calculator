import 'package:carewool_profitability_calculator/widget/util/space.dart';
import 'package:decimal/decimal.dart';
import 'package:event/event.dart';
import 'package:flutter/material.dart';

class BottomTotalBar extends StatefulWidget {
  const BottomTotalBar({
    super.key,
    required this.recountEvent,
    required this.formKey,
  });

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
    widget.recountEvent.unsubscribeAll();
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
              width: 140,
              child: Row(
                children: [
                  const Text(
                    'Итого:',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Space(4),
                  Text(
                    '$_total₽',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () => widget.formKey.currentState!.reset(),
                child: const Text('Reset'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
