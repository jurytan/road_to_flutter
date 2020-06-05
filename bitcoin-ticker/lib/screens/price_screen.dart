import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoin_ticker/utilities/coin_data.dart';
import 'package:bitcoin_ticker/widgets/crypto_card.dart';

class PriceScreen extends StatefulWidget {
  PriceScreen({this.cryptoMap});

  final cryptoMap;

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = 'USD';
  CoinData coinData;
  Map<String, String> selectedCurrencyPrices;
  List<Widget> cryptoCards;

  @override
  void initState() {
    super.initState();
    coinData = CoinData();
    updateUI();
  }

  void updateUI() {
    setState(() {
      cryptoCards = getCryptoCards(widget.cryptoMap);
    });
  }

  List<Widget> getCryptoCards(dynamic cryptoMap) {
    return cryptoList
        .map((String crypto) => CryptoCard(
            cryptoCurrency: crypto,
            targetCurrency: currency,
            price: cryptoMap['$crypto']['$currency'] ?? 0.0))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;

    CupertinoPicker iOSPicker() {
      return CupertinoPicker(
        itemExtent: 32.0,
        backgroundColor: Colors.lightBlue,
        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            currency = currenciesList[selectedIndex];
            updateUI();
          });
        },
        children: currenciesList.map<Text>((String value) {
          return Text(
            value,
            style: TextStyle(
              color: Colors.white,
            ),
          );
        }).toList(),
      );
    }

    DropdownButton<String> androidDropdown() {
      return DropdownButton<String>(
        value: currency,
        items: currenciesList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: ((String value) {
          setState(() {
            currency = value;
            updateUI();
          });
        }),
      );
    }

    /// This makes no sense for two platforms, but it will when we extend it
    ///  to work for other platforms like desktop and web.
    Widget getPicker() {
      switch (platform) {
        case TargetPlatform.iOS:
          return iOSPicker();
        case TargetPlatform.android:
        default:
          return androidDropdown();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cryptoCards,
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          )
        ],
      ),
    );
  }
}
