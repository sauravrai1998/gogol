import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gogol/screens/createAccount1.dart';

import '../controllers/auth_controller.dart';
import 'forgotPassword.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.find();
  bool _isFormValid = false;
  bool showPassword = true;
  TextEditingController emailTextControlller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _checkFormValidity() {
    setState(() {
      // Update the form validity based on the input fields' status
      _isFormValid = emailTextControlller.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
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
                Image.asset("assets/images/dummy-logo.png",
                    width: 125, height: 125),
                SizedBox(height: 20),
                Text("Login",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff333333),
                        fontSize: 20)),
                SizedBox(height: 32),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email address",
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
                  controller: emailTextControlller,
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
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                            fontSize: 15))),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: showPassword,
                  controller: passwordController,
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: Color(0xff333333),
                      fontSize: 15),
                  onChanged: (value) => _checkFormValidity(),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(
                          Icons.remove_red_eye_sharp,
                          color: Color(0xff666666),
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Set your password',
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => forgotPassword())),
                    child: Text("Forgot Password",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff0F9BA1),
                            fontSize: 15)),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                        ? () async {
                      await authController.login(
                          emailTextControlller.text, passwordController.text, context);
                    }
                        : null,
                    // Disable the button if the form is not valid
                    child: Obx(
                            () => authController.isLoading.value?const CircularProgressIndicator(): Text('Login',
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                              fontSize: 16)),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => createAccount1()));
                          },
                        text: "Create account",
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
