class KitsuEntity {
  String? id;
  String? canonicalTitle;
  String? japaneseTitle;
  String? coverImage;
  String? youtubeVideoId;

  KitsuEntity({this.id, this.canonicalTitle, this.japaneseTitle, this.coverImage, this.youtubeVideoId});

  KitsuEntity.fromJson(dynamic json) {
    this.id = json['id'];
    this.canonicalTitle = json['attributes']['canonicalTitle'];
    this.japaneseTitle = json['attributes']['titles']['ja_jp'];
    this.coverImage = json['attributes']['coverImage']?['original'];
    this.youtubeVideoId = json['attributes']['youtubeVideoId'] ?? "";
  }
}
