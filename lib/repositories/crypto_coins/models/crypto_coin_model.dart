import 'package:crypto_flutter_application/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin_model.g.dart';

@HiveType(typeId: 2)
class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.details,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinDetails details;

  @override
  List<Object> get props => [name, details];
}
