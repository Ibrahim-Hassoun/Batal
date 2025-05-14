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

void decrementSets(ExerciseRowState exercicRowState) async {
  
  if(exercicRowState.count>0){
    var response = await ApiServices.request(
    endpoint: '/api/v0.1/exercices/saved/${exercicRowState.id}/decrement',
    method: 'PATCH',
    optimistic: () {
      exercicRowState.setState(() => exercicRowState.count--);
    },
    rollback: (){
      exercicRowState.setState(() => exercicRowState.count++);
    }
    );
  }
 
}

void incrementSets(ExerciseRowState exercicRowState) async {
  if(exercicRowState.count<5){
     var response = await ApiServices.request(
    endpoint: '/api/v0.1/exercices/saved/${exercicRowState.id}/increment',
    method: 'PATCH',
    optimistic: () {
      exercicRowState.setState(() => exercicRowState.count++);
    },
    rollback: (){
      exercicRowState.setState(() => exercicRowState.count--);
    }
    );
  }
 
}