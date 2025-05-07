import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class StatItem extends StatelessWidget{
  final String icon;
  final String value;

  StatItem({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
        SvgPicture.asset(
          icon,
          height: 24,
          width: 24,
        ),
        Text(value)
       ],
       );
  }

}