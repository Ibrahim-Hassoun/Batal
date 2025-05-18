import 'package:mobile/core/remote/server.dart';
import 'package:mobile/ui/widgets/workout/leaderboard/leaderboard.dart';


Future <List<dynamic>>  fetchRows(LeaderboardState leaderBoardState) async{
  leaderBoardState.loading = true;
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/leaderboard/weekly',
    method: "GET");

    if(response['success']){
      leaderBoardState.loading = false;
      return response['data']['data'];
    }
    else{
      throw Exception('Could not load rows');
    }
}