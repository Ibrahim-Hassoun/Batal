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
      throw Exception('Could not load saved exercices');
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


void removeExercice(ExerciseRowState exercicRowState) async{
  print("/api/v0.1/exercices/saved/${exercicRowState.id}");
  int prevCount = exercicRowState.count;
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/exercices/saved/${exercicRowState.id}',
    method: 'DELETE',
    optimistic: ()=>exercicRowState.setState(() {
      exercicRowState.count=0;
      }),
    rollback: ()=>exercicRowState.setState(() {
      exercicRowState.count=prevCount;
      }),
    );
    if(!response['success']){
      print('failed to delete exercice:');
      print(response);
    }
}

void completeExercice(ExerciseRowState exercicRowState) async{
  int prevCount = exercicRowState.count;
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/exercices/saved/${exercicRowState.id}/complete',
    method: 'PATCH',
    optimistic: ()=>exercicRowState.setState(() {
      exercicRowState.count=0;
      }),
    rollback: ()=>exercicRowState.setState(() {
      exercicRowState.count=prevCount;
      }),
    );
}