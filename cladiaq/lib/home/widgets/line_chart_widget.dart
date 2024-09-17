import 'package:cladiaq/commons/data/model/models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LineChartWidget extends StatefulWidget {
  final List<SensorData> sensorDataList;

  LineChartWidget({required this.sensorDataList});

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<SensorData> displayedData = [];
  late Timer timer;
  int currentIndex = 0;
  final int displayCount = 10; // Number of data points to display

  @override
  void initState() {
    super.initState();
    // Initialize with the first 10 data points
    displayedData = widget.sensorDataList.take(displayCount).toList();
    // Start a timer to update the chart
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        // Check if we can add a new data point
        if (currentIndex + displayCount < widget.sensorDataList.length) {
          // Slide the window by removing the first and adding the next
          displayedData.removeAt(0); // Remove the oldest data
          displayedData.add(widget.sensorDataList[
              currentIndex + displayCount]); // Add the next data point
          currentIndex++;
        } else {
          // Stop the timer if there are no more data points
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Prepare FlSpot data for the chart
    List<FlSpot> spots = [];
    for (int i = 0; i < displayedData.length; i++) {
      spots.add(FlSpot(i.toDouble(), displayedData[i].temperature!));
    }

    // Prepare time labels for the visible data
    List<int> timeLabels = displayedData.map((data) => data.deviceId).toList();

    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 38,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      timeLabels[value.toInt()].toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      value.toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Colors.blue,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
