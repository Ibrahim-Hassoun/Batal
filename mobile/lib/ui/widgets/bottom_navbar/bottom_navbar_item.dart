import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/main.dart';

class BottomNavbarItem extends StatefulWidget implements PreferredSizeWidget {
  
  final String icon;
  final String label;
  final String route;
  final String state;
 

  BottomNavbarItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.state,
  });

  @override
  _BottomNavbarItemState createState() => _BottomNavbarItemState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _BottomNavbarItemState extends State<BottomNavbarItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
            child: SvgPicture.asset(
              widget.icon,
              width: 20,
              height: 20,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 6,
            child: FittedBox( 
              fit: BoxFit.scaleDown,
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 12,
                  height: 0.1, 
                  color: primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
