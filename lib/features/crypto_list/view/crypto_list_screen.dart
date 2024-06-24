import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_flutter_application/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_flutter_application/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_flutter_application/repositories/crypto_coins/crypto_coins.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});
  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto application'),
      ),
      body: RefreshIndicator(
        color: Colors.yellow.shade200,
        backgroundColor: Colors.black26,
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final coin = state.coinsList[index];
                  return CryptoCoinTile(coin: coin);
                },
              );
            }
            if (state is CryptoListLoadedFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Something went wrong',
                      style: TextStyle(color: Colors.white),
                    ),
                    const Text(
                      'Please try again later',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        _cryptoListBloc.add(LoadCryptoList());
                      },
                      child: const Text(
                        'Try again',
                        style: TextStyle(color: Colors.yellow),
                      ),
                    )
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.yellow.shade200,
              ),
            );
          },
        ),
      ),
    );
  }
}
