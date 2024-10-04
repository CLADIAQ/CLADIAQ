import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AQIRemark extends StatelessWidget {
  const AQIRemark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 70,
      child: Column(
        children: [
          Text(
            "GOOD",
            style: TextStyle(color: Colors.green, fontSize: 20),
          ),
          Container(
            width: 300,
            child: Stack(
              children: [
                Image.asset("assets/images/remark.png"),
                Positioned(
                    left: 110,
                    child: SvgPicture.asset(
                      'assets/icons/cq_stroke.svg',
                      color: Color(0xffA6A6A6),
                    ))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "0",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "100",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "200",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "300",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "400",
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
