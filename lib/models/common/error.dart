/// A [PeekanappError] is an error that is thrown when the API returns an
/// erroneous response. It is also the model that's used in the `errors` field
/// of the [PeekanappAllResponseData] model.
class PeekanappError {
  /// The code of the error. See the Peek-An-App documentation for a list of
  /// possible error codes.
  final String code;

  /// The HTTP status code associated with the error.
  final int statusCode;

  const PeekanappError(this.code, this.statusCode);

  /// A [PeekanappError] that occurs when the app could not be found in the
  /// Google Play Store.
  static const AppNotFoundPlayStore =
      PeekanappError('AppNotFoundPlayStore', 404);

  /// A [PeekanappError] that occurs when the app could not be found in the
  /// Apple App Store.
  static const AppNotFoundAppStore = PeekanappError('AppNotFoundAppStore', 404);

  /// A [PeekanappError] that occurs when the app data could not be parsed from
  /// the Google Play Store.
  static const ParseErrorPlayStore = PeekanappError('ParseErrorPlayStore', 500);

  /// A [PeekanappError] that occurs when the app data could not be parsed from
  /// the Apple App Store.
  static const ParseErrorAppStore = PeekanappError('ParseErrorAppStore', 500);

  /// A [PeekanappError] that is thrown on any other error.
  static const UnknownError = PeekanappError('UnknownError', 500);

  static const _values = [
    AppNotFoundPlayStore,
    AppNotFoundAppStore,
    ParseErrorPlayStore,
    ParseErrorAppStore,
    UnknownError,
  ];

  @override
  String toString() {
    switch (this) {
      case AppNotFoundPlayStore:
        return 'The provided app could not be found in the Google Play Store';
      case AppNotFoundAppStore:
        return 'The provided app could not be found in the Apple App Store';
      case ParseErrorPlayStore:
        return 'Failed to parse the Google Play Store response';
      case ParseErrorAppStore:
        return 'Failed to parse the Apple App Store response';
      default:
        return 'An unexpected error has occurred.';
    }
  }

  static PeekanappError fromJSON(Map<String, dynamic> json) {
    PeekanappError? error;

    for (var type in _values) {
      if (type.code == json['error']) {
        error = type;
        break;
      }
    }

    return error ?? UnknownError;
  }

  Map<String, dynamic> toJSON() {
    return {
      'error': code,
      'statusCode': statusCode,
    };
  }
}
