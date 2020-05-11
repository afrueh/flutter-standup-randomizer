import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Secret {
  final String flickr_apiKey;

  Secret({this.flickr_apiKey = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(flickr_apiKey: jsonMap["flickr_api_key"]);
  }
}

class SecretLoader {
  final String secretPath;

  static Secret _secret;

  const SecretLoader({
    this.secretPath = 'assets/secrets.json',
  });

  Future<Secret> load() async {
    if (_secret != null) {
      return _secret;
    }
    _secret = await rootBundle.loadStructuredData<Secret>(secretPath,
        (jsonStr) async {
      final secret = Secret.fromJson(json.decode(jsonStr));
      return secret;
    });
    return _secret;
  }
}
