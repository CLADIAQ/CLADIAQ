// services/device_data_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class DeviceDataService {
  Future<List<dynamic>> fetchDeviceData(String token) async {
    final response = await http.get(
      Uri.parse(
          'http://10.0.2.2:8000/apid/sensor-data'), // Replace with your API endpoint
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Adjust based on your API response
    } else {
      throw Exception('Failed to load device data');
    }
  }
}
