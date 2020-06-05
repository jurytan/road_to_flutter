import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/utilities/coin_data.dart';
import 'price_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getCoinData() async {
    var cryptoPrices = await CoinData().getAllCryptoPriceMap();

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PriceScreen(
                  cryptoMap: cryptoPrices,
                )));
  }

  @override
  void initState() {
    super.initState();
    getCoinData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
