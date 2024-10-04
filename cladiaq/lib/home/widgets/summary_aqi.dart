import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:flutter/material.dart';

class AqiSumHome extends StatelessWidget {
  const AqiSumHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 124,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [sumText("30 °C"), sumText("10 dB")],
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                color: Color(0xff81CEF9),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "AQI",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                Text(
                  "180",
                  style: TextStyle(
                      color: cqPrimaryColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [sumText("50 %"), sumText("60hPa")],
          ),
        ],
      ),
    );
  }
}

Widget sumText(String text) {
  return Text(text,
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w400, color: Color(0xffA6A6A6)));
}
