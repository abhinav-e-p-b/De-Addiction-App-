import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AarohaTheme {
  AarohaTheme._();

  static ThemeData get light {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AarohaColors.primary,
      onPrimary: AarohaColors.onPrimary,
      primaryContainer: AarohaColors.primaryContainer,
      onPrimaryContainer: AarohaColors.onPrimaryContainer,
      secondary: AarohaColors.secondary,
      onSecondary: AarohaColors.onSecondary,
      secondaryContainer: AarohaColors.secondaryContainer,
      onSecondaryContainer: AarohaColors.onSecondaryContainer,
      tertiary: AarohaColors.tertiary,
      onTertiary: AarohaColors.onTertiary,
      tertiaryContainer: AarohaColors.tertiaryContainer,
      onTertiaryContainer: AarohaColors.onTertiaryContainer,
      error: AarohaColors.error,
      onError: AarohaColors.onError,
      errorContainer: AarohaColors.errorContainer,
      onErrorContainer: AarohaColors.onErrorContainer,
      surface: AarohaColors.surface,
      onSurface: AarohaColors.onSurface,
      onSurfaceVariant: AarohaColors.onSurfaceVariant,
      inverseSurface: AarohaColors.inverseSurface,
      inverseOnSurface: AarohaColors.inverseOnSurface,
      inversePrimary: AarohaColors.inversePrimary,
      outline: AarohaColors.outline,
      outlineVariant: AarohaColors.outlineVariant,
      surfaceTint: AarohaColors.surfaceTint,
      scrim: Color(0xFF000000),
      shadow: Color(0xFF000000),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AarohaColors.background,

      // ── AppBar ───────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: AarohaColors.surface,
        foregroundColor: AarohaColors.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        shadowColor: AarohaColors.outlineVariant.withOpacity(0.3),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AarohaTextStyles.titleLg.copyWith(
          color: AarohaColors.primary,
        ),
        iconTheme: const IconThemeData(color: AarohaColors.primary),
      ),

      // ── Bottom Nav ────────────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AarohaColors.surface.withOpacity(0.92),
        indicatorColor: AarohaColors.surfaceContainerHighest,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AarohaTextStyles.labelSm.copyWith(
              color: AarohaColors.primary,
            );
          }
          return AarohaTextStyles.labelSm.copyWith(
            color: AarohaColors.outline,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AarohaColors.primary, size: 24);
          }
          return const IconThemeData(color: AarohaColors.outline, size: 24);
        }),
        elevation: 0,
        height: 72,
      ),

      // ── Cards ─────────────────────────────────────────────
      // No border rule — depth via tonal surface shifts
      cardTheme: CardTheme(
        color: AarohaColors.surfaceContainerLow,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── Elevated Button (Primary CTA) ─────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AarohaColors.primary,
          foregroundColor: AarohaColors.onPrimary,
          elevation: 0,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: AarohaTextStyles.labelLg,
        ),
      ),

      // ── Filled Button ────────────────────────────────────
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AarohaColors.primary,
          foregroundColor: AarohaColors.onPrimary,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: AarohaTextStyles.labelLg,
        ),
      ),

      // ── Outlined Button (Secondary) ───────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AarohaColors.primary,
          minimumSize: const Size.fromHeight(56),
          side: const BorderSide(
            color: AarohaColors.outlineVariant,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: AarohaTextStyles.labelLg,
        ),
      ),

      // ── Text Button ───────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AarohaColors.primary,
          textStyle: AarohaTextStyles.labelLg,
        ),
      ),

      // ── Input Decoration ─────────────────────────────────
      // Filled style — Material 3
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AarohaColors.surfaceContainerHigh,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AarohaColors.primary,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: AarohaTextStyles.bodyMd.copyWith(
          color: AarohaColors.outline,
        ),
      ),

      // ── Chip ─────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: AarohaColors.surfaceContainerHigh,
        selectedColor: AarohaColors.primary,
        labelStyle: AarohaTextStyles.labelMd,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide.none,
        ),
        elevation: 0,
        pressElevation: 0,
      ),

      // ── FAB ──────────────────────────────────────────────
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AarohaColors.tertiary,
        foregroundColor: AarohaColors.onTertiary,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        shape: CircleBorder(),
      ),

      // ── Divider ───────────────────────────────────────────
      // DESIGN.md: No divider lines — use spacing instead
      dividerTheme: const DividerThemeData(
        color: Colors.transparent,
        thickness: 0,
        space: 0,
      ),

      // ── List Tile ────────────────────────────────────────
      listTileTheme: ListTileThemeData(
        tileColor: AarohaColors.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // ── Bottom Sheet ─────────────────────────────────────
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AarohaColors.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        elevation: 0,
      ),

      // ── Snack Bar ────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AarohaColors.inverseSurface,
        contentTextStyle: AarohaTextStyles.bodyMd.copyWith(
          color: AarohaColors.inverseOnSurface,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // ── Typography ───────────────────────────────────────
      textTheme: TextTheme(
        displayLarge: AarohaTextStyles.displayLg,
        displayMedium: AarohaTextStyles.displayMd,
        headlineLarge: AarohaTextStyles.headlineLg,
        headlineMedium: AarohaTextStyles.headlineMd,
        headlineSmall: AarohaTextStyles.headlineSm,
        titleLarge: AarohaTextStyles.titleLg,
        titleMedium: AarohaTextStyles.titleMd,
        bodyLarge: AarohaTextStyles.bodyLg,
        bodyMedium: AarohaTextStyles.bodyMd,
        bodySmall: AarohaTextStyles.bodySm,
        labelLarge: AarohaTextStyles.labelLg,
        labelMedium: AarohaTextStyles.labelMd,
        labelSmall: AarohaTextStyles.labelSm,
      ),
    );
  }
}
