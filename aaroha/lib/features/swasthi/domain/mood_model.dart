import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Mood { anxious, low, okay, good, great }

extension MoodExtension on Mood {
  String get emoji => switch (this) {
    Mood.anxious => '😰',
    Mood.low     => '😔',
    Mood.okay    => '😐',
    Mood.good    => '🙂',
    Mood.great   => '😊',
  };

  String get label => switch (this) {
    Mood.anxious => 'Anxious',
    Mood.low     => 'Low',
    Mood.okay    => 'Okay',
    Mood.good    => 'Good',
    Mood.great   => 'Great',
  };
}

class MoodEntry {
  final Mood mood;
  final DateTime timestamp;
  final String? note;

  const MoodEntry({
    required this.mood,
    required this.timestamp,
    this.note,
  });
}

class MoodNotifier extends Notifier<List<MoodEntry>> {
  @override
  List<MoodEntry> build() => [];

  void log(Mood mood, {String? note}) {
    state = [
      ...state,
      MoodEntry(mood: mood, timestamp: DateTime.now(), note: note),
    ];
  }
}

final moodProvider = NotifierProvider<MoodNotifier, List<MoodEntry>>(
  MoodNotifier.new,
);

final latestMoodProvider = Provider<MoodEntry?>((ref) {
  final moods = ref.watch(moodProvider);
  return moods.isEmpty ? null : moods.last;
});
