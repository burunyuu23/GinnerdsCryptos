import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:first_test_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:first_test_app/l10n/generated/app_localizations.dart';
import 'package:first_test_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../widgets/widgets.dart';

@RoutePage()
class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});


  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(
    GetIt.I<AbstractCoinsRepo>(),
  );

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context).hiGinnerds, textAlign: TextAlign.center),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator
                .of(context)
                .push(MaterialPageRoute(
                builder: (context) => TalkerScreen(talker: GetIt.I<Talker>())));
          }, icon: const Icon(Icons.document_scanner_outlined))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, i) {
                  final coin = state.coinsList[i];
                  return CryptoCoinTile(coin: coin);
                },
              );
            }
            if (state is CryptoListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).somethingWentWrong,
                      style: theme.textTheme.headlineMedium,
                    ),
                    Text(
                      AppLocalizations.of(context).tryAgainLater,
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        _cryptoListBloc.add(LoadCryptoList());
                      },
                      child: Text(AppLocalizations.of(context).tryAgainNow),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}