import 'package:flutter/material.dart';
import './player_row.dart';

class Leaderboard extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16,),
        PlayerRow(playerName: 'John Doe', playerScore: 100, rank: 2,imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',streak: 40,)
      ],
    );
  }
}