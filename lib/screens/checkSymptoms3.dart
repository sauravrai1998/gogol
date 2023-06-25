import 'package:flutter/material.dart';

import 'ProductsGridView.dart';
import 'home.dart';

class checkSymptoms3 extends StatefulWidget {
  const checkSymptoms3({Key? key}) : super(key: key);

  @override
  State<checkSymptoms3> createState() => _checkSymptoms3State();
}

class _checkSymptoms3State extends State<checkSymptoms3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Check symptoms",
            style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                color: Color(0xffffffff),
                fontSize: 15)),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text("Result",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff666666),
                      fontSize: 13)),
              SizedBox(height: 3),
              Text("You possibly get fever",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333),
                      fontSize: 17)),
              SizedBox(height: 8),
              Text(
                  "Lorem ipsum dolor sit amet consectetur. Vel in dui sit accumsan morbi augue fermentum mi. In a sit ridiculus mi turpis nullam elementum volutpat euismod.",
                  style: TextStyle(
                      height: 1.4,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff333333),
                      fontSize: 15)),
              SizedBox(height: 50),
              Text("Recommended medicines",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333),
                      fontSize: 17)),
              SizedBox(height: 20),
              ProductsGridView()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 80, color: Color(0x08000000)),
          BoxShadow(color: Colors.white, offset: Offset(0, 2), spreadRadius: 0),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 45,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => home()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xff0F9BA1),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text("Continue",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                            fontSize: 15))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
