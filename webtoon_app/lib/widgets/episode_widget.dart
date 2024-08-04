import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webtoon_app/models/webtoon_model.dart';

class EpisodeWidget extends StatelessWidget {
  final String webtoonId;
  final WebtoonEpisodeModel episode;
  final unescape = HtmlUnescape();

  EpisodeWidget({
    super.key,
    required this.webtoonId,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    void onButtonTap() async {
      await launchUrlString(
          "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
    }

    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        margin: const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(45)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  unescape.convert(episode.title),
                  style: const TextStyle(
                      fontSize: 16,
                      // color: Colors.blue.shade300,
                      // overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
