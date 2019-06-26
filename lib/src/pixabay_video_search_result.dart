import 'pixabay_video.dart';

class VideoSearchResult {
  int total;
  int totalVideos;
  List<Video> videos;

  VideoSearchResult({
    this.total,
    this.totalVideos,
    this.videos,
  });

  factory VideoSearchResult.fromJson(Map<String, dynamic> json) =>
      new VideoSearchResult(
        total: json["total"],
        totalVideos: json["totalHits"],
        videos:
            new List<Video>.from(json["hits"].map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalHits": totalVideos,
        "hits": new List<dynamic>.from(videos.map((x) => x.toJson())),
      };
}
