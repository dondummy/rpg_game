import 'unit_1.dart';

class Character extends Unit {
  Character(super.name, super.maxHp, super.attack, super.defense);

  @override
  void attackTarget(Unit target) {
    int damage = attack - target.defense;
    if (damage < 0) damage = 0;
    target.currentHp -= damage;
    print('$name이(가) ${target.name}에게 $damage의 데미지를 입혔습니다.');
  }

  void defend(int incomingAttack) {
    currentHp += incomingAttack;
    if (currentHp > maxHp) currentHp = maxHp;

    print('$name이(가) 방어 태세를 취하여 $incomingAttack만큼 체력을 얻었습니다!');
  }

  @override
  void showStatus() {
    print('$name - 체력: $currentHp/$maxHp, 공격력: $attack, 방어력: $defense');
  }
}
