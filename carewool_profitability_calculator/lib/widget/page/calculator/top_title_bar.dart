import 'package:event/event.dart';
import 'package:flutter/material.dart';

class TopTitleBar extends StatefulWidget {
  const TopTitleBar({
    Key? key,
    required this.titleChangeEvent,
    required this.titleResetEvent,
  }) : super(key: key);

  final Event<Value<String>> titleChangeEvent;
  final Event titleResetEvent;

  @override
  State<TopTitleBar> createState() => _TopTitleBarState();
}

class _TopTitleBarState extends State<TopTitleBar> {
  static const String defaultTitle = 'Калькулятор себестоимости';

  String? title;

  String get currentTitle => title ?? defaultTitle;

  void onTitleSet(String value) => setState(() => title = value);

  void onTitleReset() => setState(() => title = null);

  @override
  void initState() {
    super.initState();

    widget.titleResetEvent.unsubscribeAll();
    widget.titleChangeEvent.unsubscribeAll();

    widget.titleResetEvent.subscribe((_) => onTitleReset());
    widget.titleChangeEvent.subscribe((args) => onTitleSet(args!.value));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary,
      child: SizedBox(
        width: double.infinity,
        height: 64,
        child: Center(
          child: Text(
            currentTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
