import 'dart:io';
import 'dart:math';
import 'character_2.dart';
import 'monster_3.dart';

class Game {
  final Character player;
  final List<Monster> monsters;
  int defeatedCount = 0;

  Game(this.player, this.monsters);

  void startGame() {
    print('\n■■■■■■■■■■■■■■■■■■■■\n게임을 시작합니다\n■■■■■■■■■■■■■■■■■■■■\n');

    while (!player.isDead() && monsters.isNotEmpty) {
      final monster = _getRandomMonster();
      print('\n👇👇👇👇새로운 몬스터 등장!👇👇👇👇');
      monster.showStatus();

      while (!player.isDead() && !monster.isDead()) {
        _playerTurn(monster);
        if (!monster.isDead()) {
          _monsterTurn(monster);
        }
      }

      if (monster.isDead()) {
        print('${monster.name}을(를) 처치했습니다!');
        monsters.remove(monster);
        defeatedCount++;
      }

      if (player.isDead()) {
        print('${player.name}이(가) 쓰러졌습니다...');
        break;
      }

      if (monsters.isNotEmpty && !_askContinue()) break;
    }

    _showResult();
  }

  void _playerTurn(Monster monster) {
    print('\n${player.name}의 턴');
    player.showStatus();
    stdout.write('행동을 선택해 주세요 (1: 공격, 2: 방어):');
    String? input = stdin.readLineSync();

    if (input == '1') {
      player.attackTarget(monster);
    } else if (input == '2') {
      player.defend(monster.attack);
    } else {
      print('1번과 2번 중 입력해 주세요\n이번 공격은 쉽니다ㅎ');
    }
  }

  void _monsterTurn(Monster monster) {
    print('\n${monster.name}의 턴');
    monster.attackTarget(player);
  }

  Monster _getRandomMonster() {
    return monsters[Random().nextInt(monsters.length)];
  }

  bool _askContinue() {
    while (true) {
      stdout.write('계속 싸우시겠습니까? (y/n): ');
      String? input = stdin.readLineSync()?.trim().toLowerCase();

      if (input == 'y') return true;
      if (input == 'n') return false;

      print('올바른 값을 입력해주세요. (y또는 n을 입력해 주세요)');
    }
  }

  void _showResult() {
    print('\n게임 종료! 총 처치한 몬스터의 수: $defeatedCount');

    while (true) {
      stdout.write('결과를 저장하시겠습니까? (y/n): ');
      String? input = stdin.readLineSync()?.trim().toLowerCase();

      if (input == 'y') {
        final file = File('assets/result.txt');
        final result = player.isDead() ? '패배' : '승리';
        file.writeAsStringSync(
          '이름 : ${player.name}, 남은 체력 : ${player.currentHp}, 결과 : $result, 처치한 몬스터 수 : $defeatedCount',
        );
        print('결과가 저장되었습니다.');
        break;
      } else if (input == 'n') {
        print('게임을 종료합니다.');
        break;
      } else {
        print('올바른 값을 입력해주세요. (y또는 n을 입력해 주세요)');
      }
    }
  }
}
