// repositories/user_repository.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRepository {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final String _baseUrl = 'http://13.61.33.10:8000/api';

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      // Store the token securely
      await _storage.write(key: 'auth_token', value: token);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {'username': username, 'password': password, 'email': email}),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to register');
    }
  }

  Future<void> logout() async {
    // Remove the token from secure storage
    await _storage.delete(key: 'auth_token');
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }
}
