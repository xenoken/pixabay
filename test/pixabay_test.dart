import 'package:pixabay/pixabay.dart';
import 'package:test/test.dart';

import '../secure/api_key.dart';

void main() {
  group('Pixabay Tests', () {
    PixabayClient client;

    setUp(() {
      client = PixabayClient(APIKey.value);
    });

    test('photo', () async {
      String id;
      id = '4285275';
      var result = await client.getPhoto(id);
      equals((result != null) == true);
    });

    test('photo-search', () async {
      String query;
      query = 'banana';
      var result = await client.searchPhoto(query);
      equals((result != null) == true);
    });

    test('video', () async {
      String id;
      id = '1019';
      var result = await client.getVideo(id);
      equals((result != null) == true);
    });

    test('video-search', () async {
      String query;
      query = 'banana';
      var result = await client.searchVideos(query);
      equals((result != null) == true);
    });

    test('quota', () async {
      var result = await client.getQuota();
      equals((result != null) == true);
    });
  });
}
