import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AarohaTheme {
  AarohaTheme._();

  // ─────────────────────────────────────────────────────────
  // LIGHT THEME
  // ─────────────────────────────────────────────────────────
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
      onInverseSurface: AarohaColors.inverseOnSurface,
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

      cardTheme: CardThemeData(
        color: AarohaColors.surfaceContainerLow,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.zero,
      ),

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

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AarohaColors.primary,
          textStyle: AarohaTextStyles.labelLg,
        ),
      ),

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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: AarohaTextStyles.bodyMd.copyWith(
          color: AarohaColors.outline,
        ),
      ),

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

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AarohaColors.tertiary,
        foregroundColor: AarohaColors.onTertiary,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        shape: CircleBorder(),
      ),

      dividerTheme: const DividerThemeData(
        color: Colors.transparent,
        thickness: 0,
        space: 0,
      ),

      listTileTheme: ListTileThemeData(
        tileColor: AarohaColors.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AarohaColors.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        elevation: 0,
      ),

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

  // ─────────────────────────────────────────────────────────
  // DARK THEME
  // ─────────────────────────────────────────────────────────
  static ThemeData get dark {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AarohaColors.inversePrimary,
      onPrimary: AarohaColors.onPrimaryFixed,
      primaryContainer: AarohaColors.darkPrimaryContainer,
      onPrimaryContainer: AarohaColors.onPrimaryContainer,
      secondary: AarohaColors.secondaryFixedDim,
      onSecondary: AarohaColors.onSecondaryFixed,
      secondaryContainer: Color(0xFF1E3831),
      onSecondaryContainer: AarohaColors.secondaryFixed,
      tertiary: AarohaColors.tertiaryFixedDim,
      onTertiary: AarohaColors.onTertiaryFixed,
      tertiaryContainer: AarohaColors.tertiaryContainer,
      onTertiaryContainer: AarohaColors.onTertiaryContainer,
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: AarohaColors.darkSurface,
      onSurface: AarohaColors.darkOnSurface,
      onSurfaceVariant: AarohaColors.darkOnSurfaceVariant,
      inverseSurface: AarohaColors.darkInverseSurface,
      onInverseSurface: AarohaColors.darkInverseOnSurface,
      inversePrimary: AarohaColors.primary,
      outline: AarohaColors.darkOutline,
      outlineVariant: AarohaColors.darkOutlineVariant,
      surfaceTint: AarohaColors.inversePrimary,
      scrim: Color(0xFF000000),
      shadow: Color(0xFF000000),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AarohaColors.darkBackground,

      appBarTheme: AppBarTheme(
        backgroundColor: AarohaColors.darkSurface,
        foregroundColor: AarohaColors.darkOnSurface,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        shadowColor: AarohaColors.darkOutlineVariant.withOpacity(0.3),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: AarohaTextStyles.titleLg.copyWith(
          color: AarohaColors.inversePrimary,
        ),
        iconTheme: const IconThemeData(color: AarohaColors.inversePrimary),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AarohaColors.darkSurface.withOpacity(0.92),
        indicatorColor: AarohaColors.darkSurfaceContainerHighest,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AarohaTextStyles.labelSm.copyWith(
              color: AarohaColors.inversePrimary,
            );
          }
          return AarohaTextStyles.labelSm.copyWith(
            color: AarohaColors.darkOutline,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(
                color: AarohaColors.inversePrimary, size: 24);
          }
          return const IconThemeData(
              color: AarohaColors.darkOutline, size: 24);
        }),
        elevation: 0,
        height: 72,
      ),

      cardTheme: CardThemeData(
        color: AarohaColors.darkSurfaceContainerLow,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.zero,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AarohaColors.inversePrimary,
          foregroundColor: AarohaColors.onPrimaryFixed,
          elevation: 0,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: AarohaTextStyles.labelLg,
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AarohaColors.inversePrimary,
          foregroundColor: AarohaColors.onPrimaryFixed,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: AarohaTextStyles.labelLg,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AarohaColors.inversePrimary,
          minimumSize: const Size.fromHeight(56),
          side: const BorderSide(
            color: AarohaColors.darkOutlineVariant,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: AarohaTextStyles.labelLg,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AarohaColors.inversePrimary,
          textStyle: AarohaTextStyles.labelLg,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AarohaColors.darkSurfaceContainerHigh,
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
            color: AarohaColors.inversePrimary,
            width: 2,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: AarohaTextStyles.bodyMd.copyWith(
          color: AarohaColors.darkOutline,
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: AarohaColors.darkSurfaceContainerHigh,
        selectedColor: AarohaColors.inversePrimary,
        labelStyle: AarohaTextStyles.labelMd,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide.none,
        ),
        elevation: 0,
        pressElevation: 0,
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AarohaColors.tertiaryContainer,
        foregroundColor: AarohaColors.onTertiaryContainer,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        shape: CircleBorder(),
      ),

      dividerTheme: const DividerThemeData(
        color: Colors.transparent,
        thickness: 0,
        space: 0,
      ),

      listTileTheme: ListTileThemeData(
        tileColor: AarohaColors.darkSurfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AarohaColors.darkSurfaceContainer,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        elevation: 0,
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: AarohaColors.darkInverseSurface,
        contentTextStyle: AarohaTextStyles.bodyMd.copyWith(
          color: AarohaColors.darkInverseOnSurface,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        behavior: SnackBarBehavior.floating,
      ),

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
