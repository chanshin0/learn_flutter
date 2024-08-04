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

class WebtoonDetailModel {
  final String title, about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        about = json["about"],
        genre = json["genre"],
        age = json["age"];
}

class WebtoonEpisodeModel {
  final String title, id, rating, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        id = json["id"],
        rating = json["rating"],
        date = json["date"];
}
