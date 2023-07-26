import 'package:first_test_app/router/router.dart';
import 'package:first_test_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCurrenciesListApp extends StatefulWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  State<CryptoCurrenciesListApp> createState() =>
    _CryptoCurrenciesListAppState();
}

class _CryptoCurrenciesListAppState extends State<CryptoCurrenciesListApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CryptoCurrenciesList',
      theme: darkTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(GetIt.I<Talker>()),
        ],
      ),
    );
  }

}
