import 'package:flutter/material.dart';
import 'package:mr_assignments_3k21/app_utils.dart';
import 'package:mr_assignments_3k21/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: AppUtils().drawer(context),
      body: Column(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            color: blueColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: (){
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 40, right: 10,left: 30),
                      height: 200,
                      child: Icon(
                        Icons.list,
                        color: Colors.white,
                        size: 30,
                      ),
                    )),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 40, right: 10,left: 20),
                    width: 200,
                    height: 200,
                    child: Image.network(
                      'https://mrassignments3k21.com/wp-content/uploads/2022/04/a-1.png',
                      scale: 1.5,
                    ),
                  ),
                ),
               Container(
                 width: 80,
                 height: 20,
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
                  "Fulfilling college and university demands by a certain deadline can be a downright headache at times! When you just don’t have the time, need a break, or just wanna go and have fun, don’t skip it, assign it to us, and we will get’er done!",
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
                    'https://mrassignments3k21.com/wp-content/uploads/2022/04/Untitled-design-22.png',
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
