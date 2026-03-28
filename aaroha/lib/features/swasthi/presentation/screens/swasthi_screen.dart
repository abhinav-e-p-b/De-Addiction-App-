import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';

class SwasthiScreen extends StatefulWidget {
  const SwasthiScreen({super.key});

  @override
  State<SwasthiScreen> createState() => _SwasthiScreenState();
}

class _SwasthiScreenState extends State<SwasthiScreen> {
  final _controller = TextEditingController();
  final _scrollCtrl = ScrollController();
  final List<_ChatMessage> _messages = [
    const _ChatMessage(
      text:
          'Namaste 🙏 I\'m Swasthi, your Aaroha companion. This is a safe, private space — no judgement, just support. What\'s on your mind today?',
      isAI: true,
      time: '10:00 AM',
    ),
    const _ChatMessage(
      text:
          'I\'ve been feeling overwhelmed with cravings lately. It\'s hard to focus on anything else.',
      isAI: false,
      time: '10:02 AM',
    ),
    const _ChatMessage(
      text:
          'I hear you. Cravings are like waves — they peak and pass. You\'ve made it 12 days. That\'s real strength. Would you like to try a quick grounding exercise, or talk more about what\'s triggering this?',
      isAI: true,
      time: '10:03 AM',
    ),
  ];

  int? _selectedMood;

  static const _moods = [
    ('😰', 'Anxious'),
    ('😔', 'Low'),
    ('😐', 'Okay'),
    ('🙂', 'Good'),
    ('😊', 'Great'),
  ];

  static const _suggestions = [
    'Try grounding',
    'Talk more',
    'Breathwork',
    'Craving journal',
  ];

  void _sendMessage([String? text]) {
    final msg = text ?? _controller.text.trim();
    if (msg.isEmpty) return;
    HapticFeedback.selectionClick();
    setState(() {
      _messages.add(_ChatMessage(
        text: msg,
        isAI: false,
        time: _now(),
      ));
      _controller.clear();
    });
    // Simulate AI response
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() {
        _messages.add(_ChatMessage(
          text: _aiReply(msg),
          isAI: true,
          time: _now(),
        ));
      });
      Future.delayed(100.ms, () {
        _scrollCtrl.animateTo(
          _scrollCtrl.position.maxScrollExtent,
          duration: 300.ms,
          curve: Curves.easeOut,
        );
      });
    });
  }

  String _aiReply(String input) {
    final lower = input.toLowerCase();
    if (lower.contains('ground')) {
      return 'Let\'s try the 5-4-3-2-1 technique. Name 5 things you can see right now. Take your time. 🌿';
    }
    if (lower.contains('breath')) {
      return 'Let\'s breathe together. Inhale for 4 counts... hold for 7... exhale for 8. This activates your rest response. Ready?';
    }
    if (lower.contains('craving')) {
      return 'Cravings typically peak within 15–20 minutes then fade. Can you wait just 5 minutes? You\'ve done it before. 💚';
    }
    return 'Thank you for sharing that with me. You\'re doing something brave just by being here. What would feel most helpful right now?';
  }

  String _now() {
    final t = DateTime.now();
    final h = t.hour > 12 ? t.hour - 12 : t.hour;
    final m = t.minute.toString().padLeft(2, '0');
    final suffix = t.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $suffix';
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AarohaColors.background,
      body: Column(
        children: [
          // ── Privacy banner ──────────────────────────────
          _PrivacyBanner(),

          // ── Chat messages ───────────────────────────────
          Expanded(
            child: ListView.separated(
              controller: _scrollCtrl,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              itemCount: _messages.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (_, i) {
                final msg = _messages[i];
                return _ChatBubble(message: msg)
                    .animate()
                    .fadeIn(duration: 300.ms)
                    .slideY(begin: 0.05, end: 0, duration: 300.ms);
              },
            ),
          ),

          // ── Suggestion chips ────────────────────────────
          _SuggestionChips(
            chips: _suggestions,
            onTap: _sendMessage,
          ),

          // ── Mood check-in ───────────────────────────────
          _MoodStrip(
            moods: _moods,
            selected: _selectedMood,
            onSelect: (i) {
              HapticFeedback.selectionClick();
              setState(() => _selectedMood = i);
              _sendMessage('Feeling ${_moods[i].$2.toLowerCase()} ${_moods[i].$1}');
            },
          ),

          // ── Input bar ───────────────────────────────────
          _InputBar(
            controller: _controller,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}

// ── Privacy Banner ─────────────────────────────────────────────
class _PrivacyBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AarohaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lock_outline_rounded,
              size: 12, color: AarohaColors.outline),
          const SizedBox(width: 6),
          Text(
            'Anonymous · Private · No data stored',
            style: AarohaTextStyles.overline.copyWith(
              color: AarohaColors.outline,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Chat Bubble ────────────────────────────────────────────────
class _ChatBubble extends StatelessWidget {
  final _ChatMessage message;
  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isAI = message.isAI;
    return Row(
      mainAxisAlignment:
          isAI ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isAI) ...[
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              color: AarohaColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.smart_toy_rounded,
              color: AarohaColors.onPrimary,
              size: 18,
            ),
          ),
          const SizedBox(width: 10),
        ],
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isAI
                  ? AarohaColors.mintSurface
                  : AarohaColors.primaryContainer,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isAI ? 4 : 20),
                topRight: Radius.circular(isAI ? 20 : 4),
                bottomLeft: const Radius.circular(20),
                bottomRight: const Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: isAI
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Text(
                  message.text,
                  style: AarohaTextStyles.bodyMd.copyWith(
                    color: isAI
                        ? AarohaColors.onSurface
                        : AarohaColors.onPrimary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message.time,
                  style: AarohaTextStyles.bodySm.copyWith(
                    fontSize: 10,
                    color: isAI
                        ? AarohaColors.outline
                        : AarohaColors.onPrimary.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (!isAI) ...[
          const SizedBox(width: 10),
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              color: AarohaColors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: AarohaColors.primary,
              size: 18,
            ),
          ),
        ],
      ],
    );
  }
}

// ── Suggestion Chips ───────────────────────────────────────────
class _SuggestionChips extends StatelessWidget {
  final List<String> chips;
  final ValueChanged<String> onTap;
  const _SuggestionChips({required this.chips, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: chips.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) => GestureDetector(
          onTap: () => onTap(chips[i]),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AarohaColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(AarohaConstants.radiusFull),
              border: Border.all(
                color: AarohaColors.outlineVariant,
                width: 1,
              ),
            ),
            child: Text(
              chips[i],
              style: AarohaTextStyles.labelMd.copyWith(
                color: AarohaColors.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Mood Strip ────────────────────────────────────────────────
class _MoodStrip extends StatelessWidget {
  final List<(String, String)> moods;
  final int? selected;
  final ValueChanged<int> onSelect;
  const _MoodStrip({
    required this.moods,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AarohaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AarohaConstants.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HOW ARE YOU FEELING?',
            style: AarohaTextStyles.overline.copyWith(
              color: AarohaColors.outline,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: moods.asMap().entries.map((entry) {
              final i = entry.key;
              final m = entry.value;
              final isSelected = selected == i;
              return GestureDetector(
                onTap: () => onSelect(i),
                child: AnimatedContainer(
                  duration: 200.ms,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AarohaColors.surfaceContainerHighest
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(m.$1, style: const TextStyle(fontSize: 24)),
                      const SizedBox(height: 2),
                      Text(
                        m.$2,
                        style: AarohaTextStyles.bodySm.copyWith(
                          color: isSelected
                              ? AarohaColors.primary
                              : AarohaColors.outline,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// ── Input Bar ─────────────────────────────────────────────────
class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  const _InputBar({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16, 8, 16, MediaQuery.of(context).padding.bottom + 8,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: AarohaColors.surfaceContainerHighest.withOpacity(0.9),
          borderRadius: BorderRadius.circular(AarohaConstants.radiusXl),
        ),
        child: Row(
          children: [
            const SizedBox(width: 4),
            Expanded(
              child: TextField(
                controller: controller,
                style: AarohaTextStyles.bodyMd,
                decoration: InputDecoration(
                  hintText: 'Share what\'s on your mind…',
                  hintStyle: AarohaTextStyles.bodyMd.copyWith(
                    color: AarohaColors.outline,
                  ),
                  border: InputBorder.none,
                  filled: false,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 10,
                  ),
                ),
                onSubmitted: (_) => onSend(),
                textInputAction: TextInputAction.send,
              ),
            ),
            GestureDetector(
              onTap: onSend,
              child: Container(
                width: 44, height: 44,
                decoration: BoxDecoration(
                  color: AarohaColors.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.send_rounded,
                  color: AarohaColors.onPrimary,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isAI;
  final String time;
  const _ChatMessage({
    required this.text,
    required this.isAI,
    required this.time,
  });
}
