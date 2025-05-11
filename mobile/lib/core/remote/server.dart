import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String baseUrl = dotenv.env['LARAVEL_SERVER_URL'] ?? '';

Future<Map<String, dynamic>> request({
  required String endpoint,
  required String method,
  Map<String, dynamic>? body,
  Map<String, String>? headers,
  Function? optimistic,
  Function? rollback
}) async {
  final url = Uri.parse('$baseUrl$endpoint');
  final defaultHeaders = {
    'Content-Type': 'application/json',
    ...?headers,
  };

  try {
    optimistic?.call();
    http.Response response;
    
    switch (method.toUpperCase()) {
      case 'POST':
      
        // Add Bearer token if provided in headers
        final token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3YwLjEvbG9naW4iLCJpYXQiOjE3NDcwMDU2MzQsImV4cCI6MTc0NzAwOTIzNCwibmJmIjoxNzQ3MDA1NjM0LCJqdGkiOiJvWDFmbkxZUUowanhncUQ0Iiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.vdBG5L20No6H8nwJrHC9hmn2w1Qz67MEgO4_oU72OWs';
        final postHeaders = Map<String, String>.from(defaultHeaders);
        postHeaders['Authorization'] = 'Bearer $token';
       
        response = await http.post(
          url,
          headers: postHeaders,
          body: jsonEncode(body),
        );
        print('response: ${response.body}');
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
    rollback?.call();
    print('error: $e');
    return {
      'success': false,
      'message': e.toString(),
    };
  }
}
