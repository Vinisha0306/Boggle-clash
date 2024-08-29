import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spelling_app/pages/level/level_page.dart';
import 'package:spelling_app/pages/level/utils/route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/home_image.jpg'),
                  fit: BoxFit.fitHeight),
            ),
          ),
          const Positioned(
            left: 250,
            bottom: 150,
            child: Image(
              image: AssetImage(
                'assets/images/app_icon.png',
              ),
              width: 400,
            ),
          ),
          Positioned(
            top: 250,
            left: MediaQuery.of(context).size.width / 2.2,
            child: Hero(
              tag: 'start',
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MyRoute(
                      builder: (context) => LevelPage(),
                    ),
                  );
                },
                child: const Image(
                  image: AssetImage(
                    'assets/images/play_button.png',
                  ),
                  width: 130,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
