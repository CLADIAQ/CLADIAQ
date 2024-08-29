import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/commons/styles.dart';
import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:cladiaq/widgets/cq_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CqButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final bool outline;
  final Widget? leading;
  final VoidCallback onPressedCq;
  const CqButton(
      {Key? key,
      required this.title,
      required this.onPressedCq,
      this.disabled = false,
      this.busy = false,
      this.outline = false,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedCq,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        height: 58,
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
                color: !disabled ? cqPrimaryColor : cqMediumGreyColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: !disabled ? cqPrimaryColor : cqMediumGreyColor))
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: cqMediumGreyColor, width: 1)),
        child: !busy
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: leading != null ? leading! : null,
                  ),
                  if (leading != null) horizontalSpaceMedium,
                  Text(
                    title,
                    style: bodyStyle.copyWith(
                        fontWeight:
                            !outline ? FontWeight.bold : FontWeight.w400,
                        color: !outline ? Colors.white : cqMediumGreyColor),
                  )
                ],
              )
            : const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 5,
              ),
      ),
    );
  }
}
