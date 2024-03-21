import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:lovecalculator/network/network_request.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _maleController = TextEditingController();
  final TextEditingController _femaleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity - 20,
          height: 400,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Gap(80),
                      const Center(
                        child: Text(
                          'YOUR NAME',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const Gap(10),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          controller: _maleController,
                          decoration: const InputDecoration(
                            hintText: 'Enter Your Name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const VerticalDivider(
                      color: Colors.white,
                      indent: 70,
                      endIndent: 70,
                    ),
                    const Icon(Icons.heart_broken),
                    const VerticalDivider(
                      color: Colors.white,
                      indent: 50,
                      endIndent: 50,
                      thickness: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                      ),
                      child: const Text(
                        'CALCULATE LOVE %',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Gap(80),
                      const Center(
                        child: Text(
                          'PARTNER\'S NAME',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const Gap(10),
                      Container(
                        padding: const EdgeInsets.only(right: 12, left: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          controller: _femaleController,
                          decoration: const InputDecoration(hintText: 'Enter Partner\'S Name'),
                        ),
                      ),
                    ],
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
