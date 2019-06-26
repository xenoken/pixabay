import 'pixabay_videos.dart';

class Video {
  int id;
  String pageUrl;
  String type;
  String tags;
  int duration;
  String pictureId;
  Videos videos;
  int views;
  int downloads;
  int favorites;
  int likes;
  int comments;
  int userId;
  String user;
  String userImageUrl;

  Video({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.duration,
    this.pictureId,
    this.videos,
    this.views,
    this.downloads,
    this.favorites,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  factory Video.fromJson(Map<String, dynamic> json) => new Video(
        id: json["id"],
        pageUrl: json["pageURL"],
        type: json["type"],
        tags: json["tags"],
        duration: json["duration"],
        pictureId: json["picture_id"],
        videos: Videos.fromJson(json["videos"]),
        views: json["views"],
        downloads: json["downloads"],
        favorites: json["favorites"],
        likes: json["likes"],
        comments: json["comments"],
        userId: json["user_id"],
        user: json["user"],
        userImageUrl: json["userImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pageURL": pageUrl,
        "type": type,
        "tags": tags,
        "duration": duration,
        "picture_id": pictureId,
        "videos": videos.toJson(),
        "views": views,
        "downloads": downloads,
        "favorites": favorites,
        "likes": likes,
        "comments": comments,
        "user_id": userId,
        "user": user,
        "userImageURL": userImageUrl,
      };
}
