import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/shared_widgets.dart';

class SangamScreen extends StatefulWidget {
  const SangamScreen({super.key});

  @override
  State<SangamScreen> createState() => _SangamScreenState();
}

class _SangamScreenState extends State<SangamScreen> {
  int _filterIndex = 0;
  final _filters = ['All', 'Hospitals', 'NGOs', 'Events', 'Rehab'];

  static const _centres = [
    _Centre(
      name: 'Thrissur Wellness Center',
      address: 'Civil Lane Rd, Ayyanthole, Thrissur',
      phone: 'tel:04872334455',
      status: 'Open now',
      isOpen: true,
      type: 'Hospital',
    ),
    _Centre(
      name: 'Asha Recovery Point',
      address: 'Shornur Rd, Patturaikkal, Thrissur',
      phone: 'tel:04872234411',
      status: 'Closed',
      isOpen: false,
      type: 'NGO',
    ),
    _Centre(
      name: 'Palakkad Care Hub',
      address: 'Fort Maidan, Palakkad, Kerala',
      phone: 'tel:04912525252',
      status: 'Open now',
      isOpen: true,
      type: 'Rehab',
    ),
    _Centre(
      name: 'NIMHANS Outreach — Kochi',
      address: 'Ernakulam District, Kochi, Kerala',
      phone: 'tel:04842351040',
      status: 'Open now',
      isOpen: true,
      type: 'Hospital',
    ),
  ];

  static const _events = [
    _Event(
      title: 'Breathwork 101 — Beginners',
      date: 'Mar 29',
      time: '6:00 PM',
      mode: 'Online · Free',
      day: '29',
      month: 'Mar',
    ),
    _Event(
      title: 'AA Group Meeting — Thrissur',
      date: 'Apr 5',
      time: '10:00 AM',
      mode: 'In-person',
      day: '5',
      month: 'Apr',
    ),
    _Event(
      title: 'Recovery Story Circle',
      date: 'Apr 12',
      time: '7:00 PM',
      mode: 'Online · Free',
      day: '12',
      month: 'Apr',
    ),
  ];

  Future<void> _call(String tel) async {
    final uri = Uri.parse(tel);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AarohaColors.background,
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
            children: [
              // ── Header ──────────────────────────────────────
              Text('Sangam + Sahara', style: AarohaTextStyles.headlineMd)
                  .animate().fadeIn(),
              Text(
                'Events, resources & NADA centres near you.',
                style: AarohaTextStyles.bodyMd.copyWith(
                  color: AarohaColors.onSurfaceVariant,
                ),
              ).animate(delay: 50.ms).fadeIn(),

              const SizedBox(height: 14),

              // ── Filter chips ─────────────────────────────────
              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (_, i) => AarohaFilterChip(
                    label: _filters[i],
                    isSelected: _filterIndex == i,
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() => _filterIndex = i);
                    },
                  ),
                ),
              ).animate(delay: 80.ms).fadeIn(),

              const SizedBox(height: 20),

              // ── Map placeholder ───────────────────────────────
              const _MapPlaceholder()
                  .animate(delay: 120.ms)
                  .fadeIn()
                  .scale(begin: const Offset(0.97, 0.97)),

              const SizedBox(height: 24),

              // ── Nearby Centres ────────────────────────────────
              const SectionHeader(
                title: 'Centres near you',
                actionLabel: 'View all',
              ).animate(delay: 180.ms).fadeIn(),
              const SizedBox(height: 12),

              ..._centres.asMap().entries.map((entry) {
                final i = entry.key;
                final c = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _CentreCard(
                    centre: c,
                    onCall: () => _call(c.phone),
                  )
                      .animate(
                        delay: Duration(milliseconds: 200 + i * 60),
                      )
                      .fadeIn()
                      .slideX(begin: 0.03),
                );
              }),

              const SizedBox(height: 24),

              // ── Upcoming Events ───────────────────────────────
              const SectionHeader(title: 'Upcoming Events')
                  .animate(delay: 380.ms)
                  .fadeIn(),
              const SizedBox(height: 12),

              ..._events.asMap().entries.map((entry) {
                final i = entry.key;
                final e = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _EventTile(event: e)
                      .animate(
                        delay: Duration(milliseconds: 400 + i * 60),
                      )
                      .fadeIn(),
                );
              }),

              const SizedBox(height: 24),

              // ── Helpline One-Tap ──────────────────────────────
              _HelplineBanner(onCall: _call)
                  .animate(delay: 500.ms)
                  .fadeIn(),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Map Placeholder ───────────────────────────────────────────
class _MapPlaceholder extends StatelessWidget {
  const _MapPlaceholder();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AarohaConstants.radiusXl),
      child: Container(
        height: 220,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AarohaColors.mintSurface,
              AarohaColors.secondaryContainer,
              AarohaColors.surfaceContainerHigh,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Grid lines (simulated map)
            CustomPaint(
              size: const Size.fromHeight(220),
              painter: _MapGridPainter(),
            ),
            // Markers
            const Positioned(
              top: 80, left: 110,
              child: Icon(Icons.location_on_rounded,
                color: AarohaColors.primary, size: 36),
            ),
            const Positioned(
              top: 120, left: 190,
              child: Icon(Icons.location_on_rounded,
                color: AarohaColors.primary, size: 28),
            ),
            const Positioned(
              top: 50, left: 195,
              child: Icon(Icons.location_on_rounded,
                color: AarohaColors.tertiary, size: 28),
            ),
            // Location label
            Positioned(
              bottom: 16, left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AarohaColors.surface.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.my_location_rounded,
                      color: AarohaColors.primary, size: 14),
                    const SizedBox(width: 6),
                    Text(
                      'Munnar, Kerala',
                      style: AarohaTextStyles.labelMd.copyWith(
                        color: AarohaColors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Zoom control
            Positioned(
              bottom: 16, right: 16,
              child: Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                  color: AarohaColors.surface.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.my_location_rounded,
                  color: AarohaColors.onSurface,
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

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AarohaColors.outlineVariant.withOpacity(0.25)
      ..strokeWidth = 1;
    for (var i = 1; i < 4; i++) {
      canvas.drawLine(
        Offset(size.width * i / 4, 0),
        Offset(size.width * i / 4, size.height),
        paint,
      );
    }
    for (var i = 1; i < 4; i++) {
      canvas.drawLine(
        Offset(0, size.height * i / 4),
        Offset(size.width, size.height * i / 4),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

// ── Centre Card ───────────────────────────────────────────────
class _CentreCard extends StatelessWidget {
  final _Centre centre;
  final VoidCallback onCall;
  const _CentreCard({required this.centre, required this.onCall});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AarohaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AarohaConstants.radiusMd),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 64, height: 64,
            decoration: BoxDecoration(
              color: centre.isOpen
                  ? AarohaColors.mintSurface
                  : AarohaColors.tertiaryFixed.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              centre.isOpen
                  ? Icons.local_hospital_rounded
                  : Icons.healing_rounded,
              color: centre.isOpen
                  ? AarohaColors.primaryContainer
                  : AarohaColors.tertiary,
              size: 30,
            ),
          ),
          const SizedBox(width: 14),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        centre.name,
                        style: AarohaTextStyles.labelLg.copyWith(
                          color: AarohaColors.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: centre.isOpen
                            ? AarohaColors.primaryContainer.withOpacity(0.12)
                            : AarohaColors.tertiary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        centre.status.toUpperCase(),
                        style: AarohaTextStyles.overline.copyWith(
                          color: centre.isOpen
                              ? AarohaColors.primaryContainer
                              : AarohaColors.tertiary,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded,
                      color: AarohaColors.outline, size: 12),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        centre.address,
                        style: AarohaTextStyles.bodySm.copyWith(
                          color: AarohaColors.outline,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: onCall,
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                            color: AarohaColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.call_rounded,
                                color: AarohaColors.onPrimary, size: 16),
                              const SizedBox(width: 4),
                              Text('Call', style: AarohaTextStyles.labelMd.copyWith(
                                color: AarohaColors.onPrimary,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 36, height: 36,
                      decoration: BoxDecoration(
                        color: AarohaColors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.directions_rounded,
                        color: AarohaColors.primary, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Event Tile ────────────────────────────────────────────────
class _EventTile extends StatelessWidget {
  final _Event event;
  const _EventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AarohaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AarohaConstants.radiusMd),
      ),
      child: Row(
        children: [
          // Date chip
          Container(
            width: 48, height: 52,
            decoration: BoxDecoration(
              gradient: AarohaColors.heroGradientAngled,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  event.day,
                  style: AarohaTextStyles.headlineSm.copyWith(
                    color: AarohaColors.onPrimary,
                    fontSize: 20,
                  ),
                ),
                Text(
                  event.month.toUpperCase(),
                  style: AarohaTextStyles.overline.copyWith(
                    color: AarohaColors.onPrimary.withOpacity(0.8),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.title,
                  style: AarohaTextStyles.labelLg.copyWith(
                    color: AarohaColors.onSurface,
                  )),
                const SizedBox(height: 2),
                Text(
                  '${event.time} · ${event.mode}',
                  style: AarohaTextStyles.bodySm.copyWith(
                    color: AarohaColors.outline,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AarohaColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AarohaConstants.radiusFull),
            ),
            child: Text(
              'Join',
              style: AarohaTextStyles.labelMd.copyWith(
                color: AarohaColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Helpline Banner ───────────────────────────────────────────
class _HelplineBanner extends StatelessWidget {
  final Future<void> Function(String) onCall;
  const _HelplineBanner({required this.onCall});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AarohaColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(AarohaConstants.radiusXl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.support_agent_rounded,
                color: AarohaColors.tertiary, size: 22),
              const SizedBox(width: 10),
              Text(
                'Helpline — One Tap',
                style: AarohaTextStyles.titleMd.copyWith(
                  color: AarohaColors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => onCall('tel:18005990019'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: AarohaColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(AarohaConstants.radiusMd),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VANDREVALA FOUNDATION',
                          style: AarohaTextStyles.overline.copyWith(
                            color: AarohaColors.tertiary,
                          ),
                        ),
                        Text(
                          '1800-599-0019',
                          style: AarohaTextStyles.labelLg.copyWith(
                            color: AarohaColors.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '24/7 · Free',
                          style: AarohaTextStyles.bodySm.copyWith(
                            color: AarohaColors.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40, height: 40,
                    decoration: BoxDecoration(
                      color: AarohaColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.call_rounded,
                      color: AarohaColors.primary, size: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Data classes ──────────────────────────────────────────────
class _Centre {
  final String name;
  final String address;
  final String phone;
  final String status;
  final bool isOpen;
  final String type;
  const _Centre({
    required this.name,
    required this.address,
    required this.phone,
    required this.status,
    required this.isOpen,
    required this.type,
  });
}

class _Event {
  final String title;
  final String date;
  final String time;
  final String mode;
  final String day;
  final String month;
  const _Event({
    required this.title,
    required this.date,
    required this.time,
    required this.mode,
    required this.day,
    required this.month,
  });
}
