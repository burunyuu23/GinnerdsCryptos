
import 'package:first_test_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc(this.coinsRepository)
      : super(const CryptoCoinDetailsState()) {
    on<LoadCryptoCoinDetails>(_load);
  }

  final AbstractCoinsRepo coinsRepository;

  Future<void> _load(
    LoadCryptoCoinDetails event,
    Emitter<CryptoCoinDetailsState> emit,
  ) async {
    try {
      if (state is! CryptoCoinDetailsLoaded) {
        emit(const CryptoCoinDetailsLoading());
      }

      final coin =
          await coinsRepository.getCoinDetails(event.currencyCode);

      emit(CryptoCoinDetailsLoaded(coin));
    } catch (error, stackTrace) {
      emit(CryptoCoinDetailsLoadingFailure(error));
      GetIt.I<Talker>().handle(error, stackTrace);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
