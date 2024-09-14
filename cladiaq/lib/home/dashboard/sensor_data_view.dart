import 'dart:convert'; // Import for JSON decoding
import 'package:cladiaq/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class SensorDataPage extends StatefulWidget {
  @override
  _SensorDataPageState createState() => _SensorDataPageState();
}

class _SensorDataPageState extends State<SensorDataPage> {
  final WebSocketChannel channel =
      IOWebSocketChannel.connect('ws://13.61.33.10:8000/ws/sensor-data/');
  String temperature = "No data"; // Changed to non-nullable String

  @override
  void initState() {
    super.initState();
    channel.stream.listen((data) {
      final jsonData = json.decode(data);
      print(jsonData);

      // Check if the temperature field exists and is not null
      if (jsonData['sensor_data']['temperature'] != null) {
        setState(() {
          temperature = jsonData['sensor_data']['temperature'].toString();
          print("I am not null");
          print(temperature);
          print("I am not null");
          // Convert to String for display
        });
      } else {
        print(" I am null");
        print(" I am null");
        print(" I am null");
        print(" I am null");
        print(" I am null");
      }
    }, onDone: () {
      debugPrint("WebSocket was closed");
    }, onError: (error) {
      debugPrint(error.toString());
    });
  }

  @override
  void dispose() {
    channel.sink.close(); // Close the WebSocket connection
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }),
      appBar: AppBar(title: Text('Atmosphere Data')),
      body: Center(
        child: Text('Current Temperature: $temperature °C',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
