class Genre {
  String? genreName;
  String? genreId;
  String? genreLink;

  Genre({this.genreName, this.genreId, this.genreLink});

  Genre.fromJson(Map<String, dynamic> json) {
    genreName = json['genre_name'];
    genreId = json['genre_id'];
    genreLink = json['genre_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genre_name'] = this.genreName;
    data['genre_id'] = this.genreId;
    data['genre_link'] = this.genreLink;
    return data;
  }
}