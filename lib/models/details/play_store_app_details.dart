import 'dart:core';

/// A [PlayStoreAppDetails] contains information about an app on the Google Play
/// Store.
class PlayStoreAppDetails {
  /// The URL of the app's page on the Google Play Store.
  final String url;

  /// The string identifier of the app.
  final String appId;

  /// The name of the app.
  final String title;

  /// The short description/summary of the app.
  final String summary;

  /// The description of the app.
  final String description;

  /// The description of the app in HTML format.
  final String descriptionHTML;

  /// The name of the app's developer.
  final String developer;

  /// The ID of the app's developer.
  final String? developerId;

  /// The internal ID of the app's developer.
  final String? developerInternalId;

  /// The email address of the app's developer.
  final String? developerEmail;

  /// The website of the app's developer.
  final String? developerWebsite;

  /// The physical address of the app's developer.
  final String? developerAddress;

  /// The icon of the app.
  final String icon;

  /// The score of the app.
  final num score;

  /// The score of the app in string format.
  final String scoreText;

  /// The price of the app. 0 if free.
  final num price;

  /// The price of the app in string format.
  final String priceText;

  /// The currency of the app's price.
  final String currency;

  /// Whether the app is free to download.
  final bool free;

  /// The number of installs the app has received (approximation).
  final String installs;

  /// The minimum number of installs from the [installs] approximation.
  final num minInstalls;

  /// The maximum number of installs from the [installs] approximation.
  final num maxInstalls;

  /// The number of ratings the app has received.
  final num? ratings;

  /// The number of reviews the app has received.
  final num? reviews;

  /// A historgram containing the number of 1-5 star ratings of the app.
  final Map<String, num>? histogram;

  /// Whether the app is available to download.
  final bool available;

  /// Whether the app offers in-app purchases.
  final bool offersIAP;

  /// The range of the in-app purchases contained within the app.
  final String? IAPRange;

  /// The size of the app.
  final String? size;

  /// The minimum version of Android that is required to install the app.
  final String androidVersion;

  /// The minimum version of Android that is required to install the app in
  /// string format.
  final String androidVersionText;

  /// The genre of the app.
  final String genre;

  /// The genre ID of the app.
  final String genreId;

  /// The family genre of the app.
  final String? familyGenre;

  /// The family genre ID of the app.
  final String? familyGenreId;

  /// The header image of the app.
  final String? headerImage;

  /// A list of screenshots of the app.
  final List<String>? screenshots;

  /// A video URL, if the app's page contains a video.
  final String? video;

  /// A URL to the video's thumbnail, if any.
  final String? videoImage;

  /// The app's content rating.
  final String contentRating;

  /// The description of the app's content rating.
  final String? contentRatingDescription;

  /// Whether the app contains ads.
  final bool adSupported;

  /// The app's release date in string format (e.g. Mar 14, 2022).
  final String released;

  /// A UNIX timestamp of the app's last update date.
  final num updated;

  /// The last version of the app.
  final String version;

  /// The recent changes that have been made to the app.
  final String? recentChanges;

  /// A list of comments that have been left on the app.
  final List<String>? comments;

  /// The privacy policy URL of the app.
  final String? privacyPolicy;

  PlayStoreAppDetails({
    required this.url,
    required this.appId,
    required this.title,
    required this.summary,
    required this.description,
    required this.descriptionHTML,
    required this.developer,
    required this.developerId,
    required this.developerInternalId,
    required this.developerEmail,
    required this.developerWebsite,
    required this.developerAddress,
    required this.icon,
    required this.score,
    required this.scoreText,
    required this.price,
    required this.priceText,
    required this.currency,
    required this.free,
    required this.installs,
    required this.minInstalls,
    required this.maxInstalls,
    required this.ratings,
    required this.reviews,
    required this.histogram,
    required this.available,
    required this.offersIAP,
    required this.IAPRange,
    required this.size,
    required this.androidVersion,
    required this.androidVersionText,
    required this.genre,
    required this.genreId,
    required this.familyGenre,
    required this.familyGenreId,
    required this.headerImage,
    required this.screenshots,
    required this.video,
    required this.videoImage,
    required this.contentRating,
    required this.contentRatingDescription,
    required this.adSupported,
    required this.released,
    required this.updated,
    required this.version,
    required this.recentChanges,
    required this.comments,
    required this.privacyPolicy,
  });

  factory PlayStoreAppDetails.fromJSON(Map<String, dynamic> json) {
    return PlayStoreAppDetails(
      url: json['url'] as String,
      appId: json['appId'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      description: json['description'] as String,
      descriptionHTML: json['descriptionHTML'] as String,
      developer: json['developer'] as String,
      developerId: json['developerId'] as String?,
      developerInternalId: json['developerInternalId'] as String?,
      developerEmail: json['developerEmail'] as String?,
      developerWebsite: json['developerWebsite'] as String?,
      developerAddress: json['developerAddress'] as String?,
      icon: json['icon'] as String,
      score: json['score'] as num,
      scoreText: json['scoreText'] as String,
      price: json['price'] as num,
      priceText: json['priceText'] as String,
      currency: json['currency'] as String,
      free: json['free'] as bool,
      installs: json['installs'] as String,
      minInstalls: json['minInstalls'] as num,
      maxInstalls: json['maxInstalls'] as num,
      ratings: json['ratings'] as num?,
      reviews: json['reviews'] as num?,
      histogram: _deserializeHistogram(json['histogram']),
      available: json['available'] as bool,
      offersIAP: json['offersIAP'] as bool,
      IAPRange: json['IAPRange'] as String?,
      size: json['size'] as String?,
      androidVersion: json['androidVersion'] as String,
      androidVersionText: json['androidVersionText'] as String,
      genre: json['genre'] as String,
      genreId: json['genreId'] as String,
      familyGenre: json['familyGenre'] as String?,
      familyGenreId: json['familyGenreId'] as String?,
      headerImage: json['headerImage'] as String,
      screenshots: (json['screenshots'] as List<dynamic>?)?.cast<String>(),
      video: json['video'] as String?,
      videoImage: json['videoImage'] as String?,
      contentRating: json['contentRating'] as String,
      contentRatingDescription: json['contentRatingDescription'] as String?,
      adSupported: json['adSupported'] as bool,
      released: json['released'] as String,
      updated: json['updated'] as num,
      version: json['version'] as String,
      recentChanges: json['recentChanges'] as String,
      comments: (json['comments'] as List<dynamic>?)?.cast<String>(),
      privacyPolicy: json['privacyPolicy'] as String?,
    );
  }

  static Map<String, num>? _deserializeHistogram(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    Map<String, num> result = {};
    json.forEach((key, value) {
      result[key] = value as num;
    });
    return result;
  }

  Map<String, dynamic> toJSON() {
    return {
      'url': url,
      'appId': appId,
      'title': title,
      'summary': summary,
      'description': description,
      'descriptionHTML': descriptionHTML,
      'developer': developer,
      'developerId': developerId,
      'developerInternalId': developerInternalId,
      'developerEmail': developerEmail,
      'developerWebsite': developerWebsite,
      'developerAddress': developerAddress,
      'icon': icon,
      'score': score,
      'scoreText': scoreText,
      'price': price,
      'priceText': priceText,
      'currency': currency,
      'free': free,
      'installs': installs,
      'minInstalls': minInstalls,
      'maxInstalls': maxInstalls,
      'ratings': ratings,
      'reviews': reviews,
      'histogram': histogram,
      'available': available,
      'offersIAP': offersIAP,
      'IAPRange': IAPRange,
      'size': size,
      'androidVersion': androidVersion,
      'androidVersionText': androidVersionText,
      'genre': genre,
      'genreId': genreId,
      'familyGenre': familyGenre,
      'familyGenreId': familyGenreId,
      'headerImage': headerImage,
      'screenshots': screenshots,
      'video': video,
      'videoImage': videoImage,
      'contentRating': contentRating,
      'contentRatingDescription': contentRatingDescription,
      'adSupported': adSupported,
      'released': released,
      'updated': updated,
      'version': version,
      'recentChanges': recentChanges,
      'comments': comments,
      'privacyPolicy': privacyPolicy,
    };
  }
}
