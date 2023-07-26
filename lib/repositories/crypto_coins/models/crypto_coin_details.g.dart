// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailAdapter extends TypeAdapter<CryptoCoinDetail> {
  @override
  final int typeId = 2;

  @override
  CryptoCoinDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetail(
      priceInUSD: fields[1] as double,
      imageUrl: fields[2] as String,
      toSymbol: fields[0] as String,
      lastUpdate: fields[3] as DateTime,
      high24Hours: fields[4] as double,
      low24Hours: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetail obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.toSymbol)
      ..writeByte(1)
      ..write(obj.priceInUSD)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.lastUpdate)
      ..writeByte(4)
      ..write(obj.high24Hours)
      ..writeByte(5)
      ..write(obj.low24Hours);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetail _$CryptoCoinDetailFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetail(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate: CryptoCoinDetail._dateTimeFromJson(json['LASTUPDATE'] as int),
      high24Hours: (json['HIGH24HOUR'] as num).toDouble(),
      low24Hours: (json['LOW24HOUR'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoCoinDetailToJson(CryptoCoinDetail instance) =>
    <String, dynamic>{
      'TOSYMBOL': instance.toSymbol,
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageUrl,
      'LASTUPDATE': CryptoCoinDetail._dateTimeToJson(instance.lastUpdate),
      'HIGH24HOUR': instance.high24Hours,
      'LOW24HOUR': instance.low24Hours,
    };
