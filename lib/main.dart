import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/tesk_api.dart';
import 'package:flutter_application_1/features/home/home_screan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await teskApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
          textTheme: const TextTheme(),
          inputDecorationTheme:
              const InputDecorationTheme(border: OutlineInputBorder()),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff3C1F7B), brightness: Brightness.dark)),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          inputDecorationTheme:
              const InputDecorationTheme(border: OutlineInputBorder()),
          colorScheme:
              ColorScheme.fromSeed(seedColor: const Color(0xff3C1F7B))),
      home: const HomeScrean(),
    );
  }
}
