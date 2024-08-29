import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:spelling_app/pages/game/dragController.dart';

import '../../constant/list.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    int level = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/game_image.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 300,
            bottom: 200,
            child: Row(
              children: List.generate(
                levelOne[level]['spelling'].length,
                (index) => DragTarget(
                  onAcceptWithDetails: (details) {
                    print("can accept....");
                    Provider.of<DragController>(context, listen: false)
                        .boxAccept();
                    Future.delayed(Duration(seconds: 5), () {
                      Navigator.pop(context);
                    });
                  },
                  onWillAcceptWithDetails: (details) {
                    print(details.data);
                    return details.data == 'block';
                  },
                  builder: (context, _, __) => Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                          'assets/images/block.png',
                        ),
                        opacity: index == 0
                            ? Provider.of<DragController>(context).boxAccepted
                                ? 1
                                : 0.6
                            : 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      levelOne[level]['spelling'][index],
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: index == 0
                            ? Provider.of<DragController>(context).boxAccepted
                                ? Colors.black
                                : Colors.transparent
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 300,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.brown,
                  width: 7,
                ),
              ),
              child: Row(
                children: List.generate(
                  levelOne[level]['extraText'].length,
                  (index) => Draggable(
                    data: levelOne[level]['extraText'][index] ==
                            levelOne[level]['ans']
                        ? "block"
                        : "wrong block",
                    feedback: extraBlockWidget(index: index, level: level),
                    childWhenDragging: Container(),
                    child: extraBlockWidget(index: index, level: level),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget extraBlockWidget({required int index, required int level}) {
  return Container(
    width: 100,
    height: 100,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          'assets/images/block.png',
        ),
      ),
    ),
    alignment: Alignment.center,
    child: Text(
      levelOne[level]['extraText'][index],
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        decorationColor: Colors.black,
      ),
    ),
  );
}
