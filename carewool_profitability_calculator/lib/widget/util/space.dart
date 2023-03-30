import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  const Space(this.value, {super.key});

  final double value;

  @override
  Widget build(BuildContext context) => SizedBox(width: value, height: value);
}
