import 'package:flutter/material.dart';
import 'package:gogol/screens/healthcardCurrentUser.dart';

class addHealthCard2 extends StatefulWidget {
  const addHealthCard2({Key? key}) : super(key: key);

  @override
  State<addHealthCard2> createState() => _addHealthCard2State();
}

class _addHealthCard2State extends State<addHealthCard2> {
  bool _isFormValid = false;
  TextEditingController form1Controller = TextEditingController();
  TextEditingController form2Controller = TextEditingController();

  void _checkFormValidity() {
    setState(() {
      // Update the form validity based on the input fields' status
      _isFormValid = form1Controller.text.isNotEmpty &&
          form2Controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Add health card",
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
            children: [
              SizedBox(height: 15),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Form 1",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          fontSize: 15))),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: form1Controller,
                style: TextStyle(
                    fontFamily: "Inter",
                    color: Color(0xff333333),
                    fontSize: 15),
                onChanged: (value) => _checkFormValidity(),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: 'Search medicine name here',
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
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Form 2",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          fontSize: 15))),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: form2Controller,
                style: TextStyle(
                    fontFamily: "Inter",
                    color: Color(0xff333333),
                    fontSize: 15),
                onChanged: (value) => _checkFormValidity(),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: 'Search medicine here',
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
              SizedBox(height: 100),
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
              onPressed: _isFormValid ? (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => healthCardCurrentUser()));
                final snackBar = SnackBar(
                    duration: Duration(seconds: 3),
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.5, color: Color(0xffABD2B6)),
                        borderRadius: BorderRadius.circular(3)
                    ),
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    width: 300,
                    backgroundColor: Color(0xffEAF4ED),
                    content: Row(
                      children: [
                        Container(width: 20, height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff2D8E48)
                          ),
                          child: Center(child: Icon(Icons.check, color: Colors.white, size: 16,)),
                        ),
                        SizedBox(width: 10),
                        Flexible(child: Text("Your health card is successfully added!", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 13)))
                      ],
                    )
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }  : null,
              // Disable the button if the form is not valid
              child: Text('Continue',
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      color: Color(0xffffffff),
                      fontSize: 16)),
            ),
          ),
        ),
      ),
    );
  }
}
