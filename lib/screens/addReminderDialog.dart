import 'package:flutter/material.dart';
import 'package:gogol/screens/reminderCurrentUser.dart';

import 'home.dart';

class addReminderDialog extends StatefulWidget {
  const addReminderDialog({Key? key}) : super(key: key);

  @override
  State<addReminderDialog> createState() => _addReminderDialogState();
}

class _addReminderDialogState extends State<addReminderDialog> {

  bool _isFormValid = false;
  bool showPassword = true;
  TextEditingController medicineNameController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  void _checkFormValidity() {
    setState(() {
      // Update the form validity based on the input fields' status
      _isFormValid = medicineNameController.text.isNotEmpty &&
          notesController.text.isNotEmpty;
    });
  }

  late String _reminderTime;
  List<String> _timeDropdownValues = [
    'Select time',
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '04:00',
    '06:00',
    '07:00',
  ];

  late String _reminderDay;
  List<String> _dayDropdownValues = [
    'Select day',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wedenesday',
    'Thrusday',
    'Friday',
    'Saturday',
  ];

  @override
  void initState() {
    super.initState();
    _reminderTime = _timeDropdownValues[0];
    _reminderDay = _dayDropdownValues[0];
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: AlertDialog(
          alignment: Alignment.bottomCenter,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))
          ),
          insetPadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 30,),
              Text("Add reminder", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xff333333), fontSize: 15)),
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                  child: Icon(Icons.close, color: Color(0xff666666), size: 20,))
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("What is the medicine name?",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                            fontSize: 15))),
                SizedBox(height: 10),
                TextFormField(
                  controller: medicineNameController,
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: Color(0xff333333),
                      fontSize: 15),
                  onChanged: (value) => _checkFormValidity(),
                  decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Search medicine name here',
                      hintStyle: TextStyle(
                          fontFamily: "Inter",
                          color: Color(0xff999999),
                          fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff999999), width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff999999), width: 1),
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Do you have any notes?",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                            fontSize: 15))),
                SizedBox(height: 10),
                TextFormField(
                  maxLines: 5,
                  controller: notesController,
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: Color(0xff333333),
                      fontSize: 15),
                  onChanged: (value) => _checkFormValidity(),
                  decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      hintText: 'Write your notes',
                      hintStyle: TextStyle(
                          fontFamily: "Inter",
                          color: Color(0xff999999),
                          fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff999999), width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff999999), width: 1),
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("What time do you want to be reminded?",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                            fontSize: 15))),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff353535), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down, color: Color(0xff666666), size: 30,),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter",
                            color: Color(0xff999999)),
                        value: _reminderTime,
                        items: _timeDropdownValues.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _reminderTime = newValue as String;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("What day do you want to be reminded?",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                            fontSize: 15))),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff353535), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down, color: Color(0xff666666), size: 30,),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter",
                            color: Color(0xff999999)),
                        value: _reminderDay,
                        items: _dayDropdownValues.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _reminderDay = newValue as String;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child:  Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5);
                          else if (states.contains(MaterialState.disabled))
                            return Color(0x300F9BA1);
                          return Color(0xff0F9BA1);
                        },
                      ),
                    ),
                    onPressed: _isFormValid ? (){
                      final snackBar = SnackBar(
                          duration: Duration(seconds: 3),
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.5, color: Color(0xffABD2B6)),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          width: 290,
                          backgroundColor: Color(0xffEAF4ED),
                          content: Row(
                            children: [
                              Container(width: 20, height: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff2D8E48)
                                ),
                                child: Center(child: Icon(Icons.check, color: Colors.white, size: 16,)),
                              ),
                              SizedBox(width: 10),
                              Flexible(child: Text("Reminder is successfully set!", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 13)))
                            ],
                          )
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => reminderCurrentUser()));
                    } : null,
                    // Disable the button if the form is not valid
                    child: Text('Save reminder',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                            fontSize: 16)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

