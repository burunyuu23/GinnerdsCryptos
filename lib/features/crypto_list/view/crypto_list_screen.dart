import 'package:first_test_app/repositories/crypto_coins/crypto_coins_repo.dart';
import 'package:first_test_app/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  int _counter = 1;
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _setCryptoData();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
        _counter++;
    });
  }

  void _setCryptoData() async {
    _cryptoCoinsList = await CryptoCoinsRepo().getCoinsList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title, textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return CryptoCoinTile(coin: _cryptoCoinsList![index] );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // _incrementCounter();

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
