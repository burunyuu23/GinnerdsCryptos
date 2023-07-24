import '../features/crypto_coin/view/crypto_coin_screen.dart';
import '../features/crypto_list/view/crypto_list_screen.dart';

final routes = {
  '/': (context) => const CryptoListScreen(title: 'Hi ginnerds!'),
  '/coin': (context) => const CryptoCoinScreen(),
};