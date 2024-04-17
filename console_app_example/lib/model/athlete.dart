import './abstract_human.dart';

class Athlete extends Human {
  String mainSkill;
  String weight;

  Athlete(super.humanPower, this.mainSkill, this.weight);

  @override
  String toString() {
    return 'humanPower: ${super.humanPower}, mainSkill: $mainSkill';
  }
}

extension GetMainSkill on Athlete {
  getMainSkill() {
    return mainSkill;
  }
}

extension PlusOne on int {
  plusOne() {
    return this + 1;
  }
}
