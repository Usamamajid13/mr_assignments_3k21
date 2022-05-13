import 'package:flutter/material.dart';

import 'app_utils.dart';
import 'constants.dart';

class WhyUsScreen extends StatefulWidget {
  const WhyUsScreen({Key? key}) : super(key: key);

  @override
  State<WhyUsScreen> createState() => _WhyUsScreenState();
}

class _WhyUsScreenState extends State<WhyUsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppUtils().drawer(context),
      body: Column(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            color: blueColor,
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 10, left: 30),
                      height: 200,
                      child: const Icon(
                        Icons.list,
                        color: Colors.white,
                        size: 30,
                      ),
                    )),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Why Us",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 80,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "When life gets too busy and the necessary task seem to be mountainous, when the personal life negatively affects academy performance, when there is more work to be done than the hours remaining for completion: CHOOSE US! Mr Assignments 3k21 is the solution to your writing needs!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 40, right: 10),
                  width: 300,
                  height: 300,
                  child: Image.network(
                    'https://mrassignments3k21.com/wp-content/uploads/2022/04/Untitled-design-26.png',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
