import 'package:flutter/material.dart';

enum Position {
  first(TextInputAction.next),
  middle(TextInputAction.next),
  last(TextInputAction.done),
  single(TextInputAction.done);

  final TextInputAction action;

  const Position(this.action);
}
