abstract class Unit {
  String name;
  int maxHp;
  int currentHp;
  int attack;
  int defense;

  Unit(this.name, this.maxHp, this.attack, this.defense) : currentHp = maxHp;

  bool isDead() => currentHp <= 0;

  void attackTarget(Unit target);
  void showStatus();
}
