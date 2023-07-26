import 'models/models.dart';

abstract class AbstractCoinsRepo {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoin> getCoinDetails(String currencyCode);
}