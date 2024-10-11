import 'package:cladiaq/commons/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CqCommands extends StatelessWidget {
  const CqCommands({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Wrap(
        children: [
          CommandButton("ON", "assets/icons/gas.svg", name: "PURIFY"),
          CommandButton("ON", "assets/icons/humidity.svg", name: "HUMIDIFY"),
          CommandButton("CAPTURE", "assets/icons/cq_camera.svg"),
          CommandButton("STOP", "assets/icons/cq_stop.svg"),
        ],
      ),
    );
  }
}

Widget CommandButton(String command, String asset, {String? name}) {
  return Container(
    margin: EdgeInsets.all(8),
    height: 92,
    width: 150,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: cqPrimaryColor, width: 4),
        color: Color(0xffF0F9FF)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          asset,
          color: cqPrimaryColor,
        ),
        SizedBox(
          child: (name != null)
              ? Text(
                  name,
                  style: TextStyle(color: cqPrimaryColor, fontSize: 9),
                )
              : null,
        ),
        Text(
          command,
          style: TextStyle(
              color: cqPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
