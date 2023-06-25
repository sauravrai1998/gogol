import 'package:flutter/material.dart';

import 'checkSymptoms2.dart';

class checkSymptoms extends StatefulWidget {
  const checkSymptoms({Key? key}) : super(key: key);

  @override
  State<checkSymptoms> createState() => _checkSymptomsState();
}

class _checkSymptomsState extends State<checkSymptoms> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Check symptoms", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
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
             Align(
               alignment: Alignment.center,
                 child: Image.asset("assets/images/check-symptoms-illustration.png", width: 120, height: 120)),
              SizedBox(height: 20),
              Text("Check your symptoms", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 17)),
              SizedBox(height: 8),
              Text("Feeling unwell? Take a short, 3-min assessments to know the possible causes of your symptoms. As a result, we will show you:\n • Possible causes of symptoms\n • Medicines you can take to cure the symptoms", style: TextStyle(height: 1.4, fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 15)),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  text: "Important to take note that:",
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: Color(0xff333333),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                      " this checkup is not diagnosis.",
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontFamily: "Inter",
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text:
                      " If you’re still feeling unwell, please see your doctor to get diagnosed. ",
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontFamily: "Inter",
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height-580),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => checkSymptoms2()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xff0c7c81),
                    borderRadius: BorderRadius.circular(3)
                  ),
                  child: Center(child: Text("Take assessment", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}







