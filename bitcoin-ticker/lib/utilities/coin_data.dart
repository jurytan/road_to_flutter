import 'package:bitcoin_ticker/services/networking.dart';
import 'package:bitcoin_ticker/services/secret.dart';
import 'package:bitcoin_ticker/services/secret_loader.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  static final CoinData _singleton = new CoinData._internal();
  static const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';
  Map<String, Map<String, String>> currencyMapping;

  factory CoinData() {
    return _singleton;
  }

  CoinData._internal() {
    currencyMapping = Map<String, Map<String, String>>();
  }

  Future<dynamic> getCryptoPrices(String crypto) async {
    Secret secret =
        await SecretLoader(secretPath: 'coinapi_secrets.json').load();
    // String url = '$coinApiUrl/$crypto?invert=false&apikey=${secret.coinApiKey}';
    NetworkHelper networkHelper = NetworkHelper(
        '$coinApiUrl/$crypto?invert=false&apikey=${secret.coinApiKey}');

    var cryptoMap = await networkHelper.getData();
    return cryptoMap;
  }

  dynamic getAllCryptoPriceMap() async {
    for (String crypto in cryptoList) {
      // print('===================================');
      // print('crypto: $crypto');
      var cryptoMap = await getCryptoPrices(crypto);
      Map<String, String> tempCryptoMap = Map<String, String>();

      for (var temp in cryptoMap['rates']) {
        // print('currency = ${temp['asset_id_quote']} => ${temp['rate']}');
        tempCryptoMap['${temp['asset_id_quote']}'] =
            (temp['rate']).toStringAsFixed(4);
      }
      currencyMapping['$crypto'] = tempCryptoMap;
    }
    return currencyMapping;
  }

  double getCryptoPrice(String crypto, String convertTo) {
    return currencyMapping[crypto][convertTo] ?? 0.0;
  }
}
