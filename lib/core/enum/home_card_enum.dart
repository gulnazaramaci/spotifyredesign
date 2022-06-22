enum HomeCardTypeEnum { MoodBooster, DailyLift, Toxic, Melody }

extension HomeCardTypeEnumExtension on HomeCardTypeEnum {
  String get rawValue {
    switch (this) {
      case HomeCardTypeEnum.MoodBooster:
        return '0';

      case HomeCardTypeEnum.DailyLift:
        return '1';

      case HomeCardTypeEnum.Toxic:
        return '2';

      case HomeCardTypeEnum.Melody:
        return '3';
      default:
        throw Exception('Not found path');
    }
  }
}
