import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/commons/styles.dart';
import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CqIconButton extends StatelessWidget {
  final String icon;
  final bool disabled;
  final VoidCallback onPressedCq;
  const CqIconButton({
    Key? key,
    required this.icon,
    required this.onPressedCq,
    this.disabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedCq,
      child: Container(
          width: 22,
          height: 22,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: !disabled ? cqPrimaryColor : Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: cqPrimaryColor)),
          child: SvgPicture.asset(
            icon,
            color: !disabled ? Colors.white : cqPrimaryColor,
          )),
    );
  }
}
