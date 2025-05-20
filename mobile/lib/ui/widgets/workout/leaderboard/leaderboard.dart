import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/widgets/workout/leaderboard/leaderboard_logic.dart';
import './player_row.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => LeaderboardState();
}

class LeaderboardState extends State<Leaderboard> {
  late List< dynamic> players=[];
  bool loading = true;

  @override
  void initState() {
    
    super.initState();
    loadRows();
  }
  void loadRows()async{
    players = await fetchRows(this);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return
     loading?
    Center(child: CircularProgressIndicator(color: primaryColor,))
    :
    Column(
      children: [
        SizedBox(height: 16),
        
         ListView.builder(
              physics: const NeverScrollableScrollPhysics(), 
              shrinkWrap: true,
              
              itemCount: players.length,
              itemBuilder: (context,index){
                 var playerData = players[index]; 
                 return PlayerRow(playerName: playerData['first_name']+' '+playerData['last_name'],playerScore: playerData['current_xp'],rank: index+1,imageUrl: playerData['profile_photo_path'] ,streak: playerData['streak'],
                  );
              },
            )
      ],
    );
  }
}