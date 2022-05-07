import 'package:flutter/material.dart';

import 'constants.dart';

class AppUtils{
  drawer(context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 30,),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: blueColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only( right: 10),
                    child: Image.network(
                      'https://mrassignments3k21.com/wp-content/uploads/2022/04/a-1.png',
                      scale: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset("assets/home.png",scale: 20,),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, homeScreenRoute);
            },
          ),
          ListTile(
            leading: Image.asset("assets/group.png",scale: 20,),
            title: const Text("About Us"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutUsScreenRoute);
            },
          ),
          ListTile(
            leading: Image.asset("assets/ask.png",scale: 20,),
            title: const Text("Why Us"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, whyUsScreenRoute);
            },
          ),
        ],
      ),
    );
  }
}