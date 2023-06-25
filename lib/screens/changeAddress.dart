import 'package:flutter/material.dart';

import 'addAddress.dart';

class changeAddress extends StatefulWidget {
  const changeAddress({Key? key}) : super(key: key);

  @override
  State<changeAddress> createState() => _changeAddressState();
}

class _changeAddressState extends State<changeAddress> {

  int selectedRadio=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
    title: Text("Change address", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
    centerTitle: true,
    leading: IconButton(
    icon: Icon(Icons.arrow_back_ios_new_sharp,
    size: 24, color: Color(0xffffffff)),
    onPressed: () {
    Navigator.pop(context);
    },
    ),
    ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  activeColor: Color(0xff0c7c81),
                  value: 0, groupValue: selectedRadio, onChanged: (int? val) {
                  if(val!= null)
                  {
                    setState(() => selectedRadio=val);
                  }
                },
                ),
                Container(
                  width: MediaQuery.of(context).size.width-75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        softWrap: true,
                          textAlign: TextAlign.justify, "Lorem ipsum dolor sit amet consectetur. Fames dictumst auctor at aliquam pulvinar consectetur aliquam viverra vel.", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 15)),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          text: "Parish: ",
                          style: TextStyle(
                              height: 1.4,
                              fontFamily: "Inter",
                              color: Color(0xff333333),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                              "Lorem Ipsum",
                              style: TextStyle(
                                  decoration:
                                  TextDecoration.none,
                                  color: Color(0xff333333),
                                  fontFamily: "Inter",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Town: ",
                          style: TextStyle(
                              height: 1.4,
                              fontFamily: "Inter",
                              color: Color(0xff333333),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                              "Lorem Ipsum",
                              style: TextStyle(
                                  decoration:
                                  TextDecoration.none,
                                  color: Color(0xff333333),
                                  fontFamily: "Inter",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Community: ",
                          style: TextStyle(
                              height: 1.4,
                              fontFamily: "Inter",
                              color: Color(0xff333333),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                              "Lorem Ipsum",
                              style: TextStyle(
                                  decoration:
                                  TextDecoration.none,
                                  color: Color(0xff333333),
                                  fontFamily: "Inter",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Color(0xffEEEEEE),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => addAddress()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 20, color: Color(0xff0F9BA1)),
                SizedBox(width: 5),
                Text("Add address", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xff0F9BA1), fontSize: 15))
              ],
            ),
          )
        ],
      ),
    );
  }
}
