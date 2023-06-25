import 'package:flutter/material.dart';
import 'package:gogol/screens/productDetailsPage.dart';

import 'ProductsGridView.dart';

class categorySpecificPage extends StatefulWidget {
  const categorySpecificPage({Key? key}) : super(key: key);

  @override
  State<categorySpecificPage> createState() => _categorySpecificPageState();
}

class _categorySpecificPageState extends State<categorySpecificPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              color: Color(0xff0C7C81),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 20),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_sharp,
                          size: 24, color: Color(0xffffffff)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: Color(0xff333333),
                            fontSize: 15),
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xff999999),
                              size: 24,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            hintText: 'Search medicines here',
                            hintStyle: TextStyle(
                                fontFamily: "Inter",
                                color: Color(0xff999999),
                                fontSize: 15),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xffffffff), width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xffffffff), width: 1),
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recommended for you in "Cold and Flu"',
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                          fontSize: 15)),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffE7F5F6),
                            border:
                            Border.all(color: Color(0xff0E8C91), width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 4, bottom: 4),
                          child: Center(
                            child: Text("All Products",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff333333),
                                    fontSize: 13)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: Color(0xff999999), width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 4, bottom: 4),
                          child: Center(
                            child: Text("Super sale",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff333333),
                                    fontSize: 13)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: Color(0xff999999), width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 4, bottom: 4),
                          child: Center(
                            child: Text("Deal",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff333333),
                                    fontSize: 13)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: Color(0xff999999), width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 4, bottom: 4),
                          child: Center(
                            child: Text("Hot selling",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff333333),
                                    fontSize: 13)),
                          ),
                        ),
                      ),
                    ],
                  ),
                 ProductsGridView()
                ],
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
