import 'package:flutter/material.dart';


class PlayerRow extends StatelessWidget {
  final String playerName;
  final int playerScore;
  final int rank;
  final int? streak;

  const PlayerRow({
    Key? key,
    required this.playerName,
    required this.playerScore,
    required this.rank,
    this.streak,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(rank.toString()),
      title: Text(playerName),
      trailing: Text(playerScore.toString()),
    );
  }
}