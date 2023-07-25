
import 'package:dio/dio.dart';
import 'package:first_test_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'crypto_coins_list_app.dart';


void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepo>(
          () => CryptoCoinsRepo(dio: Dio()),
  );
  runApp(const CryptoCurrenciesList());
}
