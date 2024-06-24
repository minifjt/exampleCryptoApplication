import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:crypto_flutter_application/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:crypto_flutter_application/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  final _cryptoCoinBloc = CryptoCoinDetailsBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    _cryptoCoinBloc.add(LoadCryptoCoinDetails(currenceCode: widget.coin.name));
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   final args = ModalRoute.of(context)?.settings.arguments;

  //   //assert(args != null && args is String, 'You must provide non-null String args'); // красный экран с сообщением об ошибке

  //   if (args == null) {
  //     log('You must provide args');
  //     return;
  //   }
  //   if (args is! String) {
  //     log('You must provide String args');
  //     return;
  //   }
  //   coinName = args;
  //   _cryptoCoinBloc.add(LoadCryptoCoinDetails(currenceCode: coinName!));
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final completer = Completer();
              _cryptoCoinBloc.add(LoadCryptoCoinDetails(
                  completer: completer, currenceCode: widget.coin.name));
              return completer.future;
            },
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
        iconTheme: theme.appBarTheme.iconTheme,
        title: Text(widget.coin.name),
      ),
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
        bloc: _cryptoCoinBloc,
        builder: (context, state) {
          if (state is CryptoCoinLoaded) {
            final coin = state.coin;
            final coinDetails = coin.details;
            return Center(
              child: Column(
                children: [
                  Image.network(
                    coinDetails.fullImageUrl,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: 55,
                    width: 250,
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Center(
                      child: Text(
                        '${coinDetails.priceInUSD.toStringAsFixed(10)} \$',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Column(
                            children: [
                              Text('High 24 hours'),
                              Text('Low 24 hours'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '${coinDetails.high24hours.toStringAsFixed(6)} \$',
                              ),
                              Text(
                                '${coinDetails.low24hours.toStringAsFixed(6)} \$',
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          if (state is CryptoCoinLoadedFailure) {
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
                      _cryptoCoinBloc
                          .add(LoadCryptoCoinDetails(currenceCode: coinName!));
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
    );
  }
}
