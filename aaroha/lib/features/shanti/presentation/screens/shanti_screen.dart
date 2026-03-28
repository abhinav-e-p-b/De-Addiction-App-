import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/shared_widgets.dart';

class ShantiScreen extends StatefulWidget {
  const ShantiScreen({super.key});

  @override
  State<ShantiScreen> createState() => _ShantiScreenState();
}

class _ShantiScreenState extends State<ShantiScreen>
    with TickerProviderStateMixin {
  // ── Breathwork state ──────────────────────────────────────
  bool _isBreathing = false;
  String _breatheLabel = 'Breathe In…';
  late AnimationController _breathCtrl;
  late Animation<double> _breathScale;
  Timer? _breathTimer;
  int _breathPhase = 0; // 0=in,1=hold,2=out,3=hold

  // ── Soundscape ────────────────────────────────────────────
  final Set<int> _activeSounds = {};

  // ── Journal ───────────────────────────────────────────────
  final _journalCtrl = TextEditingController();

  static const _soundscapes = [
    ('Rain',   Icons.water_drop_rounded),
    ('Forest', Icons.forest_rounded),
    ('Ocean',  Icons.waves_rounded),
    ('Night',  Icons.nights_stay_rounded),
  ];

  @override
  void initState() {
    super.initState();
    _breathCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _breathScale = Tween<double>(begin: 0.85, end: 1.15).animate(
      CurvedAnimation(parent: _breathCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _breathCtrl.dispose();
    _breathTimer?.cancel();
    _journalCtrl.dispose();
    super.dispose();
  }

  void _toggleBreath() {
    HapticFeedback.mediumImpact();
    setState(() => _isBreathing = !_isBreathing);

    if (_isBreathing) {
      _runBreathCycle();
    } else {
      _breathCtrl.stop();
      _breathTimer?.cancel();
      setState(() => _breatheLabel = 'Breathe In…');
    }
  }

  void _runBreathCycle() {
    // 4-7-8 pattern
    final phases = [
      (4, 'Breathe In…'),
      (7, 'Hold…'),
      (8, 'Breathe Out…'),
      (2, 'Hold…'),
    ];

    _breathPhase = 0;
    _nextPhase(phases);
  }

  void _nextPhase(List<(int, String)> phases) {
    if (!_isBreathing) return;
    final (secs, label) = phases[_breathPhase % phases.length];
    setState(() => _breatheLabel = label);

    if (_breathPhase % phases.length == 0) {
      _breathCtrl.forward(from: 0);
    } else if (_breathPhase % phases.length == 2) {
      _breathCtrl.reverse(from: 1);
    }

    _breathTimer = Timer(Duration(seconds: secs), () {
      _breathPhase++;
      if (_isBreathing) _nextPhase(phases);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AarohaColors.background,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
        children: [
          // ── Header ────────────────────────────────────────
          Text('Shanti Space', style: AarohaTextStyles.headlineMd)
              .animate().fadeIn(),
          Text(
            'Your sanctuary for calm and clarity.',
            style: AarohaTextStyles.bodyMd.copyWith(
              color: AarohaColors.onSurfaceVariant,
            ),
          ).animate(delay: 50.ms).fadeIn(),

          const SizedBox(height: 28),

          // ── Breathwork orb ────────────────────────────────
          _BreathworkOrb(
            scale: _breathScale,
            label: _breatheLabel,
            isActive: _isBreathing,
            onToggle: _toggleBreath,
          ).animate(delay: 100.ms).fadeIn().scale(begin: const Offset(0.9, 0.9)),

          const SizedBox(height: 32),

          // ── Calm Tools ────────────────────────────────────
          const SectionHeader(title: 'Calm Tools'),
          const SizedBox(height: 12),
          const _CalmToolsGrid().animate(delay: 200.ms).fadeIn(),

          const SizedBox(height: 24),

          // ── Soundscapes ───────────────────────────────────
          _SoundscapeCard(
            soundscapes: _soundscapes,
            active: _activeSounds,
            onToggle: (i) {
              HapticFeedback.selectionClick();
              setState(() {
                if (_activeSounds.contains(i)) {
                  _activeSounds.remove(i);
                } else {
                  _activeSounds.add(i);
                }
              });
            },
          ).animate(delay: 280.ms).fadeIn(),

          const SizedBox(height: 24),

          // ── Craving Journal ───────────────────────────────
          _CravingJournal(controller: _journalCtrl)
              .animate(delay: 340.ms)
              .fadeIn(),

          const SizedBox(height: 20),

          // ── Body Scan CTA ─────────────────────────────────
          const GradientButton(
            label: 'Start Body Scan Guide',
            icon: Icons.accessibility_new_rounded,
          ).animate(delay: 400.ms).fadeIn(),
        ],
      ),
    );
  }
}

// ── Breathwork Orb ────────────────────────────────────────────
class _BreathworkOrb extends StatelessWidget {
  final Animation<double> scale;
  final String label;
  final bool isActive;
  final VoidCallback onToggle;

  const _BreathworkOrb({
    required this.scale,
    required this.label,
    required this.isActive,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 220,
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Pulse rings
              ...List.generate(3, (i) => AnimatedBuilder(
                animation: scale,
                builder: (_, __) => Container(
                  width: 140.0 + (i * 28) + (scale.value - 0.85) * 60,
                  height: 140.0 + (i * 28) + (scale.value - 0.85) * 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AarohaColors.primaryContainer.withOpacity(
                      0.08 - i * 0.02,
                    ),
                  ),
                ),
              )).reversed,
              // Main orb
              AnimatedBuilder(
                animation: scale,
                builder: (_, child) => Transform.scale(
                  scale: scale.value,
                  child: child,
                ),
                child: Container(
                  width: 108,
                  height: 108,
                  decoration: BoxDecoration(
                    gradient: AarohaColors.heroGradientAngled,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AarohaColors.primary.withOpacity(0.3),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.air_rounded,
                    color: AarohaColors.onPrimary,
                    size: 44,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: AarohaTextStyles.titleMd.copyWith(
            color: AarohaColors.onSurface,
          ),
        ),
        Text(
          '4-7-8 breathing technique',
          style: AarohaTextStyles.bodySm.copyWith(
            color: AarohaColors.outline,
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: onToggle,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            decoration: BoxDecoration(
              gradient: isActive ? null : AarohaColors.heroGradientAngled,
              color: isActive ? AarohaColors.surfaceContainerHigh : null,
              borderRadius: BorderRadius.circular(AarohaConstants.radiusFull),
              boxShadow: isActive ? null : [
                BoxShadow(
                  color: AarohaColors.primary.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              isActive ? 'Stop' : 'Start Breathing',
              style: AarohaTextStyles.labelLg.copyWith(
                color: isActive
                    ? AarohaColors.onSurface
                    : AarohaColors.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Calm Tools Grid ───────────────────────────────────────────
class _CalmToolsGrid extends StatelessWidget {
  const _CalmToolsGrid();

  @override
  Widget build(BuildContext context) {
    final tools = [
      (
        'Box Breathing',
        '4-4-4-4 cycle',
        Icons.crop_square_rounded,
        AarohaColors.mintSurface,
        AarohaColors.primaryContainer,
      ),
      (
        'Body Scan',
        '10 min guided',
        Icons.accessibility_new_rounded,
        AarohaColors.secondaryContainer.withOpacity(0.3),
        AarohaColors.secondary,
      ),
    ];

    return Row(
      children: tools.map((t) => Expanded(
        child: Container(
          margin: EdgeInsets.only(
            right: t == tools.last ? 0 : 8,
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: t.$4,
            borderRadius: BorderRadius.circular(AarohaConstants.radiusXl),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(t.$3, color: t.$5, size: 28),
              const SizedBox(height: 12),
              Text(
                t.$1,
                style: AarohaTextStyles.labelLg.copyWith(
                  color: t.$5,
                ),
              ),
              Text(
                t.$2,
                style: AarohaTextStyles.bodySm.copyWith(
                  color: t.$5.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      )).toList(),
    );
  }
}

// ── Soundscape Card ───────────────────────────────────────────
class _SoundscapeCard extends StatelessWidget {
  final List<(String, IconData)> soundscapes;
  final Set<int> active;
  final ValueChanged<int> onToggle;

  const _SoundscapeCard({
    required this.soundscapes,
    required this.active,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AarohaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AarohaConstants.radiusXl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.music_note_rounded,
                color: AarohaColors.primary,
                size: 22,
              ),
              const SizedBox(width: 10),
              Text(
                'Soothing Soundscapes',
                style: AarohaTextStyles.titleMd.copyWith(
                  color: AarohaColors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: soundscapes.asMap().entries.map((entry) {
              final i = entry.key;
              final s = entry.value;
              final isActive = active.contains(i);
              return GestureDetector(
                onTap: () => onToggle(i),
                child: AnimatedContainer(
                  duration: 200.ms,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AarohaColors.primary
                        : AarohaColors.surfaceContainerHigh,
                    borderRadius:
                        BorderRadius.circular(AarohaConstants.radiusFull),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        s.$2,
                        size: 16,
                        color: isActive
                            ? AarohaColors.onPrimary
                            : AarohaColors.onSurfaceVariant,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        s.$1,
                        style: AarohaTextStyles.labelMd.copyWith(
                          color: isActive
                              ? AarohaColors.onPrimary
                              : AarohaColors.onSurfaceVariant,
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

// ── Craving Journal ───────────────────────────────────────────
class _CravingJournal extends StatelessWidget {
  final TextEditingController controller;
  const _CravingJournal({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AarohaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AarohaConstants.radiusXl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.edit_note_rounded,
                color: AarohaColors.primary,
                size: 22,
              ),
              const SizedBox(width: 10),
              Text(
                'Craving Journal',
                style: AarohaTextStyles.titleMd.copyWith(
                  color: AarohaColors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            maxLines: 4,
            style: AarohaTextStyles.bodyMd.copyWith(
              color: AarohaColors.onSurface,
              height: 1.6,
            ),
            decoration: InputDecoration(
              hintText:
                  'What triggered this craving? Writing it down helps release its grip…',
              hintStyle: AarohaTextStyles.bodyMd.copyWith(
                color: AarohaColors.outline,
              ),
              filled: true,
              fillColor: AarohaColors.surfaceContainer,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Anonymous · not saved',
                style: AarohaTextStyles.bodySm.copyWith(
                  color: AarohaColors.outline,
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.clear();
                  HapticFeedback.mediumImpact();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AarohaColors.primary.withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular(AarohaConstants.radiusFull),
                  ),
                  child: Text(
                    'Release it',
                    style: AarohaTextStyles.labelMd.copyWith(
                      color: AarohaColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
