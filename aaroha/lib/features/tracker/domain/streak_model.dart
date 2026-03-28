import 'package:hive/hive.dart';

part 'streak_model.g.dart';

@HiveType(typeId: 0)
class StreakModel extends HiveObject {
  @HiveField(0)
  int daysSober;

  @HiveField(1)
  DateTime startDate;

  @HiveField(2)
  int bestStreak;

  @HiveField(3)
  double moneySaved;

  StreakModel({
    required this.daysSober,
    required this.startDate,
    required this.bestStreak,
    this.moneySaved = 0.0,
  });

  int get hoursSober => daysSober * 24;

  double get moneySavedAuto => daysSober * 200.0; // ₹200/day default

  String get nextMilestoneLabel {
    const milestones = [1, 3, 7, 14, 21, 30, 60, 90, 180, 365];
    for (final m in milestones) {
      if (daysSober < m) {
        final diff = m - daysSober;
        return '$diff Day${diff == 1 ? '' : 's'} to ${_badgeName(m)}';
      }
    }
    return '$daysSober days — You are a beacon 🌟';
  }

  String _badgeName(int days) {
    return switch (days) {
      1   => 'First Step',
      3   => 'Bronze Seed',
      7   => 'Silver Root',
      14  => 'Gold Branch',
      21  => 'Platinum Leaf',
      30  => 'Sapphire Tree',
      60  => 'Emerald Forest',
      90  => 'Diamond Grove',
      180 => 'Crystal Mountain',
      365 => 'Golden Year ✨',
      _   => 'Next Milestone',
    };
  }
}

@HiveType(typeId: 1)
class DailyGoal extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String subtitle;

  @HiveField(3)
  bool isCompleted;

  @HiveField(4)
  DateTime date;

  DailyGoal({
    required this.id,
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    required this.date,
  });
}
