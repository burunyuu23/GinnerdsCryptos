

import 'package:first_test_app/repositories/crypto_coins/crypto_coins.dart';

class CryptoCoinDetail extends CryptoCoin {
  const CryptoCoinDetail({
    required super.name,
    required super.priceInUSD,
    required super.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.high24Hours,
    required this.low24Hours,
  });

  // TOSYMBOL
  final String toSymbol;

  // LASTUPDATE
  final DateTime lastUpdate;

  // HIGH24HOUR
  final double high24Hours;

  // LOW24HOUR
  final double low24Hours;

  @override
  List<Object> get props => super.props
    ..addAll([
      toSymbol,
      lastUpdate,
      high24Hours,
      low24Hours,
    ]);
}
