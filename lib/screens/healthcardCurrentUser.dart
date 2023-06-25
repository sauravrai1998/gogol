import 'package:flutter/material.dart';
import 'package:gogol/screens/addReminderDialog.dart';

import 'addHealthCard.dart';


class healthCardCurrentUser extends StatefulWidget {
  const healthCardCurrentUser({Key? key}) : super(key: key);

  @override
  State<healthCardCurrentUser> createState() => _healthCardCurrentUserState();
}

class _healthCardCurrentUserState extends State<healthCardCurrentUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp,
              size: 24, color: Color(0xffffffff)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xff0C7C81),
        title: Text("My health card", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(icon: Icon(Icons.add, size: 24, color: Colors.white,), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => addHealthCard())); },),
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
              healthCardContainer(),
              SizedBox(height: 12),
              healthCardContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class healthCardContainer extends StatelessWidget {
  const healthCardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            child: Image.asset("assets/images/healthcard1.png"),
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
                    text: "Medecus health\n",
                    style: TextStyle(
                        height: 1.4,
                        fontFamily: "Inter",
                        color: Color(0xff333333),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                        "Added 15 October, 2022",
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
        ],
      ),
    );
  }
}

