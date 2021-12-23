import 'package:stream_nime/model/batch_link.dart';
import 'package:stream_nime/model/episode.dart';
import 'package:stream_nime/model/genre.dart';

class AnimeDetailResponse {
  String? thumb;
  String? animeId;
  String? synopsis;
  String? title;
  String? japanase;
  double? score;
  String? producer;
  String? type;
  String? status;
  int? totalEpisode;
  String? duration;
  String? releaseDate;
  String? studio;
  List<Genre>? genreList;
  List<Episode>? episodeList;
  BatchLink? batchLink;

  AnimeDetailResponse(
      {this.thumb,
        this.animeId,
        this.synopsis,
        this.title,
        this.japanase,
        this.score,
        this.producer,
        this.type,
        this.status,
        this.totalEpisode,
        this.duration,
        this.releaseDate,
        this.studio,
        this.genreList,
        this.episodeList,
        this.batchLink});

  AnimeDetailResponse.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    animeId = json['anime_id'];
    synopsis = json['synopsis'];
    title = json['title'];
    japanase = json['japanase'];
    score = json['score']?.toDouble();
    producer = json['producer'];
    type = json['type'];
    status = json['status'];
    totalEpisode = json['total_episode'] == null ? 0 : json['total_episode'];
    duration = json['duration'];
    releaseDate = json['release_date'];
    studio = json['studio'];
    if (json['genre_list'] != null) {
      genreList = [];
      json['genre_list'].forEach((v) {
        genreList?.add(new Genre.fromJson(v));
      });
    }
    if (json['episode_list'] != null) {
      episodeList = [];
      json['episode_list'].forEach((v) {
        episodeList?.add(new Episode.fromJson(v));
      });
    }
    batchLink = json['batch_link'] != null
        ? new BatchLink.fromJson(json['batch_link'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumb'] = this.thumb;
    data['anime_id'] = this.animeId;
    data['synopsis'] = this.synopsis;
    data['title'] = this.title;
    data['japanase'] = this.japanase;
    data['score'] = this.score;
    data['producer'] = this.producer;
    data['type'] = this.type;
    data['status'] = this.status;
    data['total_episode'] = this.totalEpisode;
    data['duration'] = this.duration;
    data['release_date'] = this.releaseDate;
    data['studio'] = this.studio;
    if (this.genreList != null) {
      data['genre_list'] = this.genreList?.map((v) => v.toJson()).toList();
    }
    if (this.episodeList != null) {
      data['episode_list'] = this.episodeList?.map((v) => v.toJson()).toList();
    }
    if (this.batchLink != null) {
      data['batch_link'] = this.batchLink?.toJson();
    }
    return data;
  }
}