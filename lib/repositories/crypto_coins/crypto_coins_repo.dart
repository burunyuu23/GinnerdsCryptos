import 'package:dio/dio.dart';
import 'crypto_coins.dart';

class CryptoCoinsRepo implements AbstractCoinsRepo{

  final Dio dio;
  CryptoCoinsRepo({
    required this.dio
  });

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final resp = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,ALT,DOGE,AID,BNB,DOV,SOL,CAG,IWO,AAC,ABCC,ABT,IST&tsyms=USD"
    );

    final data = resp.data as Map<String, dynamic>;
    final dataRaw = data["RAW"] as Map<String, dynamic>;
    final dataList = dataRaw.entries.map((entry)
        {
          final usdData = (entry.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
          final details = CryptoCoinDetail.fromJson(usdData);

          return CryptoCoin(
              name: entry.key,
              details: details
          );
        }).toList();

        return dataList;
    }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetail.fromJson(usdData);
    // final price = usdData['PRICE'];
    // final imageUrl = usdData['IMAGEURL'];
    // final toSymbol = usdData['TOSYMBOL'];
    // final lastUpdate = usdData['LASTUPDATE'];
    // final high24Hours = usdData['HIGH24HOUR'];
    // final low24Hours = usdData['LOW24HOUR'];

    return CryptoCoin(
      name: currencyCode,
      details: details
    );
  }
}