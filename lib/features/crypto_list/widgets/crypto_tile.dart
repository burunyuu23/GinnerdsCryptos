import 'package:auto_route/auto_route.dart';
import 'package:first_test_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:first_test_app/router/router.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile ({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetails = coin.details;
    return ListTile(
      leading: Image.network(
        coinDetails.fullNameImageUrl,
        height: 45,
        width: 45,
      ),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coinDetails.priceInUSD} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinRoute(coin: coin));
      },
    );
  }
}