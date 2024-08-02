class WebtoonModel {
  final String title, thumb, id;

  // Constructor
  // WebtoonModel({
  //   required this.id,
  //   required this.thumb,
  //   required this.title,
  // });

  // named Constructor
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumb = json["thumb"],
        id = json["id"];
}
