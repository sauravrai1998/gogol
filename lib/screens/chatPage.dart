import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class chatPage extends StatefulWidget {
  const chatPage({Key? key}) : super(key: key);

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  File? image;

  Future getImageCamera() async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image==null) return;
  }
  Future getImageGallery() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Color(0xff0C7C81),
        title: Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xffD9D9D9),
            ),
            SizedBox(width: 8),
            Text("Oliver's Pharmacy", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp,
              size: 24, color: Color(0xffffffff)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 1, color: Color(0xffE5E5E5))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text("12 January 2023", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 10))),
                  ),
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE7F5F6),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), topRight: Radius.circular(15), topLeft: Radius.circular(15))
                    ),
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: "Hello, do you have a medicine for cold and flu?\n",
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: "Inter",
                              color: Color(0xff333333),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                              "12.34pm",
                              style: TextStyle(
                                  color: Color(0xff666666),
                                  fontFamily: "Inter",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), topRight: Radius.circular(15), topLeft: Radius.circular(15))
                    ),
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: "Sure, how severe are your cold and flu?\n",
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: "Inter",
                              color: Color(0xff333333),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                              "12.35pm",
                              style: TextStyle(
                                  color: Color(0xff666666),
                                  fontFamily: "Inter",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
       bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Color(0xffE6E6E6), width: 1)
              )
          ),
          child: Container(
            height: 115,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
                  child: InkWell(
                    onTap: (){
                      getImageGallery();
                    },
                    child: Container(
                      width: 135,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1, color: Color(0xffE5E5E5))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Center(child: Text("Upload preception", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 13))),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Color(0xffE6E6E6),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  color: Color(0xffE5E5E5),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(width: 1, color: Color(0xff666666))
                        ),
                        child: Center(child: Icon(Icons.add, color: Color(0xff666666), size: 20,)),
                      ),
                      SizedBox(width: 10),
                      
                      Container(
                        width: MediaQuery.of(context).size.width-110,
                        height: 40,
                        child: TextFormField(
                          style: TextStyle(fontFamily: "Inter", color: Color(0xff333333), fontSize: 15),
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset("assets/images/emoji.png", width: 20, height: 20,),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none)
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: (){
                          getImageCamera();
                        },
                          child: Icon(Icons.camera_alt_rounded, color: Color(0xff666666), size: 24,)),
                      SizedBox(width: 20)
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
