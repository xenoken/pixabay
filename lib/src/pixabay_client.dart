import 'dart:convert';
import 'dart:io';

import 'pixabay_endpoints.dart';
import 'pixabay_enums.dart';
import 'pixabay_photo.dart';
import 'pixabay_photo_search_result.dart';
import 'pixabay_quota.dart';
import 'pixabay_video.dart';
import 'pixabay_video_search_result.dart';

class PixabayClient {
  static Quota _quota = Quota();
  final String apiKey;

  // constructor.
  PixabayClient(this.apiKey);

  Future<String> _getData(String url) async {
    HttpClient client = new HttpClient();
    var req = await client.getUrl(Uri.parse(url));
    // req.headers.add('Authorization', apiKey);
    var resp = await req.close();
    var data;
    if (resp.statusCode == 200) {
      data = await resp
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .single;

      // update quota.
      _quota = new Quota(
          remainingRequestsPerMonth:
              int.tryParse(resp.headers.value('X-Ratelimit-Remaining')),
          remainingSecondsBeforeReset:
              int.tryParse(resp.headers.value('X-Ratelimit-Reset')));
    }

    return data;
  }

  Future<Quota> getQuota() async => _quota;

  /// Search for a photo.
  ///
  /// [perPage] default : 20, min : 3, max : 200
  /// [id] A URL encoded search term. If omitted, all images are returned. This value may not exceed 100 characters. Example: "yellow+flower"
  /// [language] Language code of the language to be searched in.
  // Accepted values: cs, da, de, en, es, fr, id, it, hu, nl, no, pl, pt, ro, sk, fi, sv, tr, vi, th, bg, ru, el, ja, ko, zh
  // Default: "en"
  /// [imgType] Filter results by image type.
  //Accepted values: "all", "photo", "illustration", "vector"
  //Default: "all"
  Future<Photo> getPhoto(String id,
      {SupportedLanguages language = SupportedLanguages.en,
      ImageTypes imgType = ImageTypes.all,
      Orientations orientation = Orientations.all,
      Categories category = Categories.none,
      int minWidth = 0,
      int minHeight = 0,
      List<SupportedColors> colors,
      bool editorsChoice = false,
      bool safeSearch = false,
      Order order = Order.popular,
      perPage = 20,
      page = 1}) async {
    var url = Endpoints.photo(this.apiKey, id,
        language: language,
        imgType: imgType,
        orientation: orientation,
        category: category,
        minWidth: minWidth,
        minHeight: minHeight,
        colors: colors,
        editorsChoice: editorsChoice,
        safeSearch: safeSearch,
        order: order,
        perPage: perPage,
        page: page);

    String data = await _getData(url);

    if (data == null) {
      throw Exception("Invalid Data fetched.");
    }

    var result = PhotoSearchResult.fromJson(json.decode(data));

    if (result == null) return null;

    return result.photos.first;
  }

  /// Search for a photo.
  ///
  /// [perPage] default : 20, min : 3, max : 200
  ///
  /// [query] A URL encoded search term. If omitted, all images are returned. This value may not exceed 100 characters. Example: "yellow+flower"
  ///
  /// [language] Language code of the language to be searched in.
  // Accepted values: cs, da, de, en, es, fr, id, it, hu, nl, no, pl, pt, ro, sk, fi, sv, tr, vi, th, bg, ru, el, ja, ko, zh
  // Default: "en"
  ///
  /// [imgType] Filter results by image type.
  //Accepted values: "all", "photo", "illustration", "vector"
  //Default: "all"
  Future<PhotoSearchResult> searchPhoto(String query,
      {SupportedLanguages language = SupportedLanguages.en,
      ImageTypes imgType = ImageTypes.all,
      Orientations orientation = Orientations.all,
      Categories category = Categories.none,
      int minWidth = 0,
      int minHeight = 0,
      List<SupportedColors> colors,
      bool editorsChoice = false,
      bool safeSearch = false,
      Order order = Order.popular,
      perPage = 20,
      page = 1}) async {
    var url = Endpoints.photoSearch(this.apiKey,
        query: query,
        language: language,
        imgType: imgType,
        orientation: orientation,
        category: category,
        minWidth: minWidth,
        minHeight: minHeight,
        colors: colors,
        editorsChoice: editorsChoice,
        safeSearch: safeSearch,
        order: order,
        perPage: perPage,
        page: page);

    String data = await _getData(url);

    if (data == null) {
      throw Exception("Invalid Data fetched.");
    }

    return PhotoSearchResult.fromJson(json.decode(data));
  }

  // Video
  Future<Video> getVideo(String id,
      {SupportedLanguages language = SupportedLanguages.en,
      VideoType vidType = VideoType.all,
      Orientations orientation = Orientations.all,
      Categories category = Categories.none,
      int minWidth = 0,
      int minHeight = 0,
      List<SupportedColors> colors,
      bool editorsChoice = false,
      bool safeSearch = false,
      Order order = Order.popular,
      perPage = 20,
      page = 1}) async {
    var url = Endpoints.video(this.apiKey, id,
        language: language,
        vidType: vidType,
        orientation: orientation,
        category: category,
        minWidth: minWidth,
        minHeight: minHeight,
        colors: colors,
        editorsChoice: editorsChoice,
        safeSearch: safeSearch,
        order: order,
        perPage: perPage,
        page: page);

    String data = await _getData(url);

    if (data == null) {
      throw Exception("Invalid Data fetched.");
    }

    var result = VideoSearchResult.fromJson(json.decode(data));

    if (result == null) return null;

    return result.videos.first;
  }

  Future<VideoSearchResult> searchVideos(String query,
      {SupportedLanguages language = SupportedLanguages.en,
      VideoType vidType = VideoType.all,
      Orientations orientation = Orientations.all,
      Categories category = Categories.none,
      int minWidth = 0,
      int minHeight = 0,
      List<SupportedColors> colors,
      bool editorsChoice = false,
      bool safeSearch = false,
      Order order = Order.popular,
      perPage = 20,
      page = 1}) async {
    var url = Endpoints.videoSearch(this.apiKey,
        query: query,
        language: language,
        vidType: vidType,
        orientation: orientation,
        category: category,
        minWidth: minWidth,
        minHeight: minHeight,
        colors: colors,
        editorsChoice: editorsChoice,
        safeSearch: safeSearch,
        order: order,
        perPage: perPage,
        page: page);

    String data = await _getData(url);

    if (data == null) {
      throw Exception("Invalid Data fetched.");
    }

    return VideoSearchResult.fromJson(json.decode(data));
  }
}
