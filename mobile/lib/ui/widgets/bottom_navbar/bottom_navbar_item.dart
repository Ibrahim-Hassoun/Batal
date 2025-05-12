import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/main.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/bottom_navbar_provider.dart';

class BottomNavbarItem extends StatefulWidget implements PreferredSizeWidget {
  
  final String icon;
  final String label;
  final Widget widget;
  final String state;
 

  const BottomNavbarItem({super.key, 
    required this.icon,
    required this.label,
    required this.widget,
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
  final isActive = Provider.of<BottomNavbarProvider>(context).activeState == widget.state;
  final myColor = isActive ? primaryColor : text_gray;

  return SizedBox(
    height: 50,
    child: GestureDetector(
      onTap: () => {
        Provider.of<BottomNavbarProvider>(context, listen: false).changeState(widget.state),
        Provider.of<BottomNavbarProvider>(context, listen: false).change_screen(widget.widget),
        
      },
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
              color: myColor,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 6,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 12,
                  height: 0.1,
                  color: myColor,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

}
