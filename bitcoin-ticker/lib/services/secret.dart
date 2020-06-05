class Secret {
  Secret({this.coinApiKey = ''});

  final String coinApiKey;

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(coinApiKey: jsonMap["coinapi_api_key"]);
  }
}
