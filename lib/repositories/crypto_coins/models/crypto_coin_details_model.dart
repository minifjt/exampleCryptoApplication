// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails({
    required this.priceInUSD,
    required this.imageUrl,
    required this.high24hours,
    required this.low24hours,
  });

  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(1)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  @HiveField(2)
  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  @HiveField(3)
  @JsonKey(name: 'HIGH24HOUR')
  final double high24hours;

  @HiveField(4)
  @JsonKey(name: 'LOW24HOUR')
  final double low24hours;

  factory CryptoCoinDetails.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailsToJson(this);

  @override
  List<Object> get props {
    return [
      priceInUSD,
      imageUrl,
      high24hours,
      low24hours,
    ];
  }
}
