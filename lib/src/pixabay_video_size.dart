class VideoSize {
  String url;
  int width;
  int height;
  int size;

  VideoSize({
    this.url,
    this.width,
    this.height,
    this.size,
  });

  factory VideoSize.fromJson(Map<String, dynamic> json) => new VideoSize(
        url: json["url"],
        width: json["width"],
        height: json["height"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
        "size": size,
      };
}
