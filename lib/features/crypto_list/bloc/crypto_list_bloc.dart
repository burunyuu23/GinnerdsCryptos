import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:first_test_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_list_event.dart';

part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepo) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final coinsList = await coinsRepo.getCoinsList();

        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (error, stackTrace) {
        emit(CryptoListLoadingFailure(exception: error));
        GetIt.I<Talker>().handle(error, stackTrace);
      }
      finally {
        event.completer?.complete();
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }

  final AbstractCoinsRepo coinsRepo;
}
