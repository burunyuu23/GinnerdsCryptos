class CryptoCoin {
  const CryptoCoin({
    required this.priceInUSD,
    required this.name,
    required this.imageUrl
  });
  final String name;
  final double priceInUSD;
  final String imageUrl;
}