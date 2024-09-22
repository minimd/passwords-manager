import 'package:flutter/material.dart';
import 'package:passes/main.dart';
import 'package:passes/my_home_page.dart';
import 'package:passes/provider/cardsProvider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardsProvider(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 6, 15, 2)),
          useMaterial3: false,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
