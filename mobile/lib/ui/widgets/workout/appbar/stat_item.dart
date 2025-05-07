import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class StatItem extends StatelessWidget{
  final String icon;
  final String value;
  final Color color;

  StatItem({required this.icon, required this.value,required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
       children: [
        SvgPicture.asset(
          icon,
          height: 24,
          width: 24,
          color: color,
        ),
        SizedBox(width: 8,),
        Text(value)
       ],
       );
  }

}