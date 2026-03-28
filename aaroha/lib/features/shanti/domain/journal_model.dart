import 'package:flutter_riverpod/flutter_riverpod.dart';

class JournalEntry {
  final String id;
  final String text;
  final DateTime createdAt;
  final String type; // 'craving' | 'reflection' | 'gratitude'

  const JournalEntry({
    required this.id,
    required this.text,
    required this.createdAt,
    this.type = 'craving',
  });
}

class JournalNotifier extends Notifier<List<JournalEntry>> {
  @override
  List<JournalEntry> build() => [];

  void add(String text, {String type = 'craving'}) {
    if (text.trim().isEmpty) return;
    state = [
      ...state,
      JournalEntry(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: text.trim(),
        createdAt: DateTime.now(),
        type: type,
      ),
    ];
  }

  void delete(String id) {
    state = state.where((e) => e.id != id).toList();
  }

  void clear() => state = [];
}

final journalProvider = NotifierProvider<JournalNotifier, List<JournalEntry>>(
  JournalNotifier.new,
);
