import 'package:flutter/material.dart';

class CqRecommendationWidget extends StatelessWidget {
  const CqRecommendationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      // margin: EdgeInsets.all(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Color(0xff81CEF9)),

      height: 162,
      width: 338,
      child: Container(
        width: 256,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "NOTES",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "This living Space is in good Condition. Keep it this way :)",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff666666), fontSize: 12),
            ),
            Text(
              "Please add your content here. Keep it short and simple. And smile :) ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff666666), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
