import 'package:flutter/material.dart';
import 'package:waddle_games/utils/game_provider.dart';

import 'game_board.dart';

class GameKeyBoard extends StatefulWidget {
  GameKeyBoard(this.game, {Key? key}) : super(key: key);
  WordleGame game;

  @override
  State<GameKeyBoard> createState() => _GameKeyBoardState();
}

class _GameKeyBoardState extends State<GameKeyBoard> {
  List row1 = "QWERTYUIOP".split("");
  List row2 = "ASDFGHJKL".split("");
  List row3 = ["DEL", "Z", "X", "C", "V", "B", "N", "M", "CHECK"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          WordleGame.game_message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20.0),
        GameBoard(widget.game),
        const SizedBox(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1.map(
            (e) {
              return InkWell(
                onTap: () {
                  if (widget.game.letterId < 5) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterId, Letter(e, 0));
                      widget.game.letterId++;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey.shade300),
                  child: Text(
                    "$e",
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row2.map(
            (e) {
              return InkWell(
                onTap: () {
                  if (widget.game.letterId < 5) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterId, Letter(e, 0));
                      widget.game.letterId++;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey.shade300),
                  child: Text(
                    "$e",
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ).toList(),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row3.map(
            (e) {
              return InkWell(
                onTap: () {
                  if (e == "DEL") {
                    if (widget.game.letterId > 0) {
                      setState(() {
                        widget.game
                            .insertWord(widget.game.letterId, Letter("", 0));
                        widget.game.letterId--;
                      });
                    }
                  } else if (e == "SUBMIT") {
                    if (widget.game.letterId >= 5) {
                      String guess = widget.game.worldleBoard[widget.game.rowId]
                          .map((e) => e.letter)
                          .join();
                      if (widget.game.checkWordExist(guess)) {
                        if (guess == WordleGame.game_guess) {
                          setState(() {
                            WordleGame.game_message = "Congratulations";
                            for (var element in widget
                                .game.worldleBoard[widget.game.rowId]) {
                              element.code = 1;
                            }
                          });
                        } else {
                          int listLength = guess.length;
                          for (int i = 0; i < listLength; i++) {
                            String char = guess[i];
                            if (WordleGame.game_guess.contains(char)) {
                              if (WordleGame.game_guess[i] == char) {
                                setState(() {
                                  widget.game.worldleBoard[widget.game.rowId][i]
                                      .code = 1;
                                });
                              } else {
                                setState(() {
                                  widget.game.worldleBoard[widget.game.rowId][i]
                                      .code = 2;
                                });
                              }
                            }
                          }
                          widget.game.rowId++;
                          widget.game.letterId = 0;
                        }
                      } else {
                        WordleGame.game_message =
                            "The Word Does not Exit. Try Again";
                      }
                    }
                  } else {
                    if (widget.game.letterId < 5) {
                      setState(() {
                        widget.game
                            .insertWord(widget.game.letterId - 1, Letter(e, 0));
                        widget.game.letterId++;
                      });
                    }
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey.shade300),
                  child: Text(
                    "$e",
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
