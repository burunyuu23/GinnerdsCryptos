import 'dart:developer';

import 'package:first_test_app/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {

  CryptoCoin? coin;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null) {
      log('Pls provide args!');
      return;
    }
    if(args is! CryptoCoin) {
      log('Pls provide crypto coin args!');
      return;
    }

    coin = args;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(coin?.name ?? "...", textAlign: TextAlign.center),
        centerTitle: true,
      ),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network( coin!.imageUrl, width: 150, height: 150), // Ваша картинка
            SizedBox(height: 10), // Расстояние между картинкой и подписями
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Current course in USD:'),
                Text(coin?.priceInUSD.toString() ?? "none"),
              ],
            ),
          ],
        )));
  }
}