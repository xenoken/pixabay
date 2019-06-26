import 'pixabay_video_size.dart';

class Videos {
  VideoSize large;
  VideoSize medium;
  VideoSize small;
  VideoSize tiny;

  Videos({
    this.large,
    this.medium,
    this.small,
    this.tiny,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => new Videos(
        large: VideoSize.fromJson(json["large"]),
        medium: VideoSize.fromJson(json["medium"]),
        small: VideoSize.fromJson(json["small"]),
        tiny: VideoSize.fromJson(json["tiny"]),
      );

  Map<String, dynamic> toJson() => {
        "large": large.toJson(),
        "medium": medium.toJson(),
        "small": small.toJson(),
        "tiny": tiny.toJson(),
      };
}
