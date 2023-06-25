import 'package:flutter/material.dart';
import 'package:gogol/screens/addReminderDialog.dart';

import 'chatPage.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Chat", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => chatPage()));
                },
                  child: chatContainer()
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Color(0xffE5E5E5),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => chatPage()));
                },
                  child: chatContainer())
            ],
          ),
        ),
      ),
    );
  }
}

class chatContainer extends StatelessWidget {
  const chatContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Color(0xffD9D9D9),
        ),
        SizedBox(width: 10),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            text: "Oliver's Pharmacy\n",
            style: TextStyle(
                height: 1.5,
                fontFamily: "Inter",
                color: Color(0xff333333),
                fontSize: 15,
                fontWeight: FontWeight.w600),
            children: <TextSpan>[
              TextSpan(
                text:
                "Hi, how can I help you?",
                style: TextStyle(
                    color: Color(0xff666666),
                    fontFamily: "Inter",
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Spacer(),
        Column(
          children: [
            Text("05/03", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff666666), fontSize: 13)),
            SizedBox(height: 5),
            CircleAvatar(backgroundColor: Color(0xffE3513E), radius: 12,
            child: Text("1", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 13)),
            )
          ],
        )
      ],
    );
  }
}

