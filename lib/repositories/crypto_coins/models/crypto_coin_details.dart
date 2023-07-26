

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@JsonSerializable()
class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail({
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.high24Hours,
    required this.low24Hours,
  });

  @JsonKey(name: 'PRICE')
  final double priceInUSD;
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;
  @JsonKey(name: 'LASTUPDATE', toJson: _dateTimeToJson, fromJson: _dateTimeFromJson)
  final DateTime lastUpdate;
  @JsonKey(name: 'HIGH24HOUR')
  final double high24Hours;
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  String get fullNameImageUrl => 'https://www.cryptocompare.com/$imageUrl';


  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) => _$CryptoCoinDetailFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;
  static DateTime _dateTimeFromJson(int time) => DateTime.fromMicrosecondsSinceEpoch(time);

  @override
  List<Object> get props => [
      priceInUSD,
      imageUrl,
      toSymbol,
      lastUpdate,
      high24Hours,
      low24Hours,
    ];
}
