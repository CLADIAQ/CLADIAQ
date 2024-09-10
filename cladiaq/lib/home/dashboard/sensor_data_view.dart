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
      IOWebSocketChannel.connect('ws://10.0.2.2:8000/ws/sensor-data/');
  String? temperature = "No data";

  @override
  void initState() {
    print("I am in");
    super.initState();
    channel.stream.listen((data) {
      final jsonData = json.decode(data);
      print(data);
      // Decode the incoming JSON data
      setState(() {
        temperature = jsonData['temperature']; // Update the temperature value
      });
    }, onDone: () {
      debugPrint("ws was closed");
    }, onError: (error) {
      debugPrint(error);
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
