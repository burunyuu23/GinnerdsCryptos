import 'package:dio/dio.dart';
import 'package:first_test_app/repositories/models/crypto_coin.dart';

class CryptoCoinsRepo {
  Future<List<CryptoCoin>> getCoinsList() async {
    final resp = await Dio().get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,ALT,DOGE,AID,BNB,DOV,SOL,CAG,IWO,AAC,ABCC,ABT,IST&tsyms=USD"
    );

    final data = resp.data as Map<String, dynamic>;
    final dataRaw = data["RAW"] as Map<String, dynamic>;
    final dataList = dataRaw.entries.map((entry)
        {
          final usdData = (entry.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
          final price = usdData["PRICE"];
          final imageUrl = usdData["IMAGEURL"];

          return CryptoCoin(
              name: entry.key,
              priceInUSD: price,
            imageUrl: 'https://www.cryptocompare.com/$imageUrl'
          );
        }).toList();

        return dataList;
    }
}