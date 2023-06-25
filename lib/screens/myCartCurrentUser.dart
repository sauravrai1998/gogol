import 'package:flutter/material.dart';
import 'package:gogol/screens/changeAddress.dart';
import 'package:gogol/screens/orderReceived.dart';
import 'addAddress.dart';

class myCartCurrentUser extends StatefulWidget {
  const myCartCurrentUser({Key? key}) : super(key: key);

  @override
  State<myCartCurrentUser> createState() => _myCartCurrentUserState();
}

class _myCartCurrentUserState extends State<myCartCurrentUser> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0C7C81),
          title: Text("My cart", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.close,
                  size: 20, color: Color(0xffffffff)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Delivery address", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 13)),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => changeAddress()));
                            },
                            child: Text("Change address", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xff0F9BA1), fontSize: 15))),


                      ],
                    ),
                    SizedBox(height: 10),
                    Text(textAlign: TextAlign.justify, "Lorem ipsum dolor sit amet consectetur. Fames dictumst auctor at aliquam pulvinar consectetur aliquam viverra vel.", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 15)),
                    SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        text: "Parish: ",
                        style: TextStyle(
                            height: 1.4,
                            fontFamily: "Inter",
                            color: Color(0xff333333),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            "Lorem Ipsum",
                            style: TextStyle(
                                decoration:
                                TextDecoration.none,
                                color: Color(0xff333333),
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Town: ",
                        style: TextStyle(
                            height: 1.4,
                            fontFamily: "Inter",
                            color: Color(0xff333333),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            "Lorem Ipsum",
                            style: TextStyle(
                                decoration:
                                TextDecoration.none,
                                color: Color(0xff333333),
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Community: ",
                        style: TextStyle(
                            height: 1.4,
                            fontFamily: "Inter",
                            color: Color(0xff333333),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            "Lorem Ipsum",
                            style: TextStyle(
                                decoration:
                                TextDecoration.none,
                                color: Color(0xff333333),
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 5,
                color: Color(0xffEEEEEE),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your carts", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 13)),
                    SizedBox(height: 12),
                    cartItem(),
                    SizedBox(height: 20),
                    Container(width: MediaQuery.of(context).size.width, height: 2, color: Color(0xffEEEEEE)),
                    SizedBox(height: 20),
                    cartItem()

                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 5,
                color: Color(0xffEEEEEE),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payment methods", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 13)),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(width: 1, color: Color(0xffB3B3B3))
                          ),
                          child: Image.asset("assets/images/visa-logo.png"),
                        ),
                        SizedBox(width: 15),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: RichText(
                            softWrap: true,
                            text: TextSpan(
                              text: "Credit card / Debit card\n",
                              style: TextStyle(
                                  height: 1.4,
                                  fontFamily: "Inter",
                                  color: Color(0xff333333),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                  "*1329",
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
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 20, color: Color(0xff666666),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 80, color: Color(0x08000000)),
                BoxShadow(color: Colors.white, offset: Offset(0, 2), spreadRadius: 0),
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 75,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Total", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 15)),
                      Spacer(),
                      Text("\$0.00", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 15))
                    ],
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => orderReceived()));
                    },
                    child: Container(width: MediaQuery.of(context).size.width-30, height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xff0F9BA1),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(child: Text("Checkout", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

class cartItem extends StatefulWidget {
  const cartItem({Key? key}) : super(key: key);

  @override
  State<cartItem> createState() => _cartItemState();
}

class _cartItemState extends State<cartItem> {
  bool isChecked = false;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Color(0xff0c7c81),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
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
              width: MediaQuery.of(context).size.width*0.5,
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
                      "10 tablets",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    setState((){
                      quantity--;
                    });
                  },
                  child: Container(width: 20, height: 20, color: Color(0xff0c7c81),
                    child: Center(child: Icon(Icons.remove, size: 13, color: Colors.white,)),
                  ),
                ),
                SizedBox(width: 10),
                Text("$quantity", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 15)),
                SizedBox(width: 10),
                InkWell(
                  onTap: (){
                    setState((){
                      quantity++;
                    });
                  },
                  child: Container(width: 20, height: 20, color: Color(0xff0c7c81),
                    child:
                    Center(child: Icon(Icons.add, size: 13, color: Colors.white,)),
                  ),
                ),
              ],
            )
          ],
        ),
        Spacer(),
        Text("\$12.4", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 15))
      ],
    );
  }
}








