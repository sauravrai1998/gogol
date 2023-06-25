import 'package:flutter/material.dart';
import 'package:gogol/screens/ProductsGridView.dart';

class limitedTimeOffers extends StatefulWidget {
  const limitedTimeOffers({Key? key}) : super(key: key);

  @override
  State<limitedTimeOffers> createState() => _limitedTimeOffersState();
}

class _limitedTimeOffersState extends State<limitedTimeOffers> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text("Limited time offer", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
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
              SizedBox(height: 10),
              Row(
                children: [
                  Text("Promotion ends in",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333),
                          fontSize: 13)),
                  SizedBox(width: 8),
                  Container(
                    height: 16,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Color(0xffE3513E),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 4),
                        Icon(Icons.access_time,
                            size: 11, color: Color(0xffffffff)),
                        Spacer(),
                        Text("01:22:09",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                color: Color(0xffffffff),
                                fontSize: 10)),
                        SizedBox(width: 5)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ProductsGridView()
            ],
          ),
        ),
      ),
    );
  }
}








