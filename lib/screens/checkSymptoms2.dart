import 'package:flutter/material.dart';

import 'checkSymptoms3.dart';

class checkSymptoms2 extends StatefulWidget {
  const checkSymptoms2({Key? key}) : super(key: key);

  @override
  State<checkSymptoms2> createState() => _checkSymptoms2State();
}

class _checkSymptoms2State extends State<checkSymptoms2> {

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
              Text("What is your gender?", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 17)),
              SizedBox(height: 10),
              InkWell(
                onTap: (){
                  setState(() {
                    maleContainer = activeColor;
                    femaleContainer = inactiveColor;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    border: Border.all(width: 1.5, color: maleContainer),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(Icons.male, color: Color(0xff333333), size: 24,),
                      SizedBox(width: 10),
                      Text("Male", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 15))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              InkWell(
                onTap: (){
                  setState(() {
                    femaleContainer = activeColor;
                    maleContainer = inactiveColor;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      border: Border.all(width: 1.5, color: femaleContainer),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(Icons.male, color: Color(0xff333333), size: 24,),
                      SizedBox(width: 10),
                      Text("Female", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 15))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("How old are you?", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 17)),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: TextFormField(
                  controller: ageTextControlller,
                  onChanged: (value) => _checkFormValidity(),
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: Color(0xff666666),
                      fontSize: 15),
                  decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Input your age',
                      hintStyle: TextStyle(
                          fontFamily: "Inter",
                          color: Color(0xff999999),
                          fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff999999), width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff999999), width: 1),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              SizedBox(height: 30),
              Text("What are you feeling?", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 17)),
              SizedBox(height: 3),
              Text("Add as many symptoms as you can for more accurate results", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 15)),
              SizedBox(height: 12),
              TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                    fontFamily: "Inter",
                    color: Color(0xff666666),
                    fontSize: 15),
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: 'Search symptoms here',
                    hintStyle: TextStyle(
                        fontFamily: "Inter",
                        color: Color(0xff999999),
                        fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xff999999), width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xff999999), width: 1),
                        borderRadius: BorderRadius.circular(5))),
              ),
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5);
                        else if (states.contains(MaterialState.disabled))
                          return Color(0x300F9BA1);
                        return Color(0xff0F9BA1);
                      },
                    ),
                  ),
                  onPressed: _isFormValid
                      ? () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => checkSymptoms3()))
                      : null,
                  // Disable the button if the form is not valid
                  child: Text('Continue',
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: Color(0xffffffff),
                          fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







