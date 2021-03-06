import "package:flutter/material.dart";
import 'package:museu_vivo/app/modules/minigames/memory-game/pages/memory_game_dashboard/memory_game_dashboard_module.dart';
import 'package:museu_vivo/app/modules/shared/components/custom_appbar.dart';

class MiniGames extends StatefulWidget {
  @override
  _MiniGamesState createState() => _MiniGamesState();
}

class _MiniGamesState extends State<MiniGames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MemoryGameDashboardModule(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/leratos/jogo_da_memoria.jpg",
                          height: 150,
                          width: 150,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Jogo da Memória",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/leratos/jogo_da_vida.jpg",
                          height: 150,
                          width: 150,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Jogo da Vida",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/leratos/jogo_1.jpg",
                          height: 150,
                          width: 150,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Jogo xxxxx",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: Image.asset(
                              "assets/leratos/jogo_2.jpg",
                              height: 150,
                              width: 150,
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Jogo xxxx",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
