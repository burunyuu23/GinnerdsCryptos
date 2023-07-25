import 'models/models.dart';

abstract class AbstractCoinsRepo {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDetail> getCoinDetails(String currencyCode);
}