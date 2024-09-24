import 'package:flutter/material.dart';
import 'package:passes/models/cardsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardsProvider extends ChangeNotifier {
  List<Cards> _cards = [];

  get cards => _cards;

  void addCard(Cards card) async {
    _cards.add(card);
    await card.saveToSharedPreferences();
    notifyListeners();
  }

  Future<void> removeCard(Cards card) async {
    _cards = _cards.where((element) => element.id != card.id).toList();
    await deleteCardFromSharedPreferences(card.id);
    notifyListeners();
    debugPrint(_cards.length.toString());
  }

  void editCard(Cards card, username, password, type, info) async {
    await deleteCardFromSharedPreferences(card.id);

    card.username = username;
    card.password = password;
    card.type = type;
    card.info = info;
    card.id = card.id;
    await card.saveToSharedPreferences();
    notifyListeners();
  }

  Future<List<Cards>> loadAllFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final cardKeys = prefs.getKeys().where((key) => key.startsWith('card_'));
    // List<Cards> loadedCards = [];

    for (String key in cardKeys) {
      final jsonString = prefs.getString(key);
      if (jsonString != null) {
        _cards.add(Cards.fromJsonString(jsonString));
      }
    }

    return _cards;
  }

  Future<void> deleteCardFromSharedPreferences(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'card_$id';
    await prefs.remove(key);
  }

  CardsProvider() {
    _loadSavedCards();
  }

  Future<void> _loadSavedCards() async {
    _cards = await loadAllFromSharedPreferences();
    notifyListeners();
  }
}
