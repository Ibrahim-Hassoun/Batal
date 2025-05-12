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
    final token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3YwLjEvbG9naW4iLCJpYXQiOjE3NDcwNDg3OTksImV4cCI6MTc0NzA1MjM5OSwibmJmIjoxNzQ3MDQ4Nzk5LCJqdGkiOiJVU3RJY2FmTGRlc2xRVlR3Iiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.GcraRuyUkLVf3FQusakfXp8YUnvvUQ71id-Oe82fU1w';
        final postHeaders = Map<String, String>.from(defaultHeaders);
        postHeaders['Authorization'] = 'Bearer $token';
       
    switch (method.toUpperCase()) {
      case 'POST':
      
        // Add Bearer token if provided in headers
        
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
          headers: postHeaders,
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
