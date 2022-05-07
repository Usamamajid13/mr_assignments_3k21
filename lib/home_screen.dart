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
  var nameController = TextEditingController();
  var notesController = TextEditingController();
  String dropdownvalue = 'No';
  String dropdownvalue2 = 'No';
  String dropdownvalue3 = 'Within five days';
  bool iNeedSomethingElse = false;
  var items = ["No", "No, I need something else", "Yes"];
  var items1 = ["No", "Yes"];
  var items2 = ["Within 24 hours", "Within 48 hours", "Within five days"];
  int _groupValue = -1;
  int _groupValue1 = -1;
  bool needIn8 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: AppUtils().drawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              color: blueColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 40, right: 10, left: 30),
                        height: 200,
                        child: const Icon(
                          Icons.list,
                          color: Colors.white,
                          size: 30,
                        ),
                      )),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 40, right: 10, left: 20),
                      width: 200,
                      height: 200,
                      child: Image.network(
                        'https://mrassignments3k21.com/wp-content/uploads/2022/04/a-1.png',
                        scale: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(
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
                  AppUtils().textField(
                      hintText: "Boss Jack",
                      controller: nameController,
                      icon: Icons.account_box,
                      title: "First name only"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Do you need assistance with an academic assignment?",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: redColor, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (var newValue) {
                          setState(() {
                            dropdownvalue = newValue.toString();
                            if (newValue == "No, I need something else") {
                              iNeedSomethingElse = true;
                            } else {
                              iNeedSomethingElse = false;
                              _groupValue = -1;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  iNeedSomethingElse == true
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Assignment Relation",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppUtils().myRadioButton(
                                  value: 0,
                                  title: "Business/Work",
                                  onChanged: (newValue) =>
                                      setState(() => _groupValue = newValue),
                                  groupValue: _groupValue),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppUtils().myRadioButton(
                                  value: 1,
                                  title: "Professional",
                                  onChanged: (newValue) =>
                                      setState(() => _groupValue = newValue),
                                  groupValue: _groupValue),
                            ),
                          ],
                        )
                      : Container(),
                  _groupValue != -1
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Multiple Choice",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppUtils().myRadioButton(
                                  value: 0,
                                  title: "CV/Resume",
                                  onChanged: (newValue) =>
                                      setState(() => _groupValue1 = newValue),
                                  groupValue: _groupValue1),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppUtils().myRadioButton(
                                  value: 1,
                                  title: "Grant Writing",
                                  onChanged: (newValue) =>
                                      setState(() => _groupValue1 = newValue),
                                  groupValue: _groupValue1),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppUtils().myRadioButton(
                                  value: 2,
                                  title: "Power Point",
                                  onChanged: (newValue) =>
                                      setState(() => _groupValue1 = newValue),
                                  groupValue: _groupValue1),
                            ),
                          ],
                        )
                      : Container(
                          height: 10,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Do you need this within 8 hours?",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: redColor, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: dropdownvalue2,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items1.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (var newValue) {
                          setState(() {
                            dropdownvalue2 = newValue.toString();
                            if (newValue == "Yes") {
                              needIn8 = true;
                            } else {
                              needIn8 = false;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  needIn8 == false
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "When do you want this completed?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                  border: Border.all(color: redColor, width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: dropdownvalue3,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: items2.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (var newValue) {
                                    setState(() {
                                      dropdownvalue3 = newValue.toString();
                                      if (newValue == "Yes") {
                                      } else {}
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Special Notes or Details",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: redColor,
                            width: 1,
                          ),borderRadius: BorderRadius.circular(15),
                        ),
                        child: Expanded(
                          child: TextField(
                            controller: notesController,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                               contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 210,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
