import 'pixabay_photo.dart';

class PhotoSearchResult {
  int total;
  int totalPhotos;
  List<Photo> photos;

  PhotoSearchResult({
    this.total,
    this.totalPhotos,
    this.photos,
  });

  factory PhotoSearchResult.fromJson(Map<String, dynamic> json) =>
      new PhotoSearchResult(
        total: json["total"],
        totalPhotos: json["totalHits"],
        photos:
            new List<Photo>.from(json["hits"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalHits": totalPhotos,
        "hits": new List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}
