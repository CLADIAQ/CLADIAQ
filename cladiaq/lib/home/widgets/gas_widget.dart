import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:flutter/material.dart';

class GasWidget extends StatefulWidget {
  final String gas;
  final int value;
  const GasWidget({super.key, required this.gas, required this.value});

  @override
  State<GasWidget> createState() => _GasWidgetState();
}

class _GasWidgetState extends State<GasWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.value.toString()),
          Text("PPM"),
          Container(
            height: 165,
            width: 12,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(6)),
                    height: 165,
                    width: 12,
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: cqPrimaryColor,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ],
            ),
          ),
          verticalSpaceSmall,
          Text(
            widget.gas,
            style: TextStyle(color: cqPrimaryColor),
          ),
        ],
      ),
    );
  }
}
