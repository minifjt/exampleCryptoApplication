import 'package:auto_route/auto_route.dart';
import 'package:crypto_flutter_application/repositories/crypto_coins/models/models.dart';
import 'package:crypto_flutter_application/router/router.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetails = coin.details;
    return ListTile(
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinRoute(coin: coin));

        // Navigator.pushNamed(context, '/coin', arguments: coin.name);

        //Navigator.of(context).pushNamed('/coin'); // то же самое
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CryptoCoinScreen())); // длинный метод
      },
      trailing: const Icon(Icons.arrow_forward_ios),
      //leading: Image.asset('assets/bitcoin-logo.png', height: 30, width: 30),
      leading: Image.network(
        coinDetails.fullImageUrl,
        height: 50,
        width: 50,
      ),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coinDetails.priceInUSD.toStringAsFixed(6)}\$',
          style: theme.textTheme.labelSmall),
    );
  }
}
