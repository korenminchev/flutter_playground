import 'package:flutter/material.dart';
import 'package:flutter_playground/app_ui.dart';
import 'package:flutter_playground/primary_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppUI.setUntitsSize(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Playground"),
      ),
      body: Center(
        child: PrimaryButton(
          text: 'Primary Button',
          onTap: () {
            print('Primary Button tapped');
          },
          popupActionsBuilder: (context) => [
            const PopupMenuItem(
              child: Text('Popup Menu Item 1'),
              value: 'Popup Menu Item 1',
            ),
            const PopupMenuItem(
              child: Text('Popup Menu Item 2'),
              value: 'Popup Menu Item 2',
            ),
          ],
        ),
      ),
    );
  }
}
