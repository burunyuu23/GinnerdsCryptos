import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_coins.dart';

class CryptoCoinsRepo implements AbstractCoinsRepo {
  CryptoCoinsRepo({
    required this.dio,
    required this.cryptoCoinsBox,
  });

  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    List<CryptoCoin> cryptoCoinsList = <CryptoCoin>[];

    try {
      cryptoCoinsList = await _fetchCoinsListFromApi();
      final cryptoCoinsMap = {
        for (var entry in cryptoCoinsList) entry.name: entry
      };
      await cryptoCoinsBox.putAll(cryptoCoinsMap);
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      cryptoCoinsList = cryptoCoinsBox.values.toList();
    }

    cryptoCoinsList.sort((a, b) => b.details.priceInUSD.compareTo(a.details.priceInUSD));
    return cryptoCoinsList;
  }

  Future<List<CryptoCoin>> _fetchCoinsListFromApi() async {
    final resp = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,ALT,DOGE,AID,BNB,DOV,SOL,CAG,IWO,AAC,ABCC,ABT,IST&tsyms=USD");

    final data = resp.data as Map<String, dynamic>;
    final dataRaw = data["RAW"] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((entry) {
      final usdData =
      (entry.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final details = CryptoCoinDetail.fromJson(usdData);

      return CryptoCoin(name: entry.key, details: details);
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    try {
      CryptoCoin coin = await _fetchCoinDetailsFromApi(currencyCode);
      await cryptoCoinsBox.put(currencyCode, coin);
      return coin;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      return cryptoCoinsBox.get(currencyCode)!;
    }
  }

  Future<CryptoCoin> _fetchCoinDetailsFromApi(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetail.fromJson(usdData);
    return CryptoCoin(name: currencyCode, details: details);
  }
}
