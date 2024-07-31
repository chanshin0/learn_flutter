import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override // 부모 클래스에 있는 메소드를 오버라이딩한다
  //클래스에는 build메서드가 필요하고 이 메서드가 리턴하는것은 화면에 UI로 표현된다.
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 40,
                      color: Colors.white,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Hey, Selena",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Total Balance",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          "\$ 5,194,482",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: "Transfer",
                      bgColor: Color(0xFFF1B33B),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: "Request",
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CurrencyCard(
                  isInverted: false,
                  name: "Euro",
                  amount: "6,428",
                  code: "EUR",
                  icon: Icons.euro_rounded,
                  order: 1,
                ),
                const CurrencyCard(
                  isInverted: true,
                  name: "Bitcoin",
                  amount: "9,785",
                  code: "BTC",
                  icon: Icons.currency_bitcoin_rounded,
                  order: 2,
                ),
                const CurrencyCard(
                  isInverted: false,
                  name: "Dollar",
                  amount: "428",
                  code: "USD",
                  icon: Icons.attach_money_rounded,
                  order: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
