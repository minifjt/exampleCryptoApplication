import 'package:auto_route/auto_route.dart';
import 'package:crypto_flutter_application/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_flutter_application/features/crypto_list/crypto_list.dart';
import 'package:crypto_flutter_application/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CryptoListRoute.page, path: '/'),
        AutoRoute(page: CryptoCoinRoute.page),
      ];
}

// final routes = {
//   '/': (context) => const CryptoListScreen(), // начальный route
//   //'/coins-list': (context) => const CryptoListScreen(),
//   '/coin': (context) => const CryptoCoinScreen(),
// };

//initialRoute: '/coins-list', // переопределили начальный route
//home: const CryptoListScreen(), // либо Home либо начальные route
