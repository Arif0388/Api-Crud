class NoteModel {
  NoteModel({
      this.id, 
      this.title, 
      this.description, 
      this.time, 
      this.timestamp,});

  NoteModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    time = json['time'];
    timestamp = json['timestamp'];
  }
  String? id;
  String? title;
  String? description;
  String? time;
  String? timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['time'] = time;
    map['timestamp'] = timestamp;
    return map;
  }

}