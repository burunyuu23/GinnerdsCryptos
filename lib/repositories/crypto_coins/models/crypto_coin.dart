import 'package:equatable/equatable.dart';
import 'package:first_test_app/repositories/crypto_coins/crypto_coins.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.details,
  });

  final String name;
  final CryptoCoinDetail details;

  @override
  List<Object> get props => [name, details];
}
