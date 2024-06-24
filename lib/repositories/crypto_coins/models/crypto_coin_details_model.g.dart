// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailsAdapter extends TypeAdapter<CryptoCoinDetails> {
  @override
  final int typeId = 1;

  @override
  CryptoCoinDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetails(
      priceInUSD: fields[0] as double,
      imageUrl: fields[1] as String,
      high24hours: fields[3] as double,
      low24hours: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetails obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.priceInUSD)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.high24hours)
      ..writeByte(4)
      ..write(obj.low24hours)
      ..writeByte(2)
      ..write(obj.fullImageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetails _$CryptoCoinDetailsFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetails(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      high24hours: (json['HIGH24HOUR'] as num).toDouble(),
      low24hours: (json['LOW24HOUR'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoCoinDetailsToJson(CryptoCoinDetails instance) =>
    <String, dynamic>{
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageUrl,
      'HIGH24HOUR': instance.high24hours,
      'LOW24HOUR': instance.low24hours,
    };
