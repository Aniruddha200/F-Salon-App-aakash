import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  File _profileImage;
  selectImage() async {
    var imgy = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _profileImage =
          imgy; // _profileImage will hold the User image and should be sent to Firebase
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://bit.ly/3eWVEEt'), // image should be downloaded from Firebase.
                radius: 50,
                backgroundColor: Colors.white,
                child: Container(
                    margin: EdgeInsets.only(left: 70, top: 70),
                    child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: IconButton(
                            icon: Icon(Icons.edit),
                            iconSize: 20,
                            color: Colors.white,
                            padding: EdgeInsets.all(2),
                            onPressed: () {
                              selectImage();
                            })))),
          ],
        ),
      ),
    );
  }
}
