import 'package:mobile/core/remote/server.dart';


Future <List<dynamic>>  fetchRows() async{

  var response = await ApiServices.request(
    endpoint: '/api/v0.1/leaderboard/weekly',
    method: "GET");

    if(response['success']){
      return response['data']['data'];
    }
    else{
      throw new Exception('Could not load rows');
    }
}