import 'dart:math';

import 'package:flutter/material.dart';
import 'package:passes/models/cardsModel.dart';
import 'package:passes/screens/my_home_page.dart';
import 'package:passes/provider/cardsProvider.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //text editing controllers for username, type, and password.. to make life easier
    final userNameController = TextEditingController();
    final typeController = TextEditingController();
    final passwordController = TextEditingController();
    final infoController = TextEditingController();
    int randomNumber = Random().nextInt(1000000);

// calling the provider so we can use it's functions.. not listenning to updates.. simple, right ?

    final prov = Provider.of<CardsProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New account'),
        ),
        body: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Text('add your account details',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  TextField(
                    controller: typeController,
                    decoration: const InputDecoration(
                      labelText: 'account type',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      labelText: 'username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextField(
                    controller: infoController,
                    decoration: const InputDecoration(
                        hintText: 'optional',
                        labelText: 'extra information',
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  FilledButton(
                      onPressed: () async {
                        Cards card = Cards(
                            username: userNameController.text,
                            password: passwordController.text,
                            type: typeController.text,
                            info: infoController.text,
                            id: randomNumber);
                        prov.addCard(card);

                        //ok stay with me.. this Navigator kind here DESTROYS ALL THE PREVIOUS SCREENS AND GOES TO THE NEW ONE..
                        //so there is no back button
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                          //you can choose the last screen to destroy here.. or all of you do like me here
                          //!IMPORTANT: i love you. handsome.
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Save'),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
