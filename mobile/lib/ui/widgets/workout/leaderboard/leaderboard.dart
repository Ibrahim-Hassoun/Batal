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
  late final List< dynamic> players;

  @override
  void initState() {
    
    super.initState();
    loadRows();
  }
  void loadRows()async{
    players = await fetchRows();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        PlayerRow(
          playerName: 'John Doe',
          playerScore: 100,
          rank: 2,
          imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
          streak: 40,
        ),
         ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              shrinkWrap: true,
              
              itemCount: players.length,
              itemBuilder: (context,index){
                 var exerciceData = players[index]; 
                 return PlayerRow(playerName: 'John Doe',playerScore: 100,rank: 2,imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',streak: 40,
                  );
              },
            )
      ],
    );
  }
}