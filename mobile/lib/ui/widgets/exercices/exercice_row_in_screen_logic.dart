import 'package:mobile/core/remote/server.dart';
import './exercice_row_in_screen.dart';

void saveExercice(ExerciseRowInScreenState exerciceRowInScreenState) async {
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/exercices/${exerciceRowInScreenState.id}/save',
    method: 'POST',
    
    );
}