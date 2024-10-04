import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:flutter/material.dart';

class AtmSound extends StatelessWidget {
  const AtmSound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AtmWidget("HUMIDITY", "assets/images/loader_blue.png", "60%", true),
          AtmWidget(
              "ATM PRESSURE", "assets/images/loader-red.png", "760hPa", false),
        ],
      ),
    );
  }

  Widget AtmWidget(String title, String image, String value, bool isAtm) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: cqPrimaryColor),
          ),
          verticalSpaceSmall,
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(image),
                Text(
                  value,
                  style: TextStyle(
                      fontSize: 20,
                      color: isAtm ? cqPrimaryColor : Color(0xffFB8F42)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
