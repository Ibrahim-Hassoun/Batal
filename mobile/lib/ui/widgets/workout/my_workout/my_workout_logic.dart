import 'package:mobile/core/remote/server.dart';
import './exercice_row.dart';

Future<List<dynamic>> fetchSavedExercices() async{
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/exercices/saved',
    method: "GET");
    
    if (response['success']){
      print (response['data']['data']);
      return response['data']['data'];
    }else{
      throw new Exception('Could not load saved exercices');
    }
}

void decrementsSets(ExerciseRowState exercicRowState) async {
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/exercices/saved/1/decrement',
    method: 'PATCH',
    optimistic: (){exercicRowState.count++;},
    rollback: (){exercicRowState.count--;}
    );
}