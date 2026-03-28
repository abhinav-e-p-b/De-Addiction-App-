import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Aaroha Typography — Editorial Voice
/// Manrope (authority/display) + Inter (utility/body)
class AarohaTextStyles {
  AarohaTextStyles._();

  // ── MANROPE — Display & Headlines ─────────────────────────
  static TextStyle get displayLg => GoogleFonts.manrope(
        fontSize: 56,
        fontWeight: FontWeight.w800,
        letterSpacing: -1.12, // -0.02em
        height: 1.1,
      );

  static TextStyle get displayMd => GoogleFonts.manrope(
        fontSize: 40,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.8,
        height: 1.15,
      );

  static TextStyle get headlineLg => GoogleFonts.manrope(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.64,
        height: 1.2,
      );

  static TextStyle get headlineMd => GoogleFonts.manrope(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.56,
        height: 1.25,
      );

  static TextStyle get headlineSm => GoogleFonts.manrope(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.48,
        height: 1.3,
      );

  static TextStyle get titleLg => GoogleFonts.manrope(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
        height: 1.35,
      );

  static TextStyle get titleMd => GoogleFonts.manrope(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.36,
        height: 1.4,
      );

  // ── INTER — Body & Utility ────────────────────────────────
  static TextStyle get bodyLg => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0,
      );

  static TextStyle get bodyMd => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0,
      );

  static TextStyle get bodySm => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0,
      );

  static TextStyle get labelLg => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.4,
      );

  static TextStyle get labelMd => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: 1.3,
      );

  static TextStyle get labelSm => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        height: 1.2,
      );

  /// Overline / Category labels — uppercase + wide tracking
  static TextStyle get overline => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.6,
        height: 1.2,
      );
}
