import 'package:flutter/material.dart';
import 'package:gogol/screens/addReminderDialog.dart';

import 'changeAddress.dart';

class reminderCurrentUser extends StatefulWidget {
  const reminderCurrentUser({Key? key}) : super(key: key);

  @override
  State<reminderCurrentUser> createState() => _reminderCurrentUserState();
}

class _reminderCurrentUserState extends State<reminderCurrentUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Reminder", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(icon: Icon(Icons.add, size: 24, color: Colors.white,), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => addReminderDialog())); },),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              notificationContainer(),
              SizedBox(height: 12),
              notificationContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class notificationContainer extends StatelessWidget {
  const notificationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffCCCCCC), width: 1)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(width: 1, color: Color(0xffB3B3B3))
              ),
              child: Image.asset("assets/images/CofsilsOrange.png"),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.55,
                  child: RichText(
                    softWrap: true,
                    text: TextSpan(
                      text: "Cofsils Orange Lozenges Strip of 10\n",
                      style: TextStyle(
                          height: 1.4,
                          fontFamily: "Inter",
                          color: Color(0xff333333),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                          "Every day, 8PM",
                          style: TextStyle(
                              decoration:
                              TextDecoration.none,
                              color: Color(0xff333333),
                              fontFamily: "Inter",
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            Spacer(),
            Icon(Icons.more_horiz, size: 20, color: Color(0xff666666),)
          ],
        ),
      ),
    );
  }
}

