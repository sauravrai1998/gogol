import 'package:flutter/material.dart';

import 'ProductsGridView.dart';

class myCartEmpty extends StatefulWidget {
  const myCartEmpty({Key? key}) : super(key: key);

  @override
  State<myCartEmpty> createState() => _myCartEmptyState();
}

class _myCartEmptyState extends State<myCartEmpty> {

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                   Image.asset("assets/images/cart-icon.png", width: 115, height: 115),
                    SizedBox(height: 15),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Your cart is empty\n",
                        style: TextStyle(
                          height: 1.5,
                            fontFamily: "Inter",
                            color: Color(0xff333333),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            "Start shopping now",
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
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return Color(0xff0F9BA1);
                          },
                        ),
                      ),
                      onPressed: (){},
                      child: Text('Start shopping', style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 5,
              color: Color(0xffEEEEEE),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recommended products", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 15)),
                  SizedBox(height: 20),
                  ProductsGridView()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







