class Episode {
  String? title;
  String? id;
  String? link;
  String? uploadedOn;

  Episode({this.title, this.id, this.link, this.uploadedOn});

  Episode.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    link = json['link'];
    uploadedOn = json['uploaded_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    data['link'] = this.link;
    data['uploaded_on'] = this.uploadedOn;
    return data;
  }
}
