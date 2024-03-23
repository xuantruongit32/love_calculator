import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:love_calculator/models/love.dart';
import 'package:love_calculator/network/network_request.dart';
import 'package:love_calculator/resultPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    bool _checkTrueLove(String fname, String sname) {
      if ((fname == 'Truong' || fname == 'Hoang Truong' || fname == 'Hoang Xuan Truong') &&
          (sname == 'Anh' ||
              sname == 'Ngoc Anh' ||
              sname == 'Hoang Ngoc Anh' ||
              sname == 'Hoang Thanh Thuy' ||
              sname == 'Hoang Thuy' ||
              sname == 'Thanh Thuy' ||
              sname == 'Thuy')) {
        return true;
      }
      return false;
    }

    final trueLove = Love(
      fname: '🦴🐟',
      sname: '😛',
      percentage: 99.99.toStringAsFixed(4),
      result: 'Duyên là do trời định, phận là do anh tạo. Love you 3000 <3',
    );

    final TextEditingController _maleController = TextEditingController();
    final TextEditingController _femaleController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity - 30,
            height: 370,
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
                        onPressed: () {
                          NetworkRequest().fetchLove(params: {
                            'fname': _femaleController.text,
                            'sname': _maleController.text,
                          }).then(
                            (value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                      love: _checkTrueLove(_femaleController.text, _maleController.text)
                                          ? trueLove
                                          : value),
                                )),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.pink),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
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
                            decoration: const InputDecoration(hintText: 'Enter Partner\'s Name'),
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
      ),
    );
  }
}
