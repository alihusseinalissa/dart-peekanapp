import 'dart:core';

/// An [AppStoreAppDetails] contains information about an app in the Apple App
/// Store.
class AppStoreAppDetails {
  /// The numerical ID of the app on the App Store.
  final num id;

  /// The string identifier of the app (i.e. "com.example.app").
  final String appId;

  /// The name of the app.
  final String title;

  /// The App Store URL of the app.
  final String url;

  /// The description of the app.
  final String description;

  /// A URL to the icon of the app. The highest quality image is used for this.
  final String icon;

  /// A list of genres the app belongs to.
  final List<String> genres;

  /// A list of genre IDs the app belongs to.
  final List<String> genreIds;

  /// The primary genre of the app.
  final String primaryGenre;

  /// The ID of the primary genre of the app.
  final num primaryGenreId;

  /// The content rating of the app.
  final String contentRating;

  /// A list of languages that the app supports.
  final List<String> languages;

  /// The size of the app in bytes.
  final String size;

  /// The minimum required OS version.
  final String requiredOsVersion;

  /// The release date of the app.
  final DateTime released;

  /// The date of the last update of the app.
  final DateTime updated;

  /// The app's release notes.
  final String releaseNotes;

  /// The app's current version.
  final String version;

  /// The price of the app. 0 if it's free.
  final num price;

  /// The currency of the app's price.
  final String currency;

  /// Whether the app is free to download.
  final bool free;

  /// The numeric identifier of the app's developer.
  final num developerId;

  /// The name of the app's developer.
  final String developer;

  /// The developer's URL on the Apple App Store.
  final String developerUrl;

  /// The URL of the developer's website.
  final String developerWebsite;

  /// The app's score.
  final num score;

  /// The number of reviews the app has received.
  final num reviews;

  /// The score of the app's latest version.
  final num currentVersionScore;

  /// The number of reviews the app's current version has received.
  final num currentVersionReviews;

  /// A list of screenshot URLs.
  final List<String> screenshots;

  /// A list of iPad screenshot URLs.
  final List<String> ipadScreenshots;

  /// A list of Apple TV screenshot URLs.
  final List<String> appletvScreenshots;

  /// A list of supported devices.
  final List<String> supportedDevices;

  AppStoreAppDetails({
    required this.id,
    required this.appId,
    required this.title,
    required this.url,
    required this.description,
    required this.icon,
    required this.genres,
    required this.genreIds,
    required this.primaryGenre,
    required this.primaryGenreId,
    required this.contentRating,
    required this.languages,
    required this.size,
    required this.requiredOsVersion,
    required this.released,
    required this.updated,
    required this.releaseNotes,
    required this.version,
    required this.price,
    required this.currency,
    required this.free,
    required this.developerId,
    required this.developer,
    required this.developerUrl,
    required this.developerWebsite,
    required this.score,
    required this.reviews,
    required this.currentVersionScore,
    required this.currentVersionReviews,
    required this.screenshots,
    required this.ipadScreenshots,
    required this.appletvScreenshots,
    required this.supportedDevices,
  });

  factory AppStoreAppDetails.fromJSON(Map<String, dynamic> json) {
    return AppStoreAppDetails(
      id: json['id'] as num,
      appId: json['appId'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      genres: (json['genres'] as List<dynamic>).cast<String>(),
      genreIds: (json['genreIds'] as List<dynamic>).cast<String>(),
      primaryGenre: json['primaryGenre'] as String,
      primaryGenreId: json['primaryGenreId'] as num,
      contentRating: json['contentRating'] as String,
      languages: (json['languages'] as List<dynamic>).cast<String>(),
      size: json['size'] as String,
      requiredOsVersion: json['requiredOsVersion'] as String,
      released: DateTime.parse(json['released'] as String),
      updated: DateTime.parse(json['updated'] as String),
      releaseNotes: json['releaseNotes'] as String,
      version: json['version'] as String,
      price: json['price'] as num,
      currency: json['currency'] as String,
      free: json['free'] as bool,
      developerId: json['developerId'] as num,
      developer: json['developer'] as String,
      developerUrl: json['developerUrl'] as String,
      developerWebsite: json['developerWebsite'] as String,
      score: json['score'] as num,
      reviews: json['reviews'] as num,
      currentVersionScore: json['currentVersionScore'] as num,
      currentVersionReviews: json['currentVersionReviews'] as num,
      screenshots: (json['screenshots'] as List<dynamic>).cast<String>(),
      ipadScreenshots:
          (json['ipadScreenshots'] as List<dynamic>).cast<String>(),
      appletvScreenshots:
          (json['appletvScreenshots'] as List<dynamic>).cast<String>(),
      supportedDevices:
          (json['supportedDevices'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'appId': appId,
      'title': title,
      'url': url,
      'description': description,
      'icon': icon,
      'genres': genres,
      'genreIds': genreIds,
      'primaryGenre': primaryGenre,
      'primaryGenreId': primaryGenreId,
      'contentRating': contentRating,
      'languages': languages,
      'size': size,
      'requiredOsVersion': requiredOsVersion,
      'released': released.toIso8601String(),
      'updated': updated.toIso8601String(),
      'releaseNotes': releaseNotes,
      'version': version,
      'price': price,
      'currency': currency,
      'free': free,
      'developerId': developerId,
      'developer': developer,
      'developerUrl': developerUrl,
      'developerWebsite': developerWebsite,
      'score': score,
      'reviews': reviews,
      'currentVersionScore': currentVersionScore,
      'currentVersionReviews': currentVersionReviews,
      'screenshots': screenshots,
      'ipadScreenshots': ipadScreenshots,
      'appletvScreenshots': appletvScreenshots,
      'supportedDevices': supportedDevices,
    };
  }
}
