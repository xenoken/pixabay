Unofficial Pixabay REST API for Dart


## Usage

A simple usage example:

```dart
import 'package:pixabay/pixabay.dart';

main() async{
  var client = new PixabayClient(APIKey.value);
  
    var searchResult = await client.searchPhoto("aurora",
        language: SupportedLanguages.en, imgType: ImageTypes.photo);
  
    for (var p in searchResult.photos) {
      print(p.imageUrl);
    }
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/xenoken/pixabay/issues
