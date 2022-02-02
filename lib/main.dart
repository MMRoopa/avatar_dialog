import 'package:flutter/material.dart';

import 'avatarDialog/avatar_dialog.dart';
import 'coinDialog/coin_dialog.dart';
import 'promoCard/PromoCardPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int selectedIndex = 29;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AvatarDialog(serverIndex: selectedIndex),
              );
            },
            child: const Text('Avatar dialog'),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const PromoCardPage(),
                ),
              );
            },
            child: const Text('PromoCard'),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => DialogPopUp(),
              );
            },
            child: const Text('Coin Dialog'),
          ),
        ],
      ),
    );
  }
}
