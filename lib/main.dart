import 'package:flutter/material.dart';
import 'package:passes/my_app.dart';
// import 'package:passes/models/cardsModel.dart';
import 'package:passes/provider/cardsProvider.dart';
import 'package:passes/widgets/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CardsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
