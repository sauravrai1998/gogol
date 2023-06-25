import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class productChat extends StatefulWidget {
  const productChat({Key? key}) : super(key: key);

  @override
  State<productChat> createState() => _productChatState();
}

class _productChatState extends State<productChat> {
  File? image;

  Future getImageCamera() async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image==null) return;
  }
  Future getImageGallery() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null) return;
  }

  List<String> quickMessage = [
    'Is it available?',
    'What is it for?',
    'Does it cause any allergy?',
  ];

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
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xffCCCCCC), width: 1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(width: 1, color: Color(0xffB3B3B3))
                              ),
                              child: Image.asset("assets/images/CofsilsOrange.png"),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  child: RichText(
                                    softWrap: true,
                                    text: TextSpan(
                                      text: "Cofsils Orange Lozenges Strip of 10\n",
                                      style: TextStyle(
                                          height: 1.4,
                                          fontFamily: "Inter",
                                          color: Color(0xff333333),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                          "\$32",
                                          style: TextStyle(
                                              decoration:
                                              TextDecoration.none,
                                              color: Color(0xff0F9BA1),
                                              fontFamily: "Inter",
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.close, size: 20, color: Color(0xff666666),)
                          ],
                        ),
                      ),
                    ),
                  )
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
            height: 125,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: quickMessage.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 8),
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(width: 1, color: Color(0xffE5E5E5))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
                              child: Center(child: Text(quickMessage[index], style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 13))),
                            ),
                          ),
                        ),
                      );
                    },
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




