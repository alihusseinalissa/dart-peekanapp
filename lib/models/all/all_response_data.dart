import 'package:peekanapp/models/details/app_store_app_details.dart';
import 'package:peekanapp/models/details/play_store_app_details.dart';
import 'package:peekanapp/models/common/error.dart';

/// A [PeekanappAllResponseData] is an object that contains informations about
/// an Android app and an iOS app from the respective stores. It also contains a
/// list of [PeekanappError]s, if there are any.
class PeekanappAllResponseData {
  /// Details of the app on the Play Store (see [PlayStoreAppDetails]). If the
  /// app data could not be fetched, this will be null.
  final PlayStoreAppDetails? playStoreAppDetails;

  /// Details of the app on the App Store (see [AppStoreAppDetails]). If the
  /// app data could not be fetched, this will be null.
  final AppStoreAppDetails? appStoreAppDetails;

  /// A list of [PeekanappError] errors that occurred during the request.
  final List<PeekanappError> errors;

  PeekanappAllResponseData({
    this.playStoreAppDetails,
    this.appStoreAppDetails,
    required this.errors,
  });

  factory PeekanappAllResponseData.fromJSON(Map<String, dynamic> json) {
    final playStoreAppDetails = json['playstore'] != null
        ? PlayStoreAppDetails.fromJSON(json['playstore'])
        : null;
    final appStoreAppDetails = json['appstore'] != null
        ? AppStoreAppDetails.fromJSON(json['appstore'])
        : null;
    final errors = (json['errors'] as List<dynamic>)
        .map((e) => PeekanappError.fromJSON(e as Map<String, dynamic>))
        .toList();

    return PeekanappAllResponseData(
      playStoreAppDetails: playStoreAppDetails,
      appStoreAppDetails: appStoreAppDetails,
      errors: errors,
    );
  }

  /// Returns true if the response contains errors.
  bool get isErrored => errors.isNotEmpty;

  Map<String, dynamic> toJSON() {
    return {
      'playstore': playStoreAppDetails?.toJSON(),
      'appstore': appStoreAppDetails?.toJSON(),
      'errors': errors.map((e) => e.toJSON()).toList(),
    };
  }
}
