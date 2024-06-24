import 'package:crypto_flutter_application/repositories/crypto_coins/models/models.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoin> getCoinDetails(String currencyCode);
}
