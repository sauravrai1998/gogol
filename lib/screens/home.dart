import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gogol/controllers/auth_controller.dart';
import 'package:gogol/screens/ProductsGridView.dart';
import 'package:gogol/screens/limitedTimeOffers.dart';
import 'package:gogol/screens/productDetailsPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/home_controller.dart';
import '../utils/constants.dart';
import 'notifications.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  AuthController auth = AuthController.instance;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xff0C7C81),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: 10, right: 18, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        child: TabBar(
                          labelStyle:
                              TextStyle(decoration: TextDecoration.underline),
                          unselectedLabelStyle:
                              TextStyle(decoration: TextDecoration.none),
                          padding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.zero,
                          controller: _tabController,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white,
                          indicator: BoxDecoration(
                              border: Border(bottom: BorderSide.none)),
                          tabs: [
                            Tab(
                                child: Text('Pharmacy',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Inter",
                                        fontSize: 13))),
                            Tab(
                                child: Text('Clothes',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Inter",
                                        fontSize: 13))),
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () async{
                            await auth.signOut();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => notifications()));
                          },
                          child: Image.asset(
                            "assets/images/Icons.png",
                            width: 24,
                            height: 24,
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  TextFormField(
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
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                hometab(),
                Center(child: Text("This is Clothes Tab")),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: bottomBar(),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class hometab extends StatefulWidget {
  const hometab({Key? key}) : super(key: key);

  @override
  State<hometab> createState() => _hometabState();
}


final pageController = PageController();

class _hometabState extends State<hometab> {
  final HomeController _homeController = Get.put(HomeController());
  List<String> CategoryImgPath = [
    'assets/images/coldflu.png',
    'assets/images/ImmuneSupport.png',
    'assets/images/personalcare.png',
    'assets/images/headache.png',
    'assets/images/personalcare2.png'
  ];
  List<String> CategoryName = [
    'Cold and flu',
    'Immune support',
    'Personal care',
    'Headache',
    'Personal care'
  ];

  List<String> ProductImgPath = [
    'assets/images/CofsilsOrange.png',
    'assets/images/KofletH.png',
    'assets/images/Strepsils.png',
    'assets/images/cofsils.png',
  ];

  List<String> ProductName = [
    'Cofsils Orange Lozenges Strip Of Lorem Ipsum',
    'Himalaya Koflet H Lozenges Ginger Lorem Ipsum',
    'Strepsils Orange Lozenges Strip Of 8 Lorem Ipsum',
    'Cofsils Naturals Cough Syrup Bottle Lorem Ipsum',
  ];

  List<double> ProductPrice = [
    32.5,
    50,
    30,
    36.5,
  ];

  List<double> ProductPriceDiscounted = [
    28.5,
    25,
    28.5,
    18,
    32.5,
  ];
  int bannerLength = 0;
  final Stream<QuerySnapshot> _bannerStream = FirebaseFirestore.instance.collection('banners').snapshots();
  final Stream<QuerySnapshot> _categoryStream = FirebaseFirestore.instance.collection('category').snapshots();
  final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: StreamBuilder<QuerySnapshot>(
                stream: _bannerStream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                  bannerLength =  snapshot.data!.docs.length;


                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }

                  return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          child: PageView(
                            controller: pageController,
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                              print(data['imageUrl'][0]);
                              return Image.network(
                                data['imageUrl'][0]['downloadURL'],
                                fit: BoxFit.cover,
                              );
                            }).toList(),
                          ),
                        ),

                    SizedBox(height: 18),
                    SmoothPageIndicator(
                      controller: pageController,
                      count: bannerLength,
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
                  ],
                );
              }
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 6,
            color: Color(0xffE5E5E5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shop by category",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff333333),
                        fontSize: 15)),
                SizedBox(height: 20),
                Container(
                  height: 140,
                  color: Colors.white,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: _categoryStream,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                        print(snapshot.data!.docs);


                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 80,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    snapshot.data!.docs[index]['imageUrl'][0]['downloadURL'],
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                        snapshot.data!.docs[index]['name'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: Color(0xff333333),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xffF3FAFB),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Limited time offer",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333333),
                              fontSize: 15)),
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
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => limitedTimeOffers()));
                          },
                          child: Text("View all",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff0F9BA1),
                                  fontSize: 15)))
                    ],
                  ),
                  SizedBox(height: 10),
                  StreamBuilder<QuerySnapshot>(
                      stream: _productStream,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                        print(snapshot.data!.docs);

                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }
                      return Container(
                        height: 230,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => productDetailsPage(snapshot.data!.docs[index])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 165,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Color(0xffCCCCCC), width: 1)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, top: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              snapshot.data!.docs[index]['imageUrl'][0]['downloadURL'],
                                              width: 250,
                                              height: 120,
                                              fit: BoxFit.contain,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                                snapshot.data!.docs[index]['name'],
                                                maxLines: 2,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontFamily: "Inter",
                                                    color: Color(0xff333333),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500)),
                                            SizedBox(height: 10),
                                            RichText(
                                              text: TextSpan(
                                                text: "\$${snapshot.data!.docs[index]['price']}",
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.lineThrough,
                                                    fontFamily: "Inter",
                                                    color: Color(0xff999999),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        " \$${snapshot.data!.docs[index]['discoutPrice']}",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        color: Color(0xff0F9BA1),
                                                        fontFamily: "Inter",
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width: 53,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10)),
                                            color: Color(0xffFFE1E1)),
                                        child: Center(
                                          child: Text(
                                              (snapshot.data!.docs[index]['discount'] *
                                                          100)
                                                      .toStringAsFixed(0) +
                                                  "% off",
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff333333),
                                                  fontSize: 10)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            height: 20,
            color: Colors.white,
          ),
          Container(
            height: 6,
            color: Color(0xffE6E6E6),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recommended products",
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
    );
  }
}
