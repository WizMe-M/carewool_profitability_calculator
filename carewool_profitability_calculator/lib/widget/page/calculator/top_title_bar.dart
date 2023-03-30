import 'package:event/event.dart';
import 'package:flutter/material.dart';

class CalcAppBar extends AppBar {
  CalcAppBar({
    required this.titleChangeEvent,
    required this.titleResetEvent,
    super.key,
  });

  final Event<Value<String>> titleChangeEvent;
  final Event titleResetEvent;

  @override
  State<CalcAppBar> createState() => _TopTitleAppBarState();
}

class _TopTitleAppBarState extends State<CalcAppBar> {
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
    return AppBar(
      title: Text(currentTitle),
    );
  }
}
