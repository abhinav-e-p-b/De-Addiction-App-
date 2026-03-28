import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../constants/app_constants.dart';

// ── Gradient CTA Button ────────────────────────────────────────
/// Signature primary action — 135° gradient, xl radius
class GradientButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final double height;

  const GradientButton({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: height,
        decoration: BoxDecoration(
          gradient: AarohaColors.heroGradientAngled,
          borderRadius: BorderRadius.circular(AarohaConstants.radiusLg),
          boxShadow: [
            BoxShadow(
              color: AarohaColors.primary.withOpacity(0.25),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AarohaTextStyles.labelLg.copyWith(
                color: AarohaColors.onPrimary,
                fontSize: 16,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, color: AarohaColors.onPrimary, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Section Header ─────────────────────────────────────────────
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AarohaTextStyles.titleMd.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        ),
        if (actionLabel != null)
          GestureDetector(
            onTap: onAction,
            child: Text(
              actionLabel!,
              style: AarohaTextStyles.labelMd.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
      ],
    );
  }
}

// ── Category Chip ──────────────────────────────────────────────
class AarohaFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const AarohaFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : (isDark
                  ? AarohaColors.darkSurfaceContainerHigh
                  : AarohaColors.surfaceContainerHigh),
          borderRadius: BorderRadius.circular(AarohaConstants.radiusFull),
        ),
        child: Text(
          label,
          style: AarohaTextStyles.labelMd.copyWith(
            color: isSelected
                ? colorScheme.onPrimary
                : colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

// ── Overline Tag ───────────────────────────────────────────────
class OverlineTag extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;

  const OverlineTag({
    super.key,
    required this.label,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(AarohaConstants.radiusFull),
      ),
      child: Text(
        label.toUpperCase(),
        style: AarohaTextStyles.overline.copyWith(
          color: textColor ?? colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}

// ── Ambient shadow helper ──────────────────────────────────────
List<BoxShadow> ambientShadow(BuildContext context) => [
      BoxShadow(
        color: Theme.of(context)
            .colorScheme
            .onSurface
            .withOpacity(AarohaConstants.ambientShadowOpacity),
        blurRadius: AarohaConstants.ambientShadowBlur,
        offset: const Offset(0, 4),
      ),
    ];

// Keep the old getter for backward compat (light mode values)
List<BoxShadow> get ambientShadowDefault => [
      BoxShadow(
        color: AarohaColors.onSurface
            .withOpacity(AarohaConstants.ambientShadowOpacity),
        blurRadius: AarohaConstants.ambientShadowBlur,
        offset: const Offset(0, 4),
      ),
    ];

// ── Tappable Card wrapper ─────────────────────────────────────
class TappableCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? color;
  final double radius;
  final EdgeInsets padding;

  const TappableCard({
    super.key,
    required this.child,
    this.onTap,
    this.color,
    this.radius = AarohaConstants.radiusLg,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  State<TappableCard> createState() => _TappableCardState();
}

class _TappableCardState extends State<TappableCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
      lowerBound: 0,
      upperBound: 1,
    );
    _scale = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final defaultCardColor = isDark
        ? AarohaColors.darkSurfaceContainerLow
        : AarohaColors.surfaceContainerLow;

    return GestureDetector(
      onTapDown: (_) => _ctrl.forward(),
      onTapUp: (_) async {
        await _ctrl.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _ctrl.reverse(),
      child: AnimatedBuilder(
        animation: _scale,
        builder: (_, child) => Transform.scale(
          scale: _scale.value,
          child: child,
        ),
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.color ?? defaultCardColor,
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
