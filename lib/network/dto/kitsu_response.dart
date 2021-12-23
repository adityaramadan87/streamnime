import 'package:stream_nime/model/kitsu.dart';

class KitsuResponse {
  List<KitsuEntity>? kitsu;

  KitsuResponse({this.kitsu});

  KitsuResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      kitsu = [];
      json['data'].forEach((v) {
        kitsu?.add(KitsuEntity.fromJson(v));
      });
    }
  }
}
