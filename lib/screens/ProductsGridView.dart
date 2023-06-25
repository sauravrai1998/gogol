import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogol/screens/productDetailsPage.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({Key? key}) : super(key: key);

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {

  List<String> ProductName = [
    'Cofsils Orange Lozenges Strip Of Lorem Ipsum',
    'Himalaya Koflet H Lozenges Ginger Lorem Ipsum',
    'Strepsils Orange Lozenges Strip Of 8 Lorem Ipsum',
    'Cofsils Naturals Cough Syrup Bottle Lorem Ipsum',
    'Himalaya Koflet H Lozenges Ginger Lorem Ipsum',
    'Strepsils Orange Lozenges Strip Of 8 Lorem Ipsum',
  ];

  List<String> ProductImgPath = [
    'assets/images/CofsilsOrange.png',
    'assets/images/KofletH.png',
    'assets/images/Strepsils.png',
    'assets/images/cofsils.png',
    'assets/images/KofletH.png',
    'assets/images/Strepsils.png',
  ];

  List<double> ProductPrice = [
    32.5,
    50,
    30,
    36.5,
    45.5,
    85.5,
  ];

  List<double> ProductPriceDiscounted = [
    28.5,
    25,
    28.5,
    18,
    32.5,
    12,
    23,
  ];
  final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _productStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          print(snapshot.data!.docs);


          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.docs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => productDetailsPage(snapshot.data!.docs[index])));
              },
              child: Stack(
                children: [
                  Container(
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
            );
          },
        );
      }
    );
  }
}
