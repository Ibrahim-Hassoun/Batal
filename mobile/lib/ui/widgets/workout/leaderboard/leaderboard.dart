import 'package:flutter/material.dart';
import 'package:mobile/ui/widgets/workout/leaderboard/leaderboard_logic.dart';
import './player_row.dart';
import './leaderboard.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  late List< dynamic> players=[];

  @override
  void initState() {
    
    super.initState();
    loadRows();
  }
  void loadRows()async{
    players = await fetchRows();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        
         ListView.builder(
              physics: const NeverScrollableScrollPhysics(), 
              shrinkWrap: true,
              
              itemCount: players.length,
              itemBuilder: (context,index){
                 var playerData = players[index]; 
                 return PlayerRow(playerName: playerData['first_name']+' '+playerData['last_name'],playerScore: playerData['current_xp'],rank: index+1,imageUrl: playerData['profile_photo_url'] ?? 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',streak: playerData['streak'],
                  );
              },
            )
      ],
    );
  }
}