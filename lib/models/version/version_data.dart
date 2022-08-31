import 'package:peekanapp/models/common/error.dart';
import 'package:peekanapp/models/version/version_metadata.dart';

/// An [AppVersionData] contains information about the latest version of an app
/// on the Google Play Store and Apple App Store.
class AppVersionData {
  /// The latest version of the app on the Google Play Store. If the app data
  /// could not be fetched, this will be null.
  final String? playstore;

  /// The latest version of the app on the Apple App Store. If the app data
  /// could not be fetched, this will be null.
  final String? appstore;

  /// Metadata containing app store URLs to the apps for convenience.
  final AppVersionMetadata meta;

  /// A list of [PeekanappError] errors that occurred during the request.
  final List<PeekanappError> errors;

  AppVersionData({
    this.playstore,
    this.appstore,
    required this.meta,
    required this.errors,
  });

  factory AppVersionData.fromJSON(Map<String, dynamic> json) {
    final playstore = json['playstore'] as String?;
    final appstore = json['appstore'] as String?;
    final meta =
        AppVersionMetadata.fromJSON(json['meta'] as Map<String, dynamic>);
    final errors = (json['errors'] as List<dynamic>)
        .map((e) => PeekanappError.fromJSON(e as Map<String, dynamic>))
        .toList();

    return AppVersionData(
      playstore: playstore,
      appstore: appstore,
      meta: meta,
      errors: errors,
    );
  }

  /// Returns true if the response contains errors.
  bool get isErrored => errors.isNotEmpty;

  Map<String, dynamic> toJSON() {
    return {
      'playstore': playstore,
      'appstore': appstore,
      'meta': meta.toJSON(),
      'errors': errors.map((e) => e.toJSON()).toList(),
    };
  }
}
