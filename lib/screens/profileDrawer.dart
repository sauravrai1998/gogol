import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogol/screens/advertisement.dart';
import 'package:gogol/screens/checkSymptoms.dart';
import 'package:gogol/screens/newUserReminder.dart';

import '../controllers/auth_controller.dart';
import '../repository/auth_repo.dart';
import '../utils/constants.dart';
import 'changePassword.dart';
import 'home.dart';
import 'login.dart';
import 'newUserHealthCard.dart';

class profileDrawer extends StatelessWidget {
  AuthController auth = AuthController.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xff0C7C81),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 50),
                  child: StreamBuilder<DocumentSnapshot>(
                      stream: AuthRepo.instance.userStream(firebaseAuth.currentUser!.email),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xffDBE0E1),
                            radius: 40,
                            child: Icon(Icons.person, color: Color(0xff333333), size: 50,),
                          ),
                          SizedBox(height: 20),
                          Text(snapshot.data!['name'], style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, color: Color(0xffffffff), fontSize: 18)),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.email_outlined, size: 20, color: Colors.white),
                              SizedBox(width: 10),
                              Text(snapshot.data!['email'], style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xffffffff), fontSize: 15))
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.phone, size: 20, color: Colors.white),
                              SizedBox(width: 7),
                              Text(snapshot.data!['phoneNumber'], style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xffffffff), fontSize: 15)),
                            ],
                          ),
                        ],
                      );
                    }
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => checkSymptoms())) ,child: drawerItems(title: "Symptom checker", imgpath: "assets/images/symptom_checker_icon.png")),
                    SizedBox(height: 15),
                    InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => newUserReminder())) ,child: drawerItems(title: "Reminder", imgpath: "assets/images/reminder-icon.png")),
                    SizedBox(height: 15),
                    InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => newUserHealthCard())) ,child: drawerItems(title: "My health card", imgpath: "assets/images/health-card-icon.png")),
                    SizedBox(height: 15),
                    InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => advertisement())) ,child: drawerItems(title: "Advertisement", imgpath: "assets/images/advertisement-icon.png")),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(width: MediaQuery.of(context).size.width, height: 2, color: Color(0xffEEEEEE)),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    // InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => changePassword())) ,child: drawerItems(title: "Change password", imgpath: "assets/images/lock-icon.png")),
                    // SizedBox(height: 15),
                    InkWell(onTap: () async => await auth.signOut(),child:
                    Row(
                      children: [
                        Image.asset("assets/images/logout-icon.png", width: 24, height: 24,),
                        SizedBox(width: 8),
                        Text("Log out", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 16)),
                      ],
                    )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class drawerItems extends StatelessWidget {
  drawerItems({Key? key, required this.title, required this.imgpath}) : super(key: key);
  String imgpath;
  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imgpath, width: 24, height: 24,),
        SizedBox(width: 8),
        Text(title, style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 16)),
        Spacer(),
        Icon(Icons.arrow_forward_ios, color: Color(0xff333333), size: 24)
      ],
    );
  }
}

