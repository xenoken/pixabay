A library for Dart developers.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

```dart
import 'package:pixabay/pixabay.dart';

main() async{
  var client = new PixabayClient(APIKey.value);
  
    var search = await client.searchPhoto("aurora",
        language: SupportedLanguages.en, imgType: ImageTypes.photo);
  
    for (var p in search.photos) {
      print(p.imageUrl);
    }
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
