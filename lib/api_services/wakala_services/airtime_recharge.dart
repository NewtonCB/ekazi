import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart'; // Import IOClient for SSL bypass

class AirtimeRechargeService {
  // Base API URL with IP and port
  final String _baseUrl = 'https://155.12.30.109:44888/'; // Adjust this IP and port as needed

  // Method to disable SSL certificate verification
  HttpClient getHttpClient() {
    final HttpClient client = HttpClient();
    client.badCertificateCallback = (X509Certificate cert, String host, int port) {
      // print('Allowing self-signed certificate: $host:$port'); // Log for debugging
      return true; // Bypass SSL check
    };
    return client;
  }

  // Perform a POST request with SSL disabled
  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    try {
      // Create an IOClient with SSL bypass
      final ioClient = IOClient(getHttpClient());

      // Build the full URL
      final url = Uri.parse('$_baseUrl$endpoint');

      // Log request details for debugging
      // print('Sending POST request to $url with body: $body');

      // Perform the POST request
      final response = await ioClient.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      // Log the response for debugging
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      return response;
    } catch (e) {
      // Log any errors that occur during the request
      // print('Error occurred during POST request: $e');
      throw Exception('Failed to perform POST request');
    }
  }

// Add other HTTP methods as needed (GET, PUT, DELETE, etc.)
}
