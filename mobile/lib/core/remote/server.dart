import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String baseUrl = 'http://10.0.2.2:8000';

Future<Map<String, dynamic>> request({
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
        return {
          'success': false,
          'message': 'Unsupported HTTP method: $method',
        };
    }

    final decoded =
        response.body.isNotEmpty ? jsonDecode(response.body) : null;

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return {
        'success': true,
        'data': decoded,
      };
    } else {
      return {
        'success': false,
        'message': decoded?['message'] ?? 'Request failed',
        'statusCode': response.statusCode,
      };
    }
  } catch (e) {
    return {
      'success': false,
      'message': e.toString(),
    };
  }
}
