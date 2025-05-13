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
  
  throw Exception('Failed to fetch exercices');
}

Future<List<dynamic>> fetchRecommendedExercices() async{
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/exercices/recommended',
    method: 'GET'
  );
  if (response['success']){
    print(response['data']['data']);
    return response['data']['data'];
  }
  
  throw Exception('Failed to fetch exercices');
}