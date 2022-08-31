/// An [AppVersionMetadata] contains convenient information about the app in a
/// version request.
class AppVersionMetadata {
  /// The URL of the app on the Google Play Store.
  final String? playstoreUrl;

  /// The URL of the app on the Apple App Store.
  final String? appstoreUrl;

  AppVersionMetadata({
    this.playstoreUrl,
    this.appstoreUrl,
  });

  factory AppVersionMetadata.fromJSON(Map<String, dynamic> json) {
    return AppVersionMetadata(
      playstoreUrl: json['playstoreUrl'] as String?,
      appstoreUrl: json['appstoreUrl'] as String?,
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'playstoreUrl': playstoreUrl,
      'appstoreUrl': appstoreUrl,
    };
  }
}
