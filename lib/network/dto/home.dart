import 'package:stream_nime/model/anime.dart';

class Home {
  Home({
      this.onGoing, 
      this.complete,});

  Home.fromJson(dynamic json) {
    if (json['on_going'] != null) {
      onGoing = [];
      json['on_going'].forEach((v) {
        onGoing?.add(AnimeEntity.fromJson(v));
      });
    }
    if (json['complete'] != null) {
      complete = [];
      json['complete'].forEach((v) {
        complete?.add(AnimeEntity.fromJson(v));
      });
    }
  }
  List<AnimeEntity>? onGoing;
  List<AnimeEntity>? complete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (onGoing != null) {
      map['on_going'] = onGoing?.map((v) => v.toJson()).toList();
    }
    if (complete != null) {
      map['complete'] = complete?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}