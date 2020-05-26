class Secret {
  Secret({this.owmApiKey = ''});

  final String owmApiKey;

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(owmApiKey: jsonMap["owm_api_key"]);
  }
}
