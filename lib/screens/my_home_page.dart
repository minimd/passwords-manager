import 'package:flutter/material.dart';
import 'package:passes/provider/cardsProvider.dart';
import 'package:passes/screens/add_screen.dart';
import 'package:passes/screens/single_card_screen.dart';
import 'package:provider/provider.dart';
// nothing so big. but! we didn't make a seperate widget for the cards cuz
//we can't access the provider on there.. it's build context is different

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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SingleCardScreen(cardItem: prov.cards[index])));
              },
              child: Container(
                color: Colors.transparent,// to let the gesture detector work on plain spaces
                height: 70,
                width: 300,
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
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('added a new card');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddScreen()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
