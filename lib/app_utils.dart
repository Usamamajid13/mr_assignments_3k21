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

  textField({title,icon,hintText,controller}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: const TextStyle(color: Colors.black,fontSize: 16),),
        const SizedBox(height: 10,),
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
              contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border:  const OutlineInputBorder(
                borderSide: BorderSide(color: redColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder:  const OutlineInputBorder(
                borderSide: BorderSide(color: redColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: redColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ) ,
              enabledBorder:  const OutlineInputBorder(
                borderSide: BorderSide(color: redColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
  myRadioButton({title, required int value, onChanged, groupValue}) {
    return RadioListTile(
      activeColor: redColor,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }
}