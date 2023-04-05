import 'dart:math';

class WordleGame {
  int rowId = 0;
  int letterId = 0;

  static String game_message = "";
  static String game_guess = "";
  static List<String> word_list = [
    "WORLD",
    "FIGHT",
    "BRAIN",
    "PLANE",
    "EARTH",
    "ROBOT",
    "WEEKS",
    "ARRAY",
    "BOOKS",
    "SEVER",
    "LOVED",
    "PLAIN",
    "CHECK",
    "HEART",
    "MATCH",
    "MARCH",
    "APRIL",
    "DRONE",
    "CAMEL",
    "WORDS",
    "LOVER"
  ];
  static bool gameOver = false;

  static List<Letter> worldeRow = List.generate(5, (index) => Letter("", 0));

  List<List<Letter>> worldleBoard =
      List.generate(5, (index) => List.generate(5, ((index) => Letter("", 0))));

  static void initGame() {
    final random = Random();
    int index = random.nextInt(word_list.length);
    game_guess = word_list[index];
  }

  void insertWord(index, word) {
    worldleBoard[rowId][index] = word;
  }

  bool checkWordExist(String word) {
    return word_list.contains(word);
  }
}

class Letter {
  String? letter;
  int code = 0;
  Letter(this.letter, this.code);
}
