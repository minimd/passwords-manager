import 'package:flutter/material.dart';
import 'package:passes/models/cardsModel.dart';

class CardsProvider extends ChangeNotifier {
  List<Cards> _cards = [
    Cards(
        imageUrl: 'assets/Steam-Logo.png',
        username: 'john_doe',
        password: 'p@ssw0rd',
        type: 'Steam',
        id: 1),
    Cards(
        // imageUrl: 'assets/Steam-Logo.png',
        username: 'jasim',
        password: 'p@ssw0rd',
        type: 'Steam',
        id: 2),
    Cards(
        imageUrl: 'assets/Steam-Logo.png',
        username: 'messi',
        password: 'p@ssw0rd',
        type: 'microssoft',
        id: 3),
    Cards(
        // imageUrl: 'assets/Steam-Logo.png',
        username: 'john_doe',
        password: 'suiiiiii',
        type: 'Steam',
        id: 4),
  ];

  get cards => _cards;
  void addCard(Cards card) {
    _cards.add(card);
    notifyListeners();
  }

  void removeCard(Cards card) {
    _cards = _cards.where((element) => element.id != card.id).toList();
    notifyListeners();
    print(_cards.length.toString());
  }
}
void another(Cards card) {
  CardsProvider provider = CardsProvider();
  provider.removeCard(card);
}
