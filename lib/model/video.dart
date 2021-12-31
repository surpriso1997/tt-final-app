class VideoData {
  VideoData({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  int total;
  int totalHits;
  List<Hit> hits;

  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
        total: json["total"],
        totalHits: json["totalHits"],
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );
}

class Hit {
  Hit({
    required this.id,
    required this.pageUrl,
    required this.type,
    required this.tags,
    required this.duration,
    required this.pictureId,
    required this.videos,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageUrl,
  });

  int id;
  String pageUrl;
  String type;
  String tags;
  int duration;
  String pictureId;
  Videos videos;
  int views;
  int downloads;
  int likes;
  int comments;
  int userId;
  String user;
  String userImageUrl;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        id: json["id"],
        pageUrl: json["pageURL"],
        type: json["type"],
        tags: json["tags"],
        duration: json["duration"],
        pictureId: json["picture_id"],
        videos: Videos.fromJson(json["videos"]),
        views: json["views"],
        downloads: json["downloads"],
        likes: json["likes"],
        comments: json["comments"],
        userId: json["user_id"],
        user: json["user"],
        userImageUrl: json["userImageURL"],
      );
}

class Videos {
  Videos({
    required this.large,
    required this.medium,
    required this.small,
    required this.tiny,
  });

  Large large;
  Large medium;
  Large small;
  Large tiny;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        large: Large.fromJson(json["large"]),
        medium: Large.fromJson(json["medium"]),
        small: Large.fromJson(json["small"]),
        tiny: Large.fromJson(json["tiny"]),
      );
}

class Large {
  Large({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
  });

  String url;
  int width;
  int height;
  int size;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        url: json["url"],
        width: json["width"],
        height: json["height"],
        size: json["size"],
      );
}
