import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  const Space(this.value, {Key? key}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) => SizedBox(width: value, height: value);
}
