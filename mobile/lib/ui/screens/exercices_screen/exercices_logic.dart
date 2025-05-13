import '../../../core/remote/server.dart';

Future<void> fetchExercices() async{
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/exercices/search',
    method: 'GET'
  );
  if (response['success']){
    print(response['data']['data']);
  }
}