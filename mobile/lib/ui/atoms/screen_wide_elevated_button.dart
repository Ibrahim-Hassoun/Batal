import 'package:flutter/material.dart';

import 'package:mobile/main.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ScreenWideElevatedButton extends StatelessWidget{
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  const ScreenWideElevatedButton({super.key,required this.label,required this.onPressed,required this.backgroundColor,required this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    // 
    return Row(
                children: [
                  Expanded(
                    child: PlatformElevatedButton(
                      onPressed: onPressed,
                      color: bg_gray,
                      material: (_, __) => MaterialElevatedButtonData(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: backgroundColor,
                          foregroundColor: foregroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      cupertino: (_, __) => CupertinoElevatedButtonData(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: 
                          PlatformText(label,style: TextStyle(fontSize: 20),),
                        
                      
                    ),
                  ),
                ],
              );
  }
}