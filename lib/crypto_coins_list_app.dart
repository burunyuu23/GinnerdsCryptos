import 'package:first_test_app/router/router.dart';
import 'package:first_test_app/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCurrenciesList extends StatelessWidget {
  const CryptoCurrenciesList({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesList',
      theme: darkTheme,
      routes: routes,
    );
  }
}
