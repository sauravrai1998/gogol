import 'package:flutter/material.dart';

class addAddress extends StatefulWidget {
  const addAddress({Key? key}) : super(key: key);

  @override
  State<addAddress> createState() => _addAddressState();
}

class _addAddressState extends State<addAddress> {

  bool _isFormValid = false;
  bool showPassword = true;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController fullAddressController = TextEditingController();
  TextEditingController parishController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController communityController = TextEditingController();

  void _checkFormValidity() {
    setState(() {
      // Update the form validity based on the input fields' status
      _isFormValid = fullNameController.text.isNotEmpty &&
          telephoneController.text.isNotEmpty &&
          fullAddressController.text.isNotEmpty && parishController.text.isNotEmpty && townController.text.isNotEmpty && communityController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Add address", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp,
              size: 24, color: Color(0xffffffff)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
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
                  SizedBox(height: 20),
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
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 5,
              color: Color(0xffEEEEEE),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Full address",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              color: Color(0xff333333),
                              fontSize: 15))),
                  SizedBox(height: 10),
                  TextFormField(
                    maxLines: 6,
                    controller: fullAddressController,
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: Color(0xff333333),
                        fontSize: 15),
                    onChanged: (value) => _checkFormValidity(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: 'Write your full address',
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
                      child: Text("Parish",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              color: Color(0xff333333),
                              fontSize: 15))),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: parishController,
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: Color(0xff333333),
                        fontSize: 15),
                    onChanged: (value) => _checkFormValidity(),
                    decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        hintText: 'Write your parish',
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
                      child: Text("Town",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              color: Color(0xff333333),
                              fontSize: 15))),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: townController,
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: Color(0xff333333),
                        fontSize: 15),
                    onChanged: (value) => _checkFormValidity(),
                    decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        hintText: 'Write your town',
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
                      child: Text("Community",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              color: Color(0xff333333),
                              fontSize: 15))),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: communityController,
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: Color(0xff333333),
                        fontSize: 15),
                    onChanged: (value) => _checkFormValidity(),
                    decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        hintText: 'Write your community',
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
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 80, color: Colors.black12),
              BoxShadow(color: Colors.white, offset: Offset(0, 2), spreadRadius: 1),
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width-30,
                height: 40,
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
                        width: 220,
                        backgroundColor: Color(0xffEAF4ED),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(width: 20, height: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff2D8E48)
                              ),
                              child: Center(child: Icon(Icons.check, color: Colors.white, size: 16,)),
                            ),
                            SizedBox(width: 10),
                            Flexible(child: Text("Address succesfully added", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 13)))
                          ],
                        )
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } : null,
                  // Disable the button if the form is not valid
                  child: Text('Add address',
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







