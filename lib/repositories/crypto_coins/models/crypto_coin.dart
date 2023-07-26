import 'package:equatable/equatable.dart';
import 'package:first_test_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:hive_flutter/adapters.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 1)
class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.details,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinDetail details;

  @override
  List<Object> get props => [name, details];
}
