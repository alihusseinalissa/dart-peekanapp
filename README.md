# Peek-An-App Dart Client

A Dart library for fetching information about applications on the Google Play
Store and Apple App Store using [Peek-An-App][peekanapp-url].

## Usage

```dart
import 'package:peekanapp/peekanapp.dart';

// ...

PeekanappClient peekanapp = PeekanappClient();

// fetch information about an app on the Play Store
final info = peekanapp.getPlayStoreAppDetails(appId: 'com.example.app');

// fetch information about an app on the App Store
final info = peekanapp.getAppStoreAppDetails(appId: 'com.example.app');

// fetch information about an app on both app stores
final info = peekanapp.getAppDetails(androidAppId: 'com.example.app', iOSAppId: 'com.example.app');
```

You may also instnatiate a client with a custom API URL, if you're self-hosting
Peek-An-App.

```dart
import 'package:peekanapp/peekanapp.dart';

// ...

PeekanappClient peekanapp = PeekanappClient.withApiUrl('https://your.url.here');
```

For more information about the library APIs, please refer to the API reference
here: https://pub.dev/documentation/peekanapp/latest/

## License

MIT.

[peekanapp-url]: https://peekanapp.vercel.app
