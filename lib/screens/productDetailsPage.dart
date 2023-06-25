import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogol/screens/ProductsGridView.dart';
import 'package:gogol/screens/productChat.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_html/flutter_html.dart';
class productDetailsPage extends StatefulWidget {
  late QueryDocumentSnapshot<Object?> item;
  productDetailsPage(this.item, {Key? key}) : super(key: key);

  @override
  State<productDetailsPage> createState() => _productDetailsPageState();
}

class _productDetailsPageState extends State<productDetailsPage> {

  final pageController = PageController();
  int imageCount = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.item['description']);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff0C7C81),
        title: Text(widget.item['name'], style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15)),
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
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: PageView(
                  controller: pageController,
                  children: widget.item['imageUrl'].map<Widget>((dynamic document) {
                    setState(() {
                      imageCount += 1;
                    });
                    Map<String, dynamic> data = document as Map<String, dynamic>;
                    print('dsadsa');
                    print(document);
                    return Image.network(
                      data['downloadURL'],
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(width: MediaQuery.of(context).size.width, height: 1, color: Color(0xffE6E6E6),),
            SizedBox(height: 18),
            SmoothPageIndicator(
              controller: pageController,
              count: imageCount,
              effect: ExpandingDotsEffect(
                activeDotColor: Color(0xff0F9BA1),
                dotColor: Color(0xffE5E5E5),
                dotHeight: 12,
                dotWidth: 12,
                spacing: 10,
                expansionFactor: 6,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.item['name'], style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 15)),
                    SizedBox(height: 10),
                    Text("\$${widget.item['price']}", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff0F9BA1), fontSize: 15)),
                    SizedBox(height: 10),
                    Container(
                      width: 66,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xffFFE1E1),
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Center(child: Text("Super Sale", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 10))),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(width: MediaQuery.of(context).size.width, height: 5, color: Color(0xffE6E6E6)),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Html(data: widget.item['description'],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(width: MediaQuery.of(context).size.width, height: 5, color: Color(0xffE6E6E6)),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Related products", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xff333333), fontSize: 15)),
                    SizedBox(height: 20),
                    ProductsGridView()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 80, color: Colors.black12),
            BoxShadow(color: Colors.white, offset: Offset(0, 2), spreadRadius: 1),
           // BoxShadow(color: Colors.white, offset: Offset(0, 16)),
           // BoxShadow(color: Colors.white, offset: Offset(-16, -16)),
           // BoxShadow(color: Colors.white, offset: Offset(-16, 16)),
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffE5E5E5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => productChat()));
                    },
                      child: Center(child: Image.asset("assets/images/chat-icon.png"))),
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: (){
                  final snackBar = SnackBar(
                      duration: Duration(seconds: 3),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.5, color: Color(0xffABD2B6)),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      width: 190,
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
                          Flexible(child: Text("Item added to the cart", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 13)))
                        ],
                      )
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(width: MediaQuery.of(context).size.width-80, height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xff0F9BA1),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(child: Text("Add to cart", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 15))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








