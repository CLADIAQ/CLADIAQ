// services/device_data_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class DeviceDataService {
  Future<List<dynamic>> fetchDeviceData(String token) async {
    print(token);
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/apid/sensor-data'),
      headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json', // Adjust if required
      },
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      return json.decode(response.body); // Adjust based on your API response
    } else {
      throw Exception('Failed to load device data');
    }
  }
}
