import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class ApiServices {


static final String baseUrl = dotenv.env['LARAVEL_SERVER_URL'] ?? '';
static String access_token='';


static Future<Map<String, dynamic>> request({
  required String endpoint,
  required String method,
  Map<String, dynamic>? body,
  Map<String, String>? headers,
  Function? optimistic,
  Function? rollback,
  
}) async {
  final url = Uri.parse('$baseUrl$endpoint');
  final defaultHeaders = {
    'Content-Type': 'application/json',
    ...?headers,
  };

  try {
    optimistic?.call();
    http.Response response;
    final token =access_token;
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
          headers: postHeaders,
          body: jsonEncode(body),
        );
        break;
      case 'PATCH':
        response = await http.patch(
          url,
          headers: postHeaders,
          body: jsonEncode(body),
        );
        break;
      case 'DELETE':
        response = await http.delete(
          url,
          headers: postHeaders,
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
}