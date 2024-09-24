import 'package:flutter/material.dart';
import 'package:passes/models/cardsModel.dart';
import 'package:passes/provider/CardsProvider.dart';
import 'package:passes/screens/edit_card_screen.dart';
import 'package:provider/provider.dart';

class SingleCardScreen extends StatelessWidget {
  const SingleCardScreen({super.key, required this.cardItem});

  final Cards cardItem;

  @override
  Widget build(BuildContext context) {
    return Provider<CardsProvider>(
        create: (_) => CardsProvider(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(cardItem.username),
              centerTitle: true,
              toolbarHeight: 90,
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditCardScreen(cardToEdit: cardItem)),
                    );
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: cardItem.imageUrl != null
                        ? Image.asset(
                            cardItem.imageUrl!,
                            width: 150,
                          )
                        : Text(
                            cardItem.username,
                            style: const TextStyle(fontSize: 28),
                          ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'password: ${cardItem.password}',
                          style: const TextStyle(fontSize: 22),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Text(
                          'type: ${cardItem.type}',
                          style: const TextStyle(fontSize: 22),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Text(
                          'extra information: ${cardItem.info}',
                          style: const TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
