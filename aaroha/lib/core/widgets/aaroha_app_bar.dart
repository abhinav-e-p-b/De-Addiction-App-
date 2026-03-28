import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../constants/app_constants.dart';

/// Persistent AppBar for all Aaroha screens
class AarohaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSOS;
  final String? title;
  final List<Widget>? actions;

  const AarohaAppBar({
    super.key,
    this.onSOS,
    this.title,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: colorScheme.surface,
      scrolledUnderElevation: 0.5,
      shadowColor: colorScheme.outlineVariant.withOpacity(0.3),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Builder(
          builder: (ctx) => IconButton(
            icon: Icon(Icons.menu_rounded, color: colorScheme.primary),
            onPressed: () => Scaffold.of(ctx).openDrawer(),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AarohaConstants.appName,
            style: AarohaTextStyles.titleLg.copyWith(
              color: colorScheme.primary,
              height: 1,
            ),
          ),
          Text(
            AarohaConstants.appTagline,
            style: AarohaTextStyles.overline.copyWith(
              color: isDark
                  ? AarohaColors.inversePrimary.withOpacity(0.6)
                  : AarohaColors.primaryContainer.withOpacity(0.8),
              letterSpacing: 1.2,
              height: 1,
            ),
          ),
        ],
      ),
      actions: [
        // SOS chip
        if (onSOS != null)
          GestureDetector(
            onTap: onSOS,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                color: colorScheme.tertiary.withOpacity(0.12),
                borderRadius:
                    BorderRadius.circular(AarohaConstants.radiusFull),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.emergency_rounded,
                    color: colorScheme.tertiary,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'SOS',
                    style: AarohaTextStyles.overline.copyWith(
                      color: colorScheme.tertiary,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        // Avatar
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: isDark
                ? AarohaColors.darkSurfaceContainerHighest
                : AarohaColors.surfaceContainerHighest,
            child: Icon(
              Icons.person_rounded,
              color: colorScheme.primary,
              size: 20,
            ),
          ),
        ),
        ...?actions,
      ],
    );
  }
}
