import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/streak_model.dart';

// ── Streak notifier ───────────────────────────────────────────
class StreakNotifier extends Notifier<StreakModel> {
  @override
  StreakModel build() {
    // Default / initial state — replace with Hive persistence
    return StreakModel(
      daysSober: 12,
      startDate: DateTime.now().subtract(const Duration(days: 12)),
      bestStreak: 12,
      moneySaved: 2400,
    );
  }

  void incrementDay() {
    state = StreakModel(
      daysSober: state.daysSober + 1,
      startDate: state.startDate,
      bestStreak: state.daysSober + 1 > state.bestStreak
          ? state.daysSober + 1
          : state.bestStreak,
      moneySaved: state.moneySaved + 200,
    );
  }

  void restart() {
    state = StreakModel(
      daysSober: 1,
      startDate: DateTime.now(),
      bestStreak: state.bestStreak,
      moneySaved: 200,
    );
  }
}

final streakProvider = NotifierProvider<StreakNotifier, StreakModel>(
  StreakNotifier.new,
);

// ── Daily Goals notifier ──────────────────────────────────────
class GoalsNotifier extends Notifier<List<DailyGoal>> {
  @override
  List<DailyGoal> build() {
    final today = DateTime.now();
    return [
      DailyGoal(
        id: 'morning_checkin',
        title: 'Morning check-in',
        subtitle: 'Completed at 7:30 AM',
        isCompleted: true,
        date: today,
      ),
      DailyGoal(
        id: 'breathwork',
        title: '10 min breathwork',
        subtitle: 'Completed at 8:00 AM',
        isCompleted: true,
        date: today,
      ),
      DailyGoal(
        id: 'swasthi_chat',
        title: 'Talk to Swasthi',
        subtitle: 'AI companion check-in',
        isCompleted: false,
        date: today,
      ),
      DailyGoal(
        id: 'evening_meditation',
        title: 'Evening meditation',
        subtitle: 'Shanti Space · 10 min',
        isCompleted: false,
        date: today,
      ),
    ];
  }

  void toggle(String id) {
    state = [
      for (final g in state)
        if (g.id == id)
          DailyGoal(
            id: g.id,
            title: g.title,
            subtitle: g.subtitle,
            isCompleted: !g.isCompleted,
            date: g.date,
          )
        else
          g,
    ];
  }
}

final goalsProvider = NotifierProvider<GoalsNotifier, List<DailyGoal>>(
  GoalsNotifier.new,
);
