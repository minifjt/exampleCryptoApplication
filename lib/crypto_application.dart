// ignore_for_file: unused_import

import 'package:crypto_flutter_application/router/router.dart';
import 'package:crypto_flutter_application/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// import 'package:talker_flutter/talker_flutter.dart';

class CryptoApplication extends StatefulWidget {
  const CryptoApplication({super.key});

  @override
  State<CryptoApplication> createState() => _CryptoApplicationState();
}

class _CryptoApplicationState extends State<CryptoApplication> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // navigatorObservers: [
      //   TalkerRouteObserver(GetIt.I<Talker>()), // сообщения о передвижениях
      // ],
      title: 'Flutter Demo',
      theme: darkTheme,
      routerConfig: _appRouter.config(),
      // routes: routes,
    );
  }
}
