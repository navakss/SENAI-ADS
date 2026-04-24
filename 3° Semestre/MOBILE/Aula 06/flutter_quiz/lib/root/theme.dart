import 'package:flutter/material.dart';
import 'pallet.dart';

class AppTheme {
  static ThemeData get appTheme => ThemeData(
    scaffoldBackgroundColor: Pallet.background,
    colorScheme: const ColorScheme.dark(
      primary: Pallet.primary,
      secondary: Pallet.success,
      surface: Pallet.surface,
      error: Pallet.error,
      onPrimary: Pallet.background,
      onSecondary: Pallet.background,
      onSurface: Pallet.textPrimary,
      onError: Pallet.textPrimary,
    ),

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Pallet.textSecondary,
        fontSize: 14,
        letterSpacing: 0.5,
      ),
      iconTheme: IconThemeData(color: Pallet.textSecondary),
    ),

    // Textos
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Pallet.textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
      ),
      titleLarge: TextStyle(
        color: Pallet.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
      bodyLarge: TextStyle(
        color: Pallet.textPrimary,
        fontSize: 16,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        color: Pallet.textSecondary,
        fontSize: 14,
        height: 1.5,
      ),
    ),

    // Botões elevados
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallet.primary,
        foregroundColor: Pallet.background,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 8,
        shadowColor: Color.fromRGBO(0, 212, 255, 0.4),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
        ),
      ),
    ),

    // Progress Indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Pallet.primary,
      linearTrackColor: Pallet.surface,
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: Pallet.borderSubtle,
      thickness: 1,
    ),

    // Icon
    iconTheme: const IconThemeData(color: Pallet.primary, size: 24),
  );
}
