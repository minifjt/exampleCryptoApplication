part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinDetailsState extends Equatable {}

class CryptoCoinInitial extends CryptoCoinDetailsState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoading extends CryptoCoinDetailsState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoaded extends CryptoCoinDetailsState {
  CryptoCoinLoaded({
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  List<Object?> get props => [coin];
}

class CryptoCoinLoadedFailure extends CryptoCoinDetailsState {
  CryptoCoinLoadedFailure({
    required this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
