import 'package:pixabay/pixabay.dart';

import '../secure/api_key.dart';

main() async {
  var client = new PixabayClient(APIKey.value);

  var search = await client.searchPhoto("pedro",
      language: SupportedLanguages.es, imgType: ImageTypes.illustration);

  for (var p in search.photos) {
    print(p.imageUrl);
  }
}
