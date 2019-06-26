class Photo {
  int id;
  String pageUrl;
  String type;
  String tags;
  String previewUrl;
  int previewWidth;
  int previewHeight;
  String webformatUrl;
  int webformatWidth;
  int webformatHeight;
  String largeImageUrl;
  String fullHdurl;
  String imageUrl;
  int imageWidth;
  int imageHeight;
  int imageSize;
  int views;
  int downloads;
  int favorites;
  int likes;
  int comments;
  int userId;
  String user;
  String userImageUrl;

  Photo({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.fullHdurl,
    this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.favorites,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => new Photo(
        id: json["id"],
        pageUrl: json["pageURL"],
        type: json["type"],
        tags: json["tags"],
        previewUrl: json["previewURL"],
        previewWidth: json["previewWidth"],
        previewHeight: json["previewHeight"],
        webformatUrl: json["webformatURL"],
        webformatWidth: json["webformatWidth"],
        webformatHeight: json["webformatHeight"],
        largeImageUrl: json["largeImageURL"],
        fullHdurl: json["fullHDURL"],
        imageUrl: json["imageURL"],
        imageWidth: json["imageWidth"],
        imageHeight: json["imageHeight"],
        imageSize: json["imageSize"],
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
        "previewURL": previewUrl,
        "previewWidth": previewWidth,
        "previewHeight": previewHeight,
        "webformatURL": webformatUrl,
        "webformatWidth": webformatWidth,
        "webformatHeight": webformatHeight,
        "largeImageURL": largeImageUrl,
        "fullHDURL": fullHdurl,
        "imageURL": imageUrl,
        "imageWidth": imageWidth,
        "imageHeight": imageHeight,
        "imageSize": imageSize,
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
