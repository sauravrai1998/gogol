import 'package:flutter/material.dart';

import 'checkSymptoms2.dart';

class advertisement extends StatefulWidget {
  const advertisement({Key? key}) : super(key: key);

  @override
  State<advertisement> createState() => _advertisementState();
}

class _advertisementState extends State<advertisement> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Set advertisement", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: 166,
                decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffB3B3B3), width: 1.5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 18, color: Colors.black),
                    SizedBox(width: 10),
                    Text("Upload Advertisement", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff000000), fontSize: 15))
                  ],
                ),
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.44,
                    height: 166,
                    decoration: BoxDecoration(
                        color: Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xffB3B3B3), width: 1.5)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 18, color: Colors.black),
                        SizedBox(width: 10),
                        Text(textAlign: TextAlign.center, "Upload\nAdvertisement", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff000000), fontSize: 15))
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.44,
                    height: 166,
                    decoration: BoxDecoration(
                        color: Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xffB3B3B3), width: 1.5)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 18, color: Colors.black),
                        SizedBox(width: 10),
                        Text(textAlign: TextAlign.center, "Upload\nAdvertisement", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff000000), fontSize: 15))
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 112,
                decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xffB3B3B3), width: 1.5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 18, color: Colors.black),
                    SizedBox(width: 10),
                    Text("Upload Advertisement", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff000000), fontSize: 15))
                  ],
                ),
              ),

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
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xff0F9BA1),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text("Submit",
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







