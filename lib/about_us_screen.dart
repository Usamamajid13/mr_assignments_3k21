import 'package:flutter/material.dart';

import 'app_utils.dart';
import 'constants.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppUtils().drawer(context),
      body: Column(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            color: blueColor,
            child: Center(
              child: Text("About Us",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children:  [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "YOUR SATISFACTION & SUCCESS IS OUR RESPONSIBILITY",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Hello, and welcome to Mr. Assignments 3k21. Mr. Assignments is a service-oriented company designed to help busy and working-class students. We specialize in the academic field of writing. We help alleviate the tension, stress, anxiety and concerns our student-clients may have over their academic writing obligations.",
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
