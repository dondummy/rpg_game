import 'dart:io';
import 'character_2.dart';
import 'monster_3.dart';

Character loadCharacter(String name) {
  final file = (name == '전설의용사한성용')
      ? File('assets/lucky.txt')
      : File('assets/characters.txt');

  final stats = file.readAsStringSync().trim().split(',');
  return Character(
    name,
    int.tryParse(stats[0]) ?? 0,
    int.tryParse(stats[1]) ?? 0,
    int.tryParse(stats[2]) ?? 0,
  );
}

List<Monster> loadMonsters() {
  final file = File('assets/monsters.txt');
  final lines = file.readAsLinesSync();

  return lines
      .map((line) {
        final parts = line.trim().split(',');
        return Monster(
          parts[0],
          int.tryParse(parts[1]) ?? 0,
          int.tryParse(parts[2]) ?? 0,
        );
      })
      .whereType<Monster>()
      .toList();
}
