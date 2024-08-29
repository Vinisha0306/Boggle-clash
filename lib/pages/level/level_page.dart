import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

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
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/game', arguments: index);
              },
              child: Container(
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/level_button.png',
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          Hero(
            tag: 'start',
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Image(
                image: AssetImage(
                  'assets/images/back_arrow.png',
                ),
                width: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
