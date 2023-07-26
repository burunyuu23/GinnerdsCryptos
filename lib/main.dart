import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_test_app/firebase_options.dart';
import 'package:first_test_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'crypto_coins_list_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final talker = TalkerFlutter.init();

  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug("Talker started!");

  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  talker.info(app.options.projectId);

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
        printResponseMessage: true,
      )
    )
  );

  Bloc.observer = TalkerBlocObserver(talker: talker, settings: const TalkerBlocLoggerSettings(
    printStateFullData: false,
    printEventFullData: false,
  ));

  GetIt.I.registerLazySingleton<AbstractCoinsRepo>(
    () => CryptoCoinsRepo(dio: dio),
  );

  runZonedGuarded(() => runApp(const CryptoCurrenciesList()),
      (error, stack) => GetIt.I<Talker>().handle(error, stack));
}
