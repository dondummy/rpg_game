import 'dart:math';
import 'unit_1.dart';

class Monster extends Unit {
  Monster(String name, int maxHp, int attack) : super(name, maxHp, attack, 0);

  @override
  void attackTarget(Unit target) {
    int randomAttack = Random().nextInt(attack) + 1;
    int damage = randomAttack - target.defense;
    if (damage < 0) damage = 0;
    target.currentHp -= damage;

    print('$name이(가) ${target.name}에게 $damage의 데미지를 입혔습니다.');
  }

  @override
  void showStatus() {
    print('$name - 체력: $currentHp/$maxHp, 공격력: $attack');
  }
}
