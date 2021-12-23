class BatchLink {
  String? id;
  String? link;

  BatchLink({this.id, this.link});

  BatchLink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    return data;
  }
}