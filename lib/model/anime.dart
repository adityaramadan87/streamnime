class AnimeEntity {
  AnimeEntity({
      this.title, 
      this.id, 
      this.thumb, 
      this.episode, 
      this.uploadedOn, 
      this.dayUpdated, 
      this.link,
      this.score
  });

  AnimeEntity.fromJson(dynamic json) {
    title = json['title'];
    id = json['id'];
    thumb = json['thumb'];
    episode = json['episode'];
    uploadedOn = json['uploaded_on'];
    dayUpdated = json['day_updated'];
    link = json['link'];
    score = json['score']?.toDouble();
  }
  String? title;
  String? id;
  String? thumb;
  String? episode;
  String? uploadedOn;
  String? dayUpdated;
  String? link;
  double? score;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['id'] = id;
    map['thumb'] = thumb;
    map['episode'] = episode;
    map['uploaded_on'] = uploadedOn;
    map['day_updated'] = dayUpdated;
    map['link'] = link;
    map['score'] = score;
    return map;
  }

}