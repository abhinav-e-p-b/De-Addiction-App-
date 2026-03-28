import 'package:flutter/material.dart';

/// Aaroha Design System — "The Living Sanctuary"
/// All color tokens from DESIGN.md
class AarohaColors {
  AarohaColors._();

  // ── Primary (Action) ──────────────────────────────────────
  static const Color primary = Color(0xFF005440);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF0F6E56);
  static const Color onPrimaryContainer = Color(0xFF9AEDCF);
  static const Color primaryFixed = Color(0xFFA0F3D4);
  static const Color primaryFixedDim = Color(0xFF84D6B9);
  static const Color onPrimaryFixed = Color(0xFF002117);
  static const Color onPrimaryFixedVariant = Color(0xFF00513E);
  static const Color inversePrimary = Color(0xFF84D6B9);

  // ── Secondary ────────────────────────────────────────────
  static const Color secondary = Color(0xFF50625D);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFD3E7E0);
  static const Color onSecondaryContainer = Color(0xFF566863);
  static const Color secondaryFixed = Color(0xFFD3E7E0);
  static const Color secondaryFixedDim = Color(0xFFB7CBC4);
  static const Color onSecondaryFixed = Color(0xFF0D1F1B);
  static const Color onSecondaryFixedVariant = Color(0xFF394A45);

  // ── Tertiary (Urgency) ────────────────────────────────────
  static const Color tertiary = Color(0xFF832C0E);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFA34324);
  static const Color onTertiaryContainer = Color(0xFFFFD3C6);
  static const Color tertiaryFixed = Color(0xFFFFDBD0);
  static const Color tertiaryFixedDim = Color(0xFFFFB59E);
  static const Color onTertiaryFixed = Color(0xFF3A0B00);
  static const Color onTertiaryFixedVariant = Color(0xFF802A0B);

  // ── Error ────────────────────────────────────────────────
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  // ── Surface hierarchy ─────────────────────────────────────
  static const Color surface = Color(0xFFFCF9F5);
  static const Color surfaceBright = Color(0xFFFCF9F5);
  static const Color surfaceDim = Color(0xFFDCDAD6);
  static const Color surfaceVariant = Color(0xFFE5E2DF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF6F3F0);
  static const Color surfaceContainer = Color(0xFFF0EDEA);
  static const Color surfaceContainerHigh = Color(0xFFEAE8E4);
  static const Color surfaceContainerHighest = Color(0xFFE5E2DF);

  // ── On-Surface ───────────────────────────────────────────
  static const Color onSurface = Color(0xFF1B1C1A);
  static const Color onSurfaceVariant = Color(0xFF3F4944);
  static const Color inverseSurface = Color(0xFF30302E);
  static const Color inverseOnSurface = Color(0xFFF3F0ED);

  // ── Background ───────────────────────────────────────────
  static const Color background = Color(0xFFFCF9F5);
  static const Color onBackground = Color(0xFF1B1C1A);

  // ── Outline ──────────────────────────────────────────────
  static const Color outline = Color(0xFF6F7A74);
  static const Color outlineVariant = Color(0xFFBEC9C3);

  // ── Surface Tint ─────────────────────────────────────────
  static const Color surfaceTint = Color(0xFF086B53);

  // ── Gradient ─────────────────────────────────────────────
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    transform: GradientRotation(135 * 3.14159 / 180),
    colors: [primary, primaryContainer],
  );

  static const LinearGradient heroGradientAngled = LinearGradient(
    begin: Alignment(-0.7, -1),
    end: Alignment(0.7, 1),
    colors: [primary, primaryContainer],
  );

  // ── Semantic helpers ─────────────────────────────────────
  static const Color mintSurface = Color(0xFFE1F5EE);

  // ── Dark Mode Colors ──────────────────────────────────────
  static const Color darkSurface = Color(0xFF0F1A17);
  static const Color darkBackground = Color(0xFF0F1A17);
  static const Color darkSurfaceContainerLowest = Color(0xFF0A1410);
  static const Color darkSurfaceContainerLow = Color(0xFF1A2922);
  static const Color darkSurfaceContainer = Color(0xFF1F3028);
  static const Color darkSurfaceContainerHigh = Color(0xFF243529);
  static const Color darkSurfaceContainerHighest = Color(0xFF2A3D30);
  static const Color darkOnSurface = Color(0xFFE2E3DF);
  static const Color darkOnSurfaceVariant = Color(0xFFBEC9C3);
  static const Color darkOutline = Color(0xFF8A9590);
  static const Color darkOutlineVariant = Color(0xFF3F4944);
  static const Color darkInverseSurface = Color(0xFFE2E3DF);
  static const Color darkInverseOnSurface = Color(0xFF2D3330);
  static const Color darkMintSurface = Color(0xFF0D2B20);
  static const Color darkPrimaryContainer = Color(0xFF0F6E56);

  // ── Dark Mode Gradients ───────────────────────────────────
  static const LinearGradient darkHeroGradientAngled = LinearGradient(
    begin: Alignment(-0.7, -1),
    end: Alignment(0.7, 1),
    colors: [Color(0xFF0F6E56), Color(0xFF005440)],
  );
}
