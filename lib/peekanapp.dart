library peekanapp;

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:peekanapp/models/all/all_response_data.dart';
import 'package:peekanapp/models/common/error.dart';
import 'package:peekanapp/models/details/app_store_app_details.dart';
import 'package:peekanapp/models/details/play_store_app_details.dart';
import 'package:peekanapp/models/version/version_data.dart';

/// A [PeekanappClient] is a wrapper around the Peek-An-App API. It allows you
/// to easily fetch information about a given app on the Google Play Store and
/// Apple App Store.
class PeekanappClient {
  late String _apiUrl;

  static const String _PLAY_STORE_URL = '/api/playstore';
  static const String _APP_STORE_URL = '/api/appstore';
  static const String _ALL_URL = '/api/all';
  static const String _VERSION_URL = '/api/version';

  PeekanappClient() {
    this._apiUrl = 'https://peekanapp.vercel.app/';
  }

  /// Factory method that creates a client with a custom API URL.
  factory PeekanappClient.withApiUrl(String apiUrl) {
    return PeekanappClient().._apiUrl = apiUrl;
  }

  /// Fetches information about an app on the Google Play Store.
  Future<PlayStoreAppDetails> getPlayStoreAppDetails(
      {required String appId}) async {
    final response = await _fetch(_PLAY_STORE_URL, {'appId': appId});
    return PlayStoreAppDetails.fromJSON(response);
  }

  /// Fetches information about an app on the Apple App Store.
  Future<AppStoreAppDetails> getAppStoreAppDetails(
      {required String appId}) async {
    final response = await _fetch(_APP_STORE_URL, {'appId': appId});
    return AppStoreAppDetails.fromJSON(response);
  }

  /// Fetches information about an app on both the Google Play Store and the
  /// Apple App Store. The IDs of the apps are not required to be the same and
  /// either of them can be omitted. If the `strict` parameter is provided, the
  /// method will throw an exception if an error occurs while fetching data from
  /// either of the app stores.
  Future<PeekanappAllResponseData> getAppDetails(
      {String? androidAppId, String? iOSAppId, bool strict = false}) async {
    final response = await _fetch(
        _ALL_URL, {'androidAppId': androidAppId, 'iOSAppId': iOSAppId});
    final data = PeekanappAllResponseData.fromJSON(response);

    if (strict && data.isErrored) {
      throw data.errors.first;
    }

    return data;
  }

  /// Fetches the latest version of the app on the Google Play Store and the
  /// Apple App Store. The IDs of the apps are not required to be the same and
  /// either of them can be omitted. If the `strict` parameter is provided, the
  /// method will throw an exception if an error occurs while fetching data from
  /// either of the app stores.
  Future<AppVersionData> getAppVersion(
      {String? androidAppId, String? iOSAppId, bool strict = false}) async {
    final response = await _fetch(
        _VERSION_URL, {'androidAppId': androidAppId, 'iOSAppId': iOSAppId});
    final data = AppVersionData.fromJSON(response);

    if (strict && data.isErrored) {
      throw data.errors.first;
    }

    return data;
  }

  Future<Map<String, dynamic>> _fetch(
      String path, Map<String, String?> params) async {
    final url = _makeUriWithQueryParams(_makeApiUrl(path), params);

    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      if (response.body.isNotEmpty) {
        final data = json.decode(response.body);
        print(data);
        throw PeekanappError.fromJSON({
          'error': data['error'],
          'statusCode': response.statusCode,
        });
      } else {
        throw PeekanappError('UnknownError', response.statusCode);
      }
    }
  }

  String _makeApiUrl(String url) {
    return '$_apiUrl$url';
  }

  Uri _makeUriWithQueryParams(String url, Map<String, String?> params) {
    Map<String, String> queryParams = {};

    params.forEach((key, value) {
      if (value != null) {
        queryParams[key] = value;
      }
    });

    final query = queryParams.entries
        .map((entry) => '${entry.key}=${entry.value}')
        .join('&');

    return Uri.parse('$url?$query');
  }
}
