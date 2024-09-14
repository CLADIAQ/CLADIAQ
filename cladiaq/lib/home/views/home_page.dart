import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cladiaq/commons/widgets/cq_app_bar.dart';
import 'package:cladiaq/commons/widgets/cq_buttomn_nav_bar.dart';
import 'package:cladiaq/home/widgets/bar_chart_widget.dart';
import 'package:cladiaq/home/widgets/line_chart_widget.dart';
import 'package:cladiaq/home/widgets/map_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CqAppBar(hasNotifications: true, title: "Hello, Serah!"),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, // Set the body color to transparent
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MapWidget(),
                  verticalSpaceSmall,
                  LineChartWidget(),
                  verticalSpaceSmall,
                  BarChartWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          const SafeArea(child: CqButtomnNavBar()), // Keep this as is
    );
  }
}
