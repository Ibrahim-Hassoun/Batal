import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './ui/screens/authScreen/auth_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import './ui/screens/feedScreen/feed_screen.dart';

const Color primaryColor =Color(0xFFF7713D);
const Color secondaryColor =Color.fromARGB(255, 31, 31, 31);
const Color tertiaryColor =Color.fromARGB(255, 255, 255, 255);
const Color bg_gray = Color(0xEEEEEEEE);

const Color text_gray = Color.fromARGB(255, 179, 179, 179);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    
    return PlatformApp(
      title: 'Flutter Demo',
      material: (_, __) => MaterialAppData(
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          textTheme: ThemeData.light().textTheme.apply(
            bodyColor: secondaryColor,  
            displayColor: secondaryColor,
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey[900],
          textTheme: ThemeData.dark().textTheme.apply(
            bodyColor: Colors.white,  
            displayColor: Colors.white,
          ),
        ),
        themeMode: ThemeMode.system,  // Automatically switches between light/dark themes
      ),
      routes: {
        '/auth':(context) =>AuthScreen(),
        '/feed':(context) => FeedScreen(),
        
      },
      cupertino: (_, __) => CupertinoAppData(
        theme: isDarkMode
            ? CupertinoThemeData(
                primaryColor: CupertinoColors.inactiveGray,
                textTheme: CupertinoTextThemeData(
                  textStyle: TextStyle(color: Colors.white),
                ),
              )
            : CupertinoThemeData(
                primaryColor: CupertinoColors.activeBlue,
                textTheme: CupertinoTextThemeData(
                  textStyle: TextStyle(color: secondaryColor),
                ),
              ),
      ),
      home:Builder(builder: 
      (context)=>Scaffold(
        appBar: AppBar(
          title: const Text('Navigation Example'),
          backgroundColor: primaryColor,
        ),
        body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
          Navigator.pushNamed(context, '/auth');
            },
            child: const Text('Go to Auth Screen'),
          ),
          ElevatedButton(
            onPressed: () {
          Navigator.pushNamed(context, '/feed');
            },
            child: const Text('Go to Feed Screen'),
          ),
        ],
          ),
        ),
      )
      ) 
    );
  }
}
