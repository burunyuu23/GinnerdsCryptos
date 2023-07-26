import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:first_test_app/features/crypto_coin/bloc/crypto_coin_details/crypto_coin_details_bloc.dart';
import 'package:first_test_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  // CryptoCoin? coin;
  final _coinDetailsBloc = CryptoCoinDetailsBloc(
    GetIt.I<AbstractCoinsRepo>(),
  );

  @override
  void initState() {
    _coinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: widget.coin.name));
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   final args = ModalRoute.of(context)?.settings.arguments;
  //   assert(args != null && args is CryptoCoin, 'You must provide String args');
  //   coin = args as CryptoCoin;
  //   _coinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: coin!.name));
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text( widget.coin.name, textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
        bloc: _coinDetailsBloc,
        builder: (context, state) {
          if (state is CryptoCoinDetailsLoaded) {
            final coin = state.coin;
            final coinDetails = coin.details;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 256,
                    width: 256,
                    child: Image.network(coinDetails.fullNameImageUrl),
                  ),
                  Text(
                    coin.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      '${coinDetails.priceInUSD} \$',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('High 24 Hour: '),
                            Text('${coinDetails.high24Hours} \$'),
                          ]),
                      const SizedBox(height: 6),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Low 24 Hour: '),
                            Text('${coinDetails.low24Hours} \$'),
                          ]),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
