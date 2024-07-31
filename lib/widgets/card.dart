import 'dart:ffi';

import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final bool isInverted;
  final String name, amount, code;
  final IconData icon;
  final num order;

  const CurrencyCard({
    super.key,
    required this.isInverted,
    required this.name,
    required this.amount,
    required this.code,
    required this.icon,
    required this.order,
  });

  final blackColor = const Color(0xFF1F2123);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, (order - 1) * -25),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isInverted ? Colors.white : blackColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted ? blackColor : Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted
                              ? blackColor
                              : Colors.white.withOpacity(0.8),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(-1, 15),
                  child: Icon(
                    icon,
                    color: isInverted ? blackColor : Colors.white,
                    size: 86,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
