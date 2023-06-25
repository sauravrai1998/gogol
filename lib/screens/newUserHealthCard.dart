import 'package:flutter/material.dart';
import 'package:gogol/screens/addReminderDialog.dart';

import 'addHealthCard.dart';

class newUserHealthCard extends StatefulWidget {
  const newUserHealthCard({Key? key}) : super(key: key);

  @override
  State<newUserHealthCard> createState() => _newUserHealthCardState();
}

class _newUserHealthCardState extends State<newUserHealthCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("My health card", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp,
              size: 24, color: Color(0xffffffff)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.15),
            Image.asset("assets/images/card-illustration.png", width: 120, height: 120),
            SizedBox(height: 15),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "You haven’t added any\nhealth card yet\n",
                style: TextStyle(
                    height: 1.4,
                    fontFamily: "Inter",
                    color: Color(0xff333333),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(
                    text:
                    "Add card now to get promotion",
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
                    return addHealthCard();
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
                  child: Text("Add health card", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
