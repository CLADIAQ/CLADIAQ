import 'package:flutter/material.dart';

class Item {
  final String text;
  final IconData leadingIcon;
  final IconData trailingIcon;

  Item(
      {required this.text,
      required this.leadingIcon,
      required this.trailingIcon});
}
