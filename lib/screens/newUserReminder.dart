import 'package:flutter/material.dart';
import 'package:gogol/NavBar.dart';
import 'package:gogol/screens/addReminderDialog.dart';

import 'home.dart';

class newUserReminder extends StatefulWidget {
  const newUserReminder({Key? key}) : super(key: key);

  @override
  State<newUserReminder> createState() => _newUserReminderState();
}

class _newUserReminderState extends State<newUserReminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Reminder", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.20),
            Image.asset("assets/images/alarm-illustration.png", width: 120, height: 120),
            SizedBox(height: 15),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "You haven’t set any reminder\n",
                style: TextStyle(
                    height: 1.4,
                    fontFamily: "Inter",
                    color: Color(0xff333333),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(
                    text:
                    "Set reminder to get reminded when\nto take medicines",
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontFamily: "Inter",
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return addReminderDialog();
                  },
                );
              },
              child: Container(
                width: 168,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xff0c7c81),
                    borderRadius: BorderRadius.circular(3)
                ),
                child: Center(
                  child: Text("Set reminder", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
