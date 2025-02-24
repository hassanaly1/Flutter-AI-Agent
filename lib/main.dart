import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:ai_agent/views/screenshots/screenshots.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final FlutterLocalization localization = FlutterLocalization.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Agent',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: lightTheme(),
        useMaterial3: true,
      ),
      // supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      home: ScreenShotsScreen(),
    );
  }

  ColorScheme lightTheme() {
    return ColorScheme.light().copyWith(
      primary: Color(0xFFF26F3B),
      secondary: Color(0xFF282828),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      primaryFixedDim: Color(0xFFfb9164),
      surface: Color.fromRGBO(240, 240, 240, 1),
    );
  }

  ColorScheme darkTheme() {
    return ColorScheme.dark().copyWith(
        primary: Color(0xFFF26F3B),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        secondary: Color(0xFF282828),
        primaryContainer: Color(0xFFF26F3B),
        onSurface: Colors.white,
        primaryFixedDim: Color(0xFFfb9164),
        surface: Color(0xFF282828),
        background: Color(0xFF121212));
  }
}
