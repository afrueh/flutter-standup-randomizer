import 'package:standup_randomizer/api/secrets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'flickr_models.dart';

class FlickrApi {
  final SecretLoader secretLoader;

  const FlickrApi({this.secretLoader = const SecretLoader()});

  Future<FlickrPhotoInfo> getFlickrInfo({String id}) async {
    var query = {
      'method': 'flickr.photos.getInfo',
      'photo_id': '$id',
    };

    final uri = await _flickrUri(query);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return FlickrPhotoInfo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Photo Info');
    }
  }

  Future<FlickrPhotos> getFlickrInterestingList({
    int imagesPerPage,
    int page,
  }) async {
    var query = {
      'method': 'flickr.interestingness.getList',
      'per_page': '$imagesPerPage',
      'page': '$page',
    };

    final uri = await _flickrUri(query);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return FlickrPhotos.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Interesting List');
    }
  }

  Future<FlickrPhotoSizes> getFlickrPhotoSizes({String id}) async {
    var query = {
      'method': 'flickr.photos.getSizes',
      'photo_id': '$id',
    };
    final uri = await _flickrUri(query);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return FlickrPhotoSizes.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Photo Sizes');
    }
  }

  Future<Uri> _flickrUri(Map<String, String> queryParameters) async {
    final apiKey = await _apiKey();
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('FlickR API Key is null');
    }

    var parameters = {
      'api_key': '$apiKey',
      'format': 'json',
      'nojsoncallback': '1',
    };
    parameters.addAll(queryParameters);
    return Uri.https('api.flickr.com', '/services/rest', parameters);
  }

  Future<String> _apiKey() async {
    try {
      final secret = await secretLoader.load();
      return secret.flickr_apiKey;
    } catch (exception) {
      print(exception);
      return "";
    }
  }
}
