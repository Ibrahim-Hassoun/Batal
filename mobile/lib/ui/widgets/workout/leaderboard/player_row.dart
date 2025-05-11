import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/main.dart';


class PlayerRow extends StatelessWidget {
  final String playerName;
  final int playerScore;
  final int rank;
  final int streak;
  final String imageUrl;

  const PlayerRow({
    super.key,
    required this.playerName,
    required this.playerScore,
    required this.rank,
    required this.imageUrl,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16,left: 16),
      child: SizedBox(
        height: 48, 
        child: ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$rank',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              if (imageUrl.isNotEmpty)
                SizedBox(
                  width: 48,
                  height: 48,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
            ],
          ),
          title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(playerName),
          if(streak >30)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/flame-kindling.svg', width: 16, height: 16, color: primaryColor,),
              Text('$streak', style: TextStyle(color: text_gray,fontStyle: FontStyle.italic),),
            ],
          ),
        ],
          ),
          trailing: Text('$playerScore Points',style: TextStyle(fontSize: 16,color: text_gray,fontWeight: FontWeight.w800),),
        ),
      )
      );
  }
}