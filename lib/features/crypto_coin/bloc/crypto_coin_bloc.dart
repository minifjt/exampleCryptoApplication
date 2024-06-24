import 'dart:async';

import 'package:crypto_flutter_application/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'crypto_coin_state.dart';
part 'crypto_coin_event.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc(this.coinsRepository) : super(CryptoCoinInitial()) {
    on<LoadCryptoCoinDetails>((event, emit) async {
      try {
        if (state is! CryptoCoinLoaded) {
          emit(CryptoCoinLoading());
        }
        final cryptoCoinDetails =
            await coinsRepository.getCoinDetails(event.currenceCode);
        emit(CryptoCoinLoaded(coin: cryptoCoinDetails));
      } catch (e) {
        emit(CryptoCoinLoadedFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
}
