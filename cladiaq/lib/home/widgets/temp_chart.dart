import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TemperatureChart extends StatelessWidget {
  final List<double> temperatures; // Temperature data
  final List<String> hours; // Time labels

  TemperatureChart({required this.temperatures, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16.0),
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
                    child: Text(hours[value.toInt()]),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
          ),
          borderData: FlBorderData(
              show: true, border: Border.all(color: Colors.black, width: 1)),
          minX: 0,
          maxX: temperatures.length.toDouble() - 1,
          minY: 15,
          maxY: 40,
          lineBarsData: [
            LineChartBarData(
              spots: _getChartData(),
              isCurved: true,
              gradient: LinearGradient(
                colors: _getLineColors(),
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: _getLineColors(),
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _getChartData() {
    return List.generate(temperatures.length,
        (index) => FlSpot(index.toDouble(), temperatures[index]));
  }

  List<Color> _getLineColors() {
    return temperatures.map((temp) {
      if (temp >= 30) return Colors.red; // Above normal
      if (temp <= 22) return Colors.blue; // Below normal
      return Colors.green; // Normal
    }).toList();
  }

  Color _getAreaColor() {
    return Colors.green.withOpacity(0.3);
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example data
    List<double> temperatures = [20, 25, 28, 30, 32, 22, 18, 29, 31];
    List<String> hours = [
      "1 AM",
      "2 AM",
      "3 AM",
      "4 AM",
      "5 AM",
      "6 AM",
      "7 AM",
      "8 AM",
      "9 AM"
    ];

    return MaterialApp(
      title: 'Temperature Chart Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Temperature vs Time')),
        body: Center(
          child: TemperatureChart(temperatures: temperatures, hours: hours),
        ),
      ),
    );
  }
}
