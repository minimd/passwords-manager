//this is the main dancer.. the card model.. this is an iconic way to make a class
//that you want to use throughout your app

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cards {
  Cards(
      {this.imageUrl,
      required this.username,
      required this.password,
      required this.type,
      this.info,
      required this.id});
  String? imageUrl;
  String username;
  String password;
  String type;
  String? info;
  int id;

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'username': username,
        'password': password,
        'type': type,
        'info': info,
        'id': id
      };

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
        username: json['username'],
        password: json['password'],
        type: json['type'],
        info: json['info'],
        id: json['id']);
  }
  String toJsonString() => json.encode(toJson());

  factory Cards.fromJsonString(String source) =>
      Cards.fromJson(json.decode(source));

  Future<void> saveToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'card_${this.id}';
    await prefs.setString(key, this.toJsonString());
  }
}
