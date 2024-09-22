import 'package:flutter/material.dart';
import 'package:passes/provider/cardsProvider.dart';
import 'package:passes/widgets/account_card.dart';
import 'package:passes/widgets/cart.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CardsProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Passwords'),
          toolbarHeight: 80,
        ),
        body: ListView.builder(
          itemCount: prov.cards.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                height: 70,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: prov.cards[index].imageUrl != null
                          ? Image.asset(
                              prov.cards[index].imageUrl!,
                            )
                          : Text(prov.cards[index].type),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(prov.cards[index].username),
                            Text(prov.cards[index].password)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle tap event to delete the card
                        debugPrint('sui');
                        prov.removeCard(prov.cards[index]);
                      },
                      child: const Icon(Icons.delete),
                    )
                  ],
                ),
              ),
            );
            ;
          },
        ));
  }
}
