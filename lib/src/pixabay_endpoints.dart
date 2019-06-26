import 'dart:convert' as convert;

import 'pixabay_enums.dart';

/// The [Endpoints] class contains the set of URL that the Pexels API support.
abstract class Endpoints {
  static const _apiURLBase = 'https://pixabay.com/api';
  static const _apiURLPartVideo = 'videos';

// Photo Endpoints.

  /// Get a photo.
  ///
  /// [perPage] default : 20, min : 3, max : 200
  /// []
  static String photo(String key, String id,
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
      page = 1}) {
    var langString = language.toString().replaceAll('SupportedLanguages.', '');
    var imgTypeString = imgType.toString().replaceAll('ImageTypes.', '');
    var orientationString =
        orientation.toString().replaceAll('Orientations.', '');
    var categoryString = category != Categories.none
        ? category.toString().replaceAll('Categories.', '')
        : "";
    StringBuffer buffer = new StringBuffer();
    colors?.forEach((c) {
      buffer.write(c.toString() + ",");
    });
    var colorString = buffer.toString();
    colorString = colorString.isNotEmpty
        ? colorString.substring(0, colorString.length - 1)
        : colorString;
    var orderString = order.toString().replaceAll('Order.', '');
    ;

    return '$_apiURLBase/?key=$key'
        '&safesearch=$safeSearch'
        '&editors_choice=$editorsChoice'
        '&min_width=$minWidth'
        '&min_height=$minHeight'
        '&lang=$langString'
        '&id=$id'
        '&category=$categoryString'
        '&orientation=$orientationString'
        '&image_type=$imgTypeString'
        '&order=$orderString'
        '&per_page=$perPage'
        '&page=$page';
  }

  /// Search for a photo.
  ///
  /// [perPage] default : 20, min : 3, max : 200
  /// [query] A URL encoded search term. If omitted, all images are returned. This value may not exceed 100 characters. Example: "yellow+flower"
  /// [language] Language code of the language to be searched in.
  // Accepted values: cs, da, de, en, es, fr, id, it, hu, nl, no, pl, pt, ro, sk, fi, sv, tr, vi, th, bg, ru, el, ja, ko, zh
  // Default: "en"
  /// [imgType] Filter results by image type.
  //Accepted values: "all", "photo", "illustration", "vector"
  //Default: "all"
  static String photoSearch(String key,
      {String query,
      SupportedLanguages language = SupportedLanguages.en,
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
      page = 1}) {
    var langString = language.toString().replaceAll('SupportedLanguages.', '');
    var sanitizedQuery = convert.htmlEscape.convert(query);
    var imgTypeString = imgType.toString().replaceAll('ImageTypes.', '');
    var orientationString =
        orientation.toString().replaceAll('Orientations.', '');
    var categoryString = category != Categories.none
        ? category.toString().replaceAll('Categories.', '')
        : "";
    StringBuffer buffer = new StringBuffer();
    colors?.forEach((c) {
      buffer.write(c.toString() + ",");
    });
    var colorString = buffer.toString();
    colorString = colorString.isNotEmpty
        ? colorString.substring(0, colorString.length - 1)
        : colorString;
    var orderString = order.toString().replaceAll('Order.', '');
    ;

    return '$_apiURLBase/?key=$key'
        '&q=$sanitizedQuery'
        '&safesearch=$safeSearch'
        '&editors_choice=$editorsChoice'
        '&min_width=$minWidth'
        '&min_height=$minHeight'
        '&lang=$langString'
        '&category=$categoryString'
        '&orientation=$orientationString'
        '&image_type=$imgTypeString'
        '&order=$orderString'
        '&per_page=$perPage'
        '&page=$page';
  }

// Video Endpoints

  /// Get a video.
  ///
  /// [perPage] default : 20, min : 3, max : 200
  static String video(String key, String id,
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
      page = 1}) {
    var langString = language.toString().replaceAll('SupportedLanguages.', '');
    var vidTypeString = vidType.toString().replaceAll('VideoTypes.', '');
    var orientationString =
        orientation.toString().replaceAll('Orientations.', '');
    var categoryString = category != Categories.none
        ? category.toString().replaceAll('Categories.', '')
        : "";
    StringBuffer buffer = new StringBuffer();
    colors?.forEach((c) {
      buffer.write(c.toString() + ",");
    });
    var colorString = buffer.toString();
    colorString = colorString.isNotEmpty
        ? colorString.substring(0, colorString.length - 1)
        : colorString;
    var orderString = order.toString().replaceAll('Order.', '');
    ;

    return '$_apiURLBase/$_apiURLPartVideo/?key=$key'
        '&safesearch=$safeSearch'
        '&editors_choice=$editorsChoice'
        '&min_width=$minWidth'
        '&min_height=$minHeight'
        '&lang=$langString'
        '&id=$id'
        '&category=$categoryString'
        '&orientation=$orientationString'
        '&video_type=$vidTypeString'
        '&order=$orderString'
        '&per_page=$perPage'
        '&page=$page';
  }

  /// Search for a video.
  ///
  /// [perPage] default : 20, min : 3, max : 200
  static String videoSearch(String key,
      {String query,
      SupportedLanguages language = SupportedLanguages.en,
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
      page = 1}) {
    var langString = language.toString().replaceAll('SupportedLanguages.', '');
    var sanitizedQuery = convert.htmlEscape.convert(query);
    var vidTypeString = vidType.toString().replaceAll('VideoTypes.', '');
    var orientationString =
        orientation.toString().replaceAll('Orientations.', '');
    var categoryString = category != Categories.none
        ? category.toString().replaceAll('Categories.', '')
        : "";
    StringBuffer buffer = new StringBuffer();
    colors?.forEach((c) {
      buffer.write(c.toString() + ",");
    });
    var colorString = buffer.toString();
    colorString = colorString.isNotEmpty
        ? colorString.substring(0, colorString.length - 1)
        : colorString;
    var orderString = order.toString().replaceAll('Order.', '');
    ;

    return '$_apiURLBase/$_apiURLPartVideo/?key=$key'
        '&q=$sanitizedQuery'
        '&safesearch=$safeSearch'
        '&editors_choice=$editorsChoice'
        '&min_width=$minWidth'
        '&min_height=$minHeight'
        '&lang=$langString'
        '&category=$categoryString'
        '&orientation=$orientationString'
        '&video_type=$vidTypeString'
        '&order=$orderString'
        '&per_page=$perPage'
        '&page=$page';
  }
}
