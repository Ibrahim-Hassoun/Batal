import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/main.dart';

class FeedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FeedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Text('Welcome!',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),),
          Row(children: [
            Container(
            decoration: BoxDecoration(
              
             
            ),
            child:SvgPicture.asset('assets/bell.svg'),
            ),
            SizedBox(width: 16),
          Icon(Icons.search, color: secondaryColor, size:32),
          SizedBox(width: 16),
          GestureDetector(
            onTap:(){
              Navigator.pushNamed(context, '/chats');
            } ,
            child: SvgPicture.asset('assets/message-circle.svg',)),
          ],)
          
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}