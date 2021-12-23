import 'home.dart';

class HomeResponse {
  HomeResponse({
      this.status, 
      this.baseUrl, 
      this.home,});

  HomeResponse.fromJson(dynamic json) {
    status = json['status'];
    baseUrl = json['baseUrl'];
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
  }
  String? status;
  String? baseUrl;
  Home? home;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['baseUrl'] = baseUrl;
    if (home != null) {
      map['home'] = home?.toJson();
    }
    return map;
  }

}