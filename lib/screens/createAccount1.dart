import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/auth_controller.dart';
import 'createAccount2.dart';
import 'login.dart';

class createAccount1 extends StatefulWidget {
  @override
  _createAccount1State createState() => _createAccount1State();
}

class _createAccount1State extends State<createAccount1> {
  AuthController authController = Get.find();
  bool _isFormValid = false;
  TextEditingController emailTextControlller = TextEditingController();

  void _checkFormValidity() {
    setState(() {
      // Update the form validity based on the input fields' status
      _isFormValid =
          emailTextControlller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 45),
                Image.asset("assets/images/dummy-logo.png", width: 125, height: 125),
                SizedBox(height: 20),
                Text("Create account", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 20)),
               SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Email address", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xff333333), fontSize: 15))),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontFamily: "Inter", color: Color(0xff333333e), fontSize: 15),
                  controller: emailTextControlller,
                  onChanged: (value) => _checkFormValidity(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Write your email address',
                    hintStyle: TextStyle(fontFamily: "Inter", color: Color(0xff999999), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff999999),
                        width: 1
                      ),
                      borderRadius: BorderRadius.circular(5)
                    ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xff999999),
                              width: 1
                          ),
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                 // textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By signing up, you agree to Oliver’s ",
                    style: TextStyle(
                        color: Color(0xff666666),
                        fontFamily: "Inter",
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.6),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Terms of Service & Privacy Policy",
                        style: TextStyle(
                            color: Color(0xff666666),
                            fontFamily: "Inter",
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height*0.28
                ),
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
                    onPressed: _isFormValid ? () => Navigator.push(context, MaterialPageRoute(builder: (context) => createAccount2(emailAdress: emailTextControlller.text,))) : null, // Disable the button if the form is not valid
                    child: Text('Create account', style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 16)),
                  ),
                ),
                SizedBox(height: 12),
                RichText(
                  // textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontFamily: "Inter",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.6),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                        text: "Login",
                        style: TextStyle(
                            color: Color(0xff0F9BA1),
                            fontFamily: "Inter",
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
