import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<dynamic> request({
    required String endpoint,
    required String method, 
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final defaultHeaders = {
      'Content-Type': 'application/json',
      ...?headers,
    };

    try {
      http.Response response;

      switch (method.toUpperCase()) {
        case 'POST':
          response = await http.post(
            url,
            headers: defaultHeaders,
            body: jsonEncode(body),
          );
          break;
        case 'GET':
          response = await http.get(
            url,
            headers: defaultHeaders,
          );
          break;
        case 'PUT':
          response = await http.put(
            url,
            headers: defaultHeaders,
            body: jsonEncode(body),
          );
          break;
        case 'DELETE':
          response = await http.delete(
            url,
            headers: defaultHeaders,
            body: jsonEncode(body),
          );
          break;
        default:
          throw Exception("Unsupported HTTP method: $method");
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
        };

      } else {
        throw Exception(
          'Failed: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
       return {
          'success':false,
          'message':e.toString(),
        };
    }
  }
}
