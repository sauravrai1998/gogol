import 'package:flutter/material.dart';
import 'package:gogol/screens/addHealthCard2.dart';

import 'checkSymptoms3.dart';

class addHealthCard extends StatefulWidget {
  const addHealthCard({Key? key}) : super(key: key);

  @override
  State<addHealthCard> createState() => _addHealthCardState();
}

class _addHealthCardState extends State<addHealthCard> {

  Color activeColor = Color(0xff0F9BA1);
  Color inactiveColor = Color(0xffB3B3B3);
  Color maleContainer = Color(0xffB3B3B3);
  Color femaleContainer = Color(0xffB3B3B3);

  bool _isFormValid = false;
  TextEditingController ageTextControlller = TextEditingController();

  void _checkFormValidity() {
    setState(() {
      // Update the form validity based on the input fields' status
      _isFormValid = ageTextControlller.text.isNotEmpty;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Add health card", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
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
              SizedBox(height: 15),
              Text("Select which health card you have", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 15)),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.44,
                    height: 121,
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xffB3B3B3), width: 1.5)
                    ),
                    child: Image.asset("assets/images/healthcard1.png"),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.44,
                    height: 121,
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xffB3B3B3), width: 1.5)
                    ),
                    child: Image.asset("assets/images/healthcard2.png"),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.44,
                    height: 121,
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xffB3B3B3), width: 1.5)
                    ),
                    child: Image.asset("assets/images/healthcard1.png"),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.44,
                    height: 121,
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xffB3B3B3), width: 1.5)
                    ),
                    child: Image.asset("assets/images/healthcard5.png"),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.44,
                    height: 121,
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xffB3B3B3), width: 1.5)
                    ),
                    child: Image.asset("assets/images/healthcard4.png"),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.44,
                    height: 121,
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xffB3B3B3), width: 1.5)
                    ),
                    child: Image.asset("assets/images/healthcard1.png"),
                  ),
                ],
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => addHealthCard2()));
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
        )
    );
  }
}







