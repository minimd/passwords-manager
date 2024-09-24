// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:passes/models/cardsModel.dart';
import 'package:passes/provider/cardsProvider.dart';
import 'package:passes/screens/my_home_page.dart';
import 'package:provider/provider.dart';

class EditCardScreen extends StatelessWidget {
  const EditCardScreen({super.key, required this.cardToEdit});

  final Cards cardToEdit;

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController(text: cardToEdit.username);
    final typeController = TextEditingController(text: cardToEdit.type);
    final passwordController = TextEditingController(text: cardToEdit.password);
    final infoController = TextEditingController(text: cardToEdit.info);
    final prov = Provider.of<CardsProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('edit account'),
          centerTitle: true,
          toolbarHeight: 90,
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                prov.removeCard(cardToEdit);
                // AwesomeDialog(
                //         context: context,
                //         dialogType: DialogType
                //             .warning, // You can use different types like INFO, ERROR, WARNING, etc.
                //         animType: AnimType
                //             .scale, // Animation type: BOTTOMSLIDE, SCALE, LEFTSLIDE, RIGHTSLIDE
                //         title: 'are you sure ?',
                //         btnOkOnPress: () {
                //           Navigator.pushAndRemoveUntil(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const MyHomePage()),
                //             //you can choose the last screen to destroy here.. or all of you do like me here
                //             //!IMPORTANT: i love you. handsome.
                //             (Route<dynamic> route) => false,
                //           );
                    //     },
                    //     btnCancelOnPress: () {})
                    // .show();

              },
            )
          ],
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
                      onPressed: () {
                        prov.editCard(
                            cardToEdit,
                            userNameController.text,
                            passwordController.text,
                            typeController.text,
                            infoController.text);
                        //ok stay with me.. this Navigator kind here DESTROYS ALL THE PREVIOUS SCREENS AND GOES TO THE NEW ONE..
                        //so there is no back button
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                          //you can choose the last screen to destroy here.. or all of you do like me here
                          //!IMPORTANT: i love you. handsome.
                          (Route<dynamic> route) => false,

                          //you can choose the last screen to destroy here.. or all of you do like me here
                          //!IMPORTANT: i love you. handsome.
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
