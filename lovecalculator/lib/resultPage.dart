import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:love_calculator/models/love.dart';
import 'package:love_calculator/percentWidget.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.love});
  final Love love;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity - 30,
          height: 372,
          child: Column(
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
                '${love.fname} & ${love.sname}',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Gap(100),
                    PercentWidget(
                      percent: double.parse(love.percentage!) / 100,
                    ),
                    const Gap(140),
                    const VerticalDivider(),
                    const Gap(60),
                    Flexible(
                      child: Text(
                        love.result!,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 24,
                        ),
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
                onPressed: () {
                  Navigator.pop(context);
                },
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
          ),
        ),
      ),
    );
  }
}
