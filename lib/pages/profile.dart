import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ftvapp/pages/avatar.dart';
import 'package:ftvapp/pages/cart_screen.dart';
import 'package:ftvapp/pages/login.dart';
import 'package:ftvapp/pages/wishlist.dart';
import 'package:ftvapp/services/auth.dart';
import 'package:ftvapp/theme/color/light_color.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final uid = user.uid;
  // Similarly we can get email as well
  //final uemail = user.email;
  print(uid);
  //print(uemail);
}

getCurrentMail() async {
  final FirebaseUser user = await _auth.currentUser();
  //final uid = user.uid;
  // Similarly we can get email as well
  final uemail = user.email;
  print(uemail);
  //print(uemail);
}

class Profile extends StatelessWidget {
  Profile({Key key}) : super(key: key);
  AuthService authService = AuthService();
  double width;

  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
        height: 260,
        width: width,
        decoration: BoxDecoration(
          color: LightColor.lightblack,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: 30,
                right: -100,
                child: _circularContainer(300, LightColor.black)),
            Positioned(
                top: -100,
                left: -45,
                child: _circularContainer(width * .5, LightColor.black)),
            Positioned(
                top: -180,
                right: -30,
                child: _circularContainer(width * .7, Colors.transparent,
                    borderColor: Colors.white38)),
            Positioned(
                bottom: -100,
                left: -100,
                child: _circularContainer(width * .7, Colors.transparent,
                    borderColor: Colors.white38)),
            Positioned(
              top: 50,
              left: 0,
              child: Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(child: Avatar()),
                    SizedBox(height: 20),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Hello, " + getCurrentUser().toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "" + getCurrentMail().toString(),
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            _header(context),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartScreen()));
              },
              child: Container(
                width: 350,
                height: 70,
                child: Card(
                  elevation: 3,
                  child: const ListTile(
                    leading: Icon(Icons.reorder, size: 30),
                    title: Text('My Cart',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Wishlist()));
              },
              child: Container(
                width: 350,
                height: 70,
                child: Card(
                  elevation: 3,
                  child: const ListTile(
                    leading: Icon(Icons.reorder, size: 30),
                    title: Text('Wishlist',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: Text("LOGOUT",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  color: LightColor.black,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
