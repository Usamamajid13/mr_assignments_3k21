import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mr_assignments_3k21/app_utils.dart';
import 'package:mr_assignments_3k21/constants.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> globalFomKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var notesController = TextEditingController();
  var courseController = TextEditingController();
  String dropdownvalue = 'No';
  String dropdownvalue2 = 'No';
  String dropdownvalue3 = 'Within 24 hours';
  String dropdownvalue4 = 'Essay';
  String dropdownvalue5 = 'less than 300 words';
  bool iNeedSomethingElse = false;
  bool no = false;
  bool yes = false;
  var items = ["No", "No, I need something else", "Yes"];
  var items1 = ["No", "Yes"];
  var items2 = ["Within 24 hours", "Within 48 hours", "Within five days"];
  var items3 = ["Essay", "Summary", "Research"];
  var items4 = [
    "less than 300 words",
    "less than 500 words",
    "less than 1000 words",
    "less than 1500 words",
    "more than 1500 words"
  ];
  int _groupValue = -1;
  int _groupValue1 = -1;
  int _groupValue2 = -1;
  int _groupValue3 = -1;
  int _groupValue4 = -1;
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
                      hintText: "First name only",
                      controller: nameController,
                      icon: Icons.account_box,
                      title: "Name"),
                  const SizedBox(
                    height: 10,
                  ),
                  AppUtils().textField(
                      hintText: "",
                      controller: emailController,
                      title: "Email"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Do you need research or data for an academic project?",
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
                              no = false;
                              iNeedSomethingElse = true;
                              yes = false;
                            } else if (newValue == "No") {
                              _groupValue = -1;
                              no = true;
                              iNeedSomethingElse = false;
                              yes = false;
                            } else {
                              no = false;
                              iNeedSomethingElse = false;
                              yes = true;
                              _groupValue = -1;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  yes == true
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            AppUtils().textField(
                                hintText: "example: ENC 1101",
                                controller: courseController,
                                title: "Class or Course Distinction"),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "College/University Experience",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppUtils().myRadioButton(
                                      value: 0,
                                      title: "First Year Student",
                                      onChanged: (newValue) => setState(
                                          () => _groupValue2 = newValue),
                                      groupValue: _groupValue2),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppUtils().myRadioButton(
                                      value: 1,
                                      title: "2nd - 4th Year Student",
                                      onChanged: (newValue) => setState(
                                          () => _groupValue2 = newValue),
                                      groupValue: _groupValue2),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppUtils().myRadioButton(
                                      value: 2,
                                      title: "4+ Year Student",
                                      onChanged: (newValue) => setState(
                                          () => _groupValue2 = newValue),
                                      groupValue: _groupValue2),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Data Needed for?",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: redColor, width: 1),
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: dropdownvalue4,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items: items3.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (var newValue) {
                                        setState(() {
                                          dropdownvalue4 = newValue.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Project Length?",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: redColor, width: 1),
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: dropdownvalue5,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items: items4.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (var newValue) {
                                        setState(() {
                                          dropdownvalue5 = newValue.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Required Format Type?",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppUtils().myRadioButton(
                                          value: 0,
                                          title: "APA (with citations)",
                                          onChanged: (newValue) => setState(
                                              () => _groupValue3 = newValue),
                                          groupValue: _groupValue3),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppUtils().myRadioButton(
                                          value: 1,
                                          title: "CMS (with citations)",
                                          onChanged: (newValue) => setState(
                                              () => _groupValue3 = newValue),
                                          groupValue: _groupValue3),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppUtils().myRadioButton(
                                          value: 2,
                                          title: "MLA (with citations)",
                                          onChanged: (newValue) => setState(
                                              () => _groupValue3 = newValue),
                                          groupValue: _groupValue3),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "What Is The Required Line Spacing?",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppUtils().myRadioButton(
                                          value: 0,
                                          title: "Single",
                                          onChanged: (newValue) => setState(
                                              () => _groupValue4 = newValue),
                                          groupValue: _groupValue4),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppUtils().myRadioButton(
                                          value: 1,
                                          title: "Double",
                                          onChanged: (newValue) => setState(
                                              () => _groupValue4 = newValue),
                                          groupValue: _groupValue4),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppUtils().myRadioButton(
                                          value: 2,
                                          title: "Not Specified",
                                          onChanged: (newValue) => setState(
                                              () => _groupValue4 = newValue),
                                          groupValue: _groupValue4),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      : Container(),
                  iNeedSomethingElse == true
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Project is related to",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppUtils().myRadioButton(
                                  value: 0,
                                  title: "Business/Work",
                                  onChanged: (newValue)
                                  {
                                    print(newValue);
                                    setState(() {
                                      _groupValue = newValue;
                                    });
                                  },
                                  groupValue: _groupValue),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppUtils().myRadioButton(
                                  value: 1,
                                  title: "Professional",
                                  onChanged: (newValue)
                                  {
                                    print(newValue);
                                    setState(() {
                                      _groupValue = newValue;
                                    });
                                  },
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
                                "Business/Professional Need",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppUtils().myRadioButton(
                                  value: 0,
                                  title: "CV/Resume",
                                  onChanged: (newValue)
                                  {
                                    print(newValue);
                                    setState(() {
                                      _groupValue1 = newValue;
                                    });
                                  },
                                  groupValue: _groupValue1),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppUtils().myRadioButton(
                                  value: 1,
                                  title: "Grant Writing",
                                  onChanged: (newValue)
                                  {
                                    print(newValue);
                                    setState(() {
                                      _groupValue1 = newValue;
                                    });
                                  },
                                  groupValue: _groupValue1),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppUtils().myRadioButton(
                                  value: 2,
                                  title: "Power Point",
                                  onChanged: (newValue)
                                  {
                                    print(newValue);
                                    setState(() {
                                      _groupValue1 = newValue;
                                    });
                                  },
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Special Notes or Details",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: redColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "File Upload (Articles, Instructions, Syllabus, etc)",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: redColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (nameController.text.isEmpty ||
                          nameController.text == "") {
                        EasyLoading.showError("Name is Required!");
                      } else {
                        if (emailController.text.isEmpty ||
                            emailController.text == "") {
                          EasyLoading.showError("Email is Required!");
                        } else {
                          if (dropdownvalue.toString() == "No") {
                            sendEmail(
                              needResearch: dropdownvalue,
                                name: nameController.text,
                                email: emailController.text,
                            specialNotes: notesController.text,
                              hours: dropdownvalue2,
                              completionTime: dropdownvalue3,
                            );
                          } else if (dropdownvalue.toString() ==
                              "No, I need something else") {
                            if (_groupValue == -1) {
                              EasyLoading.showError(
                                  "Please select what the project is related to?");
                            } else {
                              if (_groupValue1 == -1) {
                                EasyLoading.showError(
                                    "Please select Business/Professional Need");
                              } else {
                                sendEmail(
                                  needResearch: dropdownvalue,
                                  name: nameController.text,
                                  relatedProject: _groupValue == 1 ? "Professional":"Business/Word",
                                  professionalNeeds: _groupValue1 == 0 ? "CV/Resume": _groupValue1 == 1 ? "Grant Writing":"Power Point",
                                  email: emailController.text,
                                  specialNotes: notesController.text,
                                  hours: dropdownvalue2,
                                  completionTime: dropdownvalue3,
                                );
                              }
                            }
                          } else {
                            if (courseController.text.isEmpty ||
                                courseController.text == "") {
                              EasyLoading.showError(
                                  "Class or Course Distinction is Required!");
                            } else {
                              if (_groupValue2 == -1) {
                                EasyLoading.showError(
                                    "Please select Experience");
                              } else {
                                if (_groupValue3 == -1) {
                                  EasyLoading.showError(
                                      "Please select Required Format Type");
                                } else {
                                  if (_groupValue4 == -1) {
                                    EasyLoading.showError(
                                        "Please select Required Line Spacing");
                                  } else {
                                    sendEmail(
                                       name: nameController.text,
                                       email: emailController.text,
                                      specialNotes: notesController.text,
                                      hours: dropdownvalue2,
                                      completionTime: dropdownvalue3,
                                    );                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )),
                    ),
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

  Future sendEmail({
    required String name,
    required String email,
    relatedProject = "N/A",
    needResearch = "N/A",
    professionalNeeds = "N/A",
    hours = "N/A",
    classOrCourse = "N/A",
    completionTime = "N/A",
    experience = "N/A",
    dataNeeded = "N/A",
    requiredFormat = "N/A",
    projectLength = "N/A",
    lineSpacing = "N/A",
    specialNotes = "N/A",
  }) async {
    EasyLoading.show(status: "Loading..");
    const serviceId = 'service_xi42usb';
    const templateId = 'template_xpzp6vf';
    const userId = 'QwSXqLvcMvYbBfmEI';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'related_project': relatedProject,
            'need_research':needResearch,
            'professional_needs':professionalNeeds,
            '8_hours': hours,
            'completion_time': completionTime,
            'class_or_course': classOrCourse,
            'experience': experience,
            'data_needed': dataNeeded,
            'project_length':projectLength,
            'required_format':requiredFormat,
            'line_spacing':lineSpacing,
            'special_notes':specialNotes,

          }
        }));
    if (response.statusCode == 200) {
      EasyLoading.showSuccess("Email sent Successfully!");
    }
    else{
      EasyLoading.dismiss();
    }
  }
}
