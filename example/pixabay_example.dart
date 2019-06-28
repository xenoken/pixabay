import 'package:pixabay/pixabay.dart';

import '../secure/api_key.dart';

main() async {
  var client = PixabayClient(APIKey.value);

  var search = await client.searchPhoto("aurora",
      language: SupportedLanguages.en, imgType: ImageTypes.photo);

  for (var p in search.photos) {
    print(p.imageUrl);
  }
}
