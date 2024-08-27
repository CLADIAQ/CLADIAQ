import 'package:cladiaq/commons/colors.dart';
import 'package:flutter/material.dart';

class CqInputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? trailingTapped;
  final bool password;
  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );
  CqInputField(
      {Key? key,
      required this.controller,
      this.placeholder = '',
      this.password = false,
      this.leading,
      this.trailing,
      this.trailingTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(height: 1),
      obscureText: password,
      decoration: InputDecoration(
          hintText: placeholder,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          filled: true,
          prefix: leading,
          suffix: trailing != null
              ? GestureDetector(onTap: trailingTapped, child: trailing)
              : null,
          fillColor: cqVeryLightGreyColor,
          border: circularBorder.copyWith(
              borderSide: const BorderSide(color: cqLightGreyColor)),
          errorBorder: circularBorder.copyWith(
              borderSide: const BorderSide(color: cqDanger)),
          focusedBorder: circularBorder.copyWith(
              borderSide: const BorderSide(color: cqPrimaryColor)),
          enabledBorder: circularBorder.copyWith(
              borderSide: const BorderSide(color: cqLightGreyColor))),
    );
  }
}
