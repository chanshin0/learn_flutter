import 'package:flutter/material.dart';
import 'package:webtoon_app/screens/home_screen.dart';
import 'package:webtoon_app/services/api_service.dart';

void main() {
  runApp(const WebtoonApp());
}

class WebtoonApp extends StatefulWidget {
  const WebtoonApp({super.key}); // 플러터의 위젯에는 key가 있고, 이 key를 수퍼클래스에게 전달함.

  @override
  State<WebtoonApp> createState() => _WebtoonAppState();
}

class _WebtoonAppState extends State<WebtoonApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Flexible(child: HomeScreen()),
    );
  }
}
