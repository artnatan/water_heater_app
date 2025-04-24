import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/callback_form.dart';
import 'screens/success_screen.dart';

void main() {
  runApp(const WaterHeaterApp());
}

class WaterHeaterApp extends StatelessWidget {
  const WaterHeaterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Водонагреватель',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomeScreen(), // ⬅️ Новая главная страница
        '/callback': (context) => const CallbackFormScreen(),
        '/success': (context) => const SuccessScreen(),
      },
    );
  }
}
