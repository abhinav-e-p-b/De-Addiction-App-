import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../constants/app_constants.dart';
import '../utils/app_router.dart';

class AarohaDrawer extends StatelessWidget {
  const AarohaDrawer({super.key});

  static const _items = [
    _DrawerItem(
      label: 'My Aaroha',
      subtitle: 'Goals + Streaks',
      icon: Icons.directions_walk_rounded,
      route: Routes.tracker,
    ),
    _DrawerItem(
      label: 'Swasthi',
      subtitle: 'AI Companion',
      icon: Icons.smart_toy_rounded,
      route: Routes.swasthi,
    ),
    _DrawerItem(
      label: 'Shanti Space',
      subtitle: 'Calm + Breathwork',
      icon: Icons.self_improvement_rounded,
      route: Routes.shanti,
    ),
    _DrawerItem(
      label: 'Ujjwal Feed',
      subtitle: 'Quotes + Videos',
      icon: Icons.wb_sunny_rounded,
      route: Routes.ujjwal,
    ),
    _DrawerItem(
      label: 'Sangam + Sahara',
      subtitle: 'Events + Resources',
      icon: Icons.location_on_rounded,
      route: Routes.sangam,
    ),
    _DrawerItem(
      label: 'Awareness Hub',
      subtitle: 'Tips + Stories',
      icon: Icons.import_contacts_rounded,
      route: Routes.hub,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor: colorScheme.surface,
      child: Column(
        children: [
          // ── Header ─────────────────────────────────────
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              24,
              MediaQuery.of(context).padding.top + 24,
              24,
              28,
            ),
            decoration: const BoxDecoration(
              gradient: AarohaColors.heroGradientAngled,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.self_improvement_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  AarohaConstants.appName,
                  style: AarohaTextStyles.headlineSm.copyWith(
                    color: AarohaColors.onPrimary,
                  ),
                ),
                Text(
                  AarohaConstants.appTagline,
                  style: AarohaTextStyles.bodySm.copyWith(
                    color: AarohaColors.onPrimary.withOpacity(0.75),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(
                      AarohaConstants.radiusFull,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.workspace_premium_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '12 days streak',
                        style: AarohaTextStyles.labelMd.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Nav Items ──────────────────────────────────
          Expanded(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              children: _items.map((item) {
                final isCurrent =
                    GoRouterState.of(context).uri.path == item.route;
                return Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      context.go(item.route);
                    },
                    selected: isCurrent,
                    selectedTileColor: isDark
                        ? AarohaColors.darkSurfaceContainerHighest
                        : AarohaColors.surfaceContainerHighest,
                    tileColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    leading: Icon(
                      item.icon,
                      color: isCurrent
                          ? colorScheme.primary
                          : colorScheme.outline,
                      size: 22,
                    ),
                    title: Text(
                      item.label,
                      style: AarohaTextStyles.labelLg.copyWith(
                        color: isCurrent
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      item.subtitle,
                      style: AarohaTextStyles.bodySm.copyWith(
                        color: colorScheme.outline,
                      ),
                    ),
                    trailing: isCurrent
                        ? Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                          )
                        : null,
                  ),
                );
              }).toList(),
            ),
          ),

          // ── Footer ─────────────────────────────────────
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              0,
              16,
              MediaQuery.of(context).padding.bottom + 16,
            ),
            child: Column(
              children: [
                Divider(
                  color: colorScheme.outlineVariant,
                  thickness: 0.5,
                ),
                const SizedBox(height: 8),
                Text(
                  'Anonymous · Private · Safe',
                  style: AarohaTextStyles.bodySm.copyWith(
                    color: colorScheme.outline,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'v1.0.0',
                  style: AarohaTextStyles.bodySm.copyWith(
                    color: colorScheme.outlineVariant,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem {
  final String label;
  final String subtitle;
  final IconData icon;
  final String route;
  const _DrawerItem({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.route,
  });
}
