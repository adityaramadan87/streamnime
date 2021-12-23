import 'package:stream_nime/model/anime.dart';

class CompletePaginationResponse {
  CompletePaginationResponse({
    this.status,
    this.baseUrl,
    this.animeList,
  });

  CompletePaginationResponse.fromJson(dynamic json) {
    status = json['status'];
    baseUrl = json['baseUrl'];
    if (json['animeList'] != null) {
      animeList = [];
      json['animeList'].forEach((v) {
        animeList?.add(AnimeEntity.fromJson(v));
      });
    }
  }
  String? status;
  String? baseUrl;
  List<AnimeEntity>? animeList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['baseUrl'] = baseUrl;
    if (animeList != null) {
      map['complete'] = animeList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
