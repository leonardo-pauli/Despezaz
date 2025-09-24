import 'package:despezaz/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = const ColorScheme.dark(
      primary: Color(0xFF7C4DFF),
      secondary: Color(0xFF64FFDA),
      surface: Color(0xFF121212),
      background: Color(0xFF0E0E0E),
      error: Color(0xFFFF5252),
    );

    final ThemeData theme = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: Colors.grey[900],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white70),
        bodyLarge: TextStyle(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorScheme.secondary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        filled: true,
        fillColor: const Color(0xFF1C1C1C),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) => colorScheme.primary),
        trackColor: MaterialStateProperty.resolveWith((states) => colorScheme.primary.withOpacity(0.5)),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: const TextStyle(color: Colors.white),
        menuStyle: MenuStyle(
          backgroundColor: MaterialStatePropertyAll(const Color(0xFF1C1C1C)),
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1A1A1A),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    return MaterialApp(
      theme: theme,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
