part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinDetailsEvent extends Equatable {}

class LoadCryptoCoinDetails extends CryptoCoinDetailsEvent {
  LoadCryptoCoinDetails({
    this.completer,
    required this.currenceCode,
  });
  final Completer? completer;
  final String currenceCode;

  @override
  List<Object?> get props => [completer, currenceCode];
}
