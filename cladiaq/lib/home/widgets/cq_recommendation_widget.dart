import 'package:flutter/material.dart';

class CqRecommendationWidget extends StatelessWidget {
  const CqRecommendationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 180,
      width: 320,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Color(0xff81CEF9)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "NOTES",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "This living Space is in good Condition. Keep it this way :)",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff666666)),
          ),
          Text(
            "Please add your content here. Keep it short and simple. And smile :) ",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff666666)),
          ),
        ],
      ),
    );
  }
}
