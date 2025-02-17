class NotesModel {
  String? title;
  String? description;
  String? id;

  NotesModel({
      this.title, 
      this.description, 
      this.id,});

  NotesModel.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['id'] = id;
    return map;
  }

}