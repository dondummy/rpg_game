import 'dart:io';
import 'package:rpg_game/game_5.dart';
import 'package:rpg_game/loader_4.dart';

void main() {
  String? name;

  while (true) {
    stdout.write('캐릭터의 이름을 입력하세요:');
    name = stdin.readLineSync();

    if (name != null && RegExp(r'^[a-zA-Z가-힣]+$').hasMatch(name)) {
      break;
    }

    print('이름이 올바르지 않습니다. \n*한글/영문만 허용되니 다시 입력해 주세요 \n*공백은 허용되지 않습니다');
  }

  final character = loadCharacter(name);
  final monsters = loadMonsters();
  Game(character, monsters).startGame();
}
