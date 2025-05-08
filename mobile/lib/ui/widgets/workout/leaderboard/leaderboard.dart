import 'package:flutter/material.dart';
import './player_row.dart';

class Leaderboard extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16,),
        PlayerRow(playerName: 'playerName', playerScore: 100, rank: 2)
      ],
    );
  }
}