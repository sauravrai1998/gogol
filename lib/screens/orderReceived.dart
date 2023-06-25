import 'package:flutter/material.dart';

import 'home.dart';

class orderReceived extends StatefulWidget {
  const orderReceived({Key? key}) : super(key: key);

  @override
  State<orderReceived> createState() => _orderReceivedState();
}

class _orderReceivedState extends State<orderReceived> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.28),
            Image.asset("assets/images/order-received.png", width: 197, height: 182),
            SizedBox(height: 15),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Your order has been received!\n",
                style: TextStyle(
                    height: 1.4,
                    fontFamily: "Inter",
                    color: Color(0xff333333),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(
                    text:
                    "Hang tight! We’re processing your\norder now",
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
              },
              child: Container(
                width: 168,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xff0c7c81),
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Center(
                  child: Text("Continue shopping", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
