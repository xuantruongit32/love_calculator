import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lovecalculator/models/love.dart';
import 'package:lovecalculator/percentWidget.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});
//  final Love love;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(20),
        const Text(
          'Percentage of love between',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        Text(
          "Josh & Lisa",
          style: const TextStyle(
            color: Colors.red,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Expanded(
          child: Row(
            children: [
              Gap(100),
              PercentWidget(percent: 0.3),
              Gap(140),
              VerticalDivider(),
              Text(
                'Quotes',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        const Gap(3),
        ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink),
          ),
          onPressed: () {},
          icon: const Icon(Icons.repeat),
          label: const Text(
            'Again',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        const Gap(30),
      ],
    );
  }
}
