import 'package:flutter/material.dart';

class AppColors {
  // Brand / key colors
  static const primary = Color(0xFF373332);
  static const accent = Color(0xFFb5f556);

  // Neutrals
  static const backgroundLight = Color(0xFFF7F7F7);
  static const surfaceLight = Color(0xFFFFFFFF);

  static const backgroundDark = Color(0xFF0E0E0E);
  static const surfaceDark = Color(0xFF161616);

  // Text/icon colors
  static const onLight = Color(0xFF111111);
  static const onDark = Color(0xFFF2F2F2);

  // Subtle borders/dividers
  static const outlineLight = Color(0xFFE3E3E3);
  static const outlineDark = Color(0xFF2A2A2A);

  // Errors
  static const error = Color(0xFFB3261E);
}

class AppTheme {
  // ---------- COLOR SCHEMES (EXPLICIT: no fromSeed surprises) ----------

  static const ColorScheme lightScheme = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primary,
    onPrimary: Color(0xFFEDEDED),
    primaryContainer: Colors.white,
    onPrimaryContainer: AppColors.onLight,

    secondary: AppColors.accent,
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFDFF5E3),
    onSecondaryContainer: Color(0xFF0F2D16),

    surface: AppColors.backgroundLight,
    onSurface: AppColors.onLight,

    // Material 3 uses these a lot for elevation/layers
    surfaceContainerHighest: Color(0xFFF2F2F2),
    onSurfaceVariant: Color(0xFF4A4A4A),

    outline: AppColors.outlineLight,
    shadow: Colors.black,

    error: AppColors.error,
    onError: Colors.white,
    errorContainer: Color(0xFFF9DEDC),
    onErrorContainer: Color(0xFF410E0B),
  );

  static const ColorScheme darkScheme = ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFFF2F2F2),
    onPrimary: Color(0xFF111111),
    primaryContainer: Color(0xFF2A2A2A),
    onPrimaryContainer: AppColors.onDark,

    secondary: Color(0xFF7BE38D),
    onSecondary: Color(0xFF0B1F10),
    secondaryContainer: Color(0xFF1F3A26),
    onSecondaryContainer: AppColors.onDark,

    surface: AppColors.surfaceDark,
    onSurface: AppColors.onDark,

    surfaceContainerHighest: Color(0xFF1F1F1F),
    onSurfaceVariant: Color(0xFFBDBDBD),

    outline: AppColors.outlineDark,
    shadow: Colors.black,

    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    errorContainer: Color(0xFF8C1D18),
    onErrorContainer: Color(0xFFFFDAD6),
  );

  // ---------- THEME DATA ----------

  static ThemeData light = _buildTheme(lightScheme, AppColors.backgroundLight);
  static ThemeData dark = _buildTheme(darkScheme, AppColors.backgroundDark);

  static ThemeData _buildTheme(ColorScheme scheme, Color scaffoldBg) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scaffoldBg,
    );

    return base.copyWith(
      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBg,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.transparent, // avoid M3 tint surprises
      ),


      // Dividers
      dividerTheme: DividerThemeData(
        color: scheme.outline.withOpacity(0.6),
        thickness: 1,
        space: 1,
      ),

      //cardTheme
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Buttons (common baseline)
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),

      // Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.outline.withOpacity(0.6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.outline.withOpacity(0.6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.primary, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      ),

      // Text
      textTheme: base.textTheme.copyWith(
        titleLarge: base.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        titleMedium: base.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        bodyMedium: base.textTheme.bodyMedium?.copyWith(height: 1.25),
      ),
    );
  }
}