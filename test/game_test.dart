import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_alan_kapma/oyun_alan_kapma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(alanConfig.title.length, 33);
    expect(alanConfig.tagline.length, 33);
    for (final s in alanConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(alanRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: alanId, optionalMechanics: alanRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(alanRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
