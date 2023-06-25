import 'package:flutter/material.dart';

class notifications extends StatefulWidget {
  const notifications({Key? key}) : super(key: key);

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Notifications", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp,
              size: 24, color: Color(0xffffffff)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              notifcation_row(),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Color(0xffE6E6E6),
              ),
              SizedBox(height: 25),
              notifcation_row()
            ],
          ),
        ),
      ),
    );
  }
}

class notifcation_row extends StatelessWidget {
  const notifcation_row({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(width: 1, color: Color(0xffE5E5E5))
          ),
          child: Image.asset("assets/images/CofsilsOrange.png"),
        ),
        SizedBox(width: 10),
        RichText(
          softWrap: true,
          text: TextSpan(
            text: "Order Received\n",
            style: TextStyle(
                color: Color(0xff333333),
                fontFamily: "Inter",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                height: 1.6),
            children: <TextSpan>[
              TextSpan(
                text: "Thank you for ordering with us.\nWe’re processing your order now",
                style: TextStyle(
                    color: Color(0xff333333),
                    fontFamily: "Inter",
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Spacer(),
        RichText(
          textAlign: TextAlign.right,
          softWrap: true,
          text: TextSpan(
            text: "13/03/23\n",
            style: TextStyle(
                color: Color(0xff666666),
                fontFamily: "Inter",
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 1.6),
            children: <TextSpan>[
              TextSpan(
                text: "3 minutes ago",
                style: TextStyle(
                    color: Color(0xff666666),
                    fontFamily: "Inter",
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    );
  }
}






