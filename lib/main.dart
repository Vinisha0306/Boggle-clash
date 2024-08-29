import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spelling_app/pages/game/dragController.dart';
import 'package:spelling_app/pages/game/game_page.dart';
import 'package:spelling_app/pages/home/home_page.dart';
import 'package:spelling_app/pages/level/level_page.dart';
import 'package:spelling_app/pages/splash/splash_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => DragController(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/level': (context) => LevelPage(),
        '/game': (context) => GamePage(),
      },
    );
  }
}
