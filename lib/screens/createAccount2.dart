import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/auth_controller.dart';
import '../models/profile.dart';
import '../repository/auth_repo.dart';
import 'home.dart';

class createAccount2 extends StatefulWidget {
  createAccount2({Key? key, required this.emailAdress}) : super(key: key);
  String emailAdress;

  @override
  State<createAccount2> createState() => _createAccount2State();
}

class _createAccount2State extends State<createAccount2> {
  AuthController authController = Get.find();
  bool _isFormValid = false;
  bool showPassword = true;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _checkFormValidity() {
    setState(() {
      // Update the form validity based on the input fields' status
      _isFormValid = fullNameController.text.isNotEmpty &&
          telephoneController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_sharp,
                          size: 24, color: Color(0xff666666)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 15),
                    Text("Create account",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            color: Color(0xff333333),
                            fontSize: 20)),
                  ],
                ),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email address",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                            fontSize: 15))),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff999999), width: 1)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        widget.emailAdress,
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: Color(0xff333333),
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Full name",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                            fontSize: 15))),
                SizedBox(height: 10),
                TextFormField(
                  controller: fullNameController,
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: Color(0xff333333),
                      fontSize: 15),
                  onChanged: (value) => _checkFormValidity(),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Write your full name',
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
                    child: Text("Telephone number",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                            fontSize: 15))),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: telephoneController,
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: Color(0xff333333),
                      fontSize: 15),
                  onChanged: (value) => _checkFormValidity(),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Write your telephone number',
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.20),
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
                    onPressed: _isFormValid ? () async {
                      await authController.register(widget.emailAdress.toString(),passwordController.text,context);
                      ProfileModel user = ProfileModel(
                          imageUrl: '',
                          // companyName: companyName,
                          username: fullNameController.text,
                          mobile: telephoneController.text,
                        email: widget.emailAdress
                      );
                      await AuthRepo.instance.createFirestoreProfile(user);
                    } : null,
                    // Disable the button if the form is not valid
                    child: Obx(

                        () => authController.isLoading.value?const CircularProgressIndicator():Text('Create account',
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                              fontSize: 16)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


