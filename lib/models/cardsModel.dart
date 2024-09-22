import 'package:flutter/material.dart';

class Cards extends ChangeNotifier {
  Cards(
      {this.imageUrl,
      required this.username,
      required this.password,
      required this.type,
      required this.id
      });
  final String? imageUrl;
  final String username;
  final String password;
  final String type;
  final int id;
}





