import 'package:flutter/material.dart';
import 'package:webtoon_app/models/webtoon_model.dart';

class WebtoonCard extends StatelessWidget {
  const WebtoonCard({
    super.key,
    required this.webtoon,
  });

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 10, // 그림자의 크기
            offset: const Offset(5, 5), // 그림자의 위치(정중앙)
            color: Colors.black.withOpacity(0.5),
          )
        ],
      ),
      width: 250,
      child: Image.network(
        webtoon.thumb,
        headers: const {
          "User-Agent":
              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
        },
      ),
    );
  }
}
