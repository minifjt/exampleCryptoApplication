import 'dart:async';

import 'package:crypto_flutter_application/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_state.dart';
part 'crypto_list_event.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final cryptoCoinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: cryptoCoinsList));
      } catch (e) {
        emit(CryptoListLoadedFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
}
