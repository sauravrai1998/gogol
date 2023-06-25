import 'package:flutter/material.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  bool _isFormValid = false;
  TextEditingController emailController = TextEditingController();

  void _checkFormValidity() {
    setState(() {
      // Update the form validity based on the input fields' status
      _isFormValid = emailController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Reset password", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
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
              SizedBox(height: 24),
              Text("Enter your email below to get password reset instructions", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 15)),
              SizedBox(height: 24),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Registered email address",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          fontSize: 15))),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    fontFamily: "Inter",
                    color: Color(0xff666666),
                    fontSize: 15),
                controller: emailController,
                onChanged: (value) => _checkFormValidity(),
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: 'Write your email address',
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
              SizedBox(height: 30),
              SizedBox(height: 100),
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
                  onPressed: _isFormValid ? (){
                    final snackBar = SnackBar(
                      duration: Duration(seconds: 3),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.5, color: Color(0xffABD2B6)),
                        borderRadius: BorderRadius.circular(3)
                      ),
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      width: 290,
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
                            Flexible(child: Text("An email has been sent to your email", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 13)))
                          ],
                        )
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }  : null,
                  // Disable the button if the form is not valid
                  child: Text('Reset password',
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





