import 'package:camk/Controller/ModeProvider.dart';
import 'package:camk/SignIn_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Directionality(
          textDirection: TextDirection.rtl, child: const CamkApp()),
    ),
  );
}

class CamkApp extends StatelessWidget {
  const CamkApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      locale: Locale('ar', 'Iq'), // For Arabic
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Directionality(
          textDirection: TextDirection.rtl, child: const SignInPage()),
    );
  }
}
