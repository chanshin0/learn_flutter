import 'dart:convert';

import 'package:http/http.dart';
import 'package:webtoon_app/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse("$baseUrl/$today");
    final response = await get(url);
    List<WebtoonModel> webtoonInstances = [];

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await get(url);
    if (response.statusCode == 200) {
      final webtoon = json.decode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodeId(String id) async {
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await get(url);
    final List<WebtoonEpisodeModel> instances = [];
    if (response.statusCode == 200) {
      final episodes = json.decode(response.body);
      for (var episode in episodes) {
        final instance = WebtoonEpisodeModel.fromJson(episode);
        instances.add(instance);
      }
      return instances;
    }
    throw Error();
  }
}
