import 'dart:convert';

import 'package:http/http.dart' as http;

class GHTTPHelper {
  static const String _baseurl = ' '; // api

  // Helper method to make a Get request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseurl/$endpoint'));
    return _handleResponse(response);
  }

  // Helper method to make a post request
  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseurl/$endpoint'),
      headers: {'Content-Type': 'applications/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // helper Method to make a put request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.delete(Uri.parse('$_baseurl/$endpoint'));
    return _handleResponse(response);
  }

  // Handle Http response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
