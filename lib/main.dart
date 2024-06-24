import 'package:crypto_flutter_application/crypto_application.dart';
import 'package:crypto_flutter_application/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CryptoCoinAdapter());
  Hive.registerAdapter(CryptoCoinDetailsAdapter());

  const cryptoCoinsBoxName = 'crypto_coions_box';

  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);

  //GetIt.I.registerSingleton(CryptoCoinsRepository(dio: Dio())); // создается тут
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() =>
      CryptoCoinsRepository(
          dio: Dio(),
          cryptoCoinsBox: cryptoCoinsBox)); // создается в момент вызова
  runApp(const CryptoApplication());
}
