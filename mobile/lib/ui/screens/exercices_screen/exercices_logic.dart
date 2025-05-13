import '../../../core/remote/server.dart';

Future<List<dynamic>> fetchExercices() async{
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/exercices/search',
    method: 'GET'
  );
  if (response['success']){
    print(response['data']['data']);
    return response['data']['data'];
  }
  // You can throw an exception or return an empty list if the request fails
  throw Exception('Failed to fetch exercices');
}