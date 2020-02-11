import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_user_avatar_flutter/app/home/about_page.dart';
import 'package:firebase_user_avatar_flutter/common_widgets/avatar.dart';
import 'package:firebase_user_avatar_flutter/models/avatar_reference.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_storage_service.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_service.dart';
import 'package:firebase_user_avatar_flutter/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_user_avatar_flutter/app/auth_widget.dart';

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth  = Provider.of<FirebaseAuthService>(context);
      print('signOut (home_page) :' + auth.hashCode.toString());
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onAbout(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => AboutPage(),
      ),
    );
  }


//  Future<void> _chooseAvatar(BuildContext context) async {
//    try {
//      // 1. Get image from picker
//      // 2. Upload to storage
//      // 3. Save url to Firestore
//      // 4. (optional) delete local file as no longer needed
////      File imageFile = await ImagePickerService().pickImage(source: null);
//
//      print("hello");
//      if(false) {
//        final auth = Provider.of<FirebaseAuthService>(context);
//        final fba = FirebaseAuth.instance;
//        final user = await fba.currentUser();
//        final userid = user.uid;
//        print(userid);
//      } else {
//        final auth = Provider.of<FirebaseAuthService>(context);
//        final auth_fb = auth.getfb;
//        print('chooseAvatar (home_page) auth: ' + auth.hashCode.toString());
//        final fba = FirebaseAuth.instance;
//        final fba2 = FirebaseAuth.instance;
//        print('signOut (home_page) fba :' + fba.hashCode.toString());
//        print('signOut (home_page) fba2 :' + fba2.hashCode.toString());
//        print('fba2 = fba : ' + identical(fba2, fba).toString());
//        print('auth = fba : ' + identical(auth, fba).toString());
//        print('auth = Provider : ' + identical(auth, Provider.of<FirebaseAuthService>(context)).toString());
//        print(auth_fb.hashCode);
////        final user = await auth.signInAnonymously()
//        final fba_user = fba.currentUser().then((FirebaseUser user) {
//          final userid = user.uid;
//          print('fba_user: ' + userid.toString());
//        });
////
////        auth.signInAnonymously().then((user)=>print('auth_user: ${user.uid} and auth.hashCode: ${auth.hashCode}'));
//
//        final auth_user = Provider.of<User>(context);
//        print('auth_user: ${auth_user.uid}');
//
//      }
//      print("hello2");
////      print(something);
///*      String downloadUrl = await FirebaseStorageService().uploadAvatar(uid: auth.onAuthStateChanged, file: null);
//      FirestoreService().setAvatarReference(uid: null, avatarReference: AvatarReference(downloadUrl));
//      imageFile.delete(recursive: false);*/
//
////      final fba = await FirebaseAuth.instance.signInAnonymously();
////      final fba2 = FirebaseAuth.instance.onAuthStateChanged;
////
////      fba.user;
////
////    final authResult = await FirebaseAuth.instance.signInAnonymously();
////    return authResult.user;
//
//
//    } catch (e) {
//      print(e);
//    }
//  }

  Future<void> _chooseAvatar(BuildContext context) async {
    try {
//        final image = Provider.of<ImagePickerService>(context);
//        final file = image.pickImage(source: ImageSource.gallery);
      final user = Provider.of<User>(context);
      print(user.uid);
//      // 1. Get image from picker
//      // 2. Upload to storage
//      // 3. Save url to Firestore
//      // 4. (optional) delete local file as no longer needed
////      File imageFile = await ImagePickerService().pickImage(source: null);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.help),
          onPressed: () => _onAbout(context),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _signOut(context),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130.0),
          child: Column(
            children: <Widget>[
              _buildUserInfo(context: context),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo({BuildContext context}) {
    // TODO: Download and show avatar from Firebase storage
//    String photoUrl = FirestoreService().avatarReferenceStream(uid: null).listen((data) => data['downloadUrl']);
//    final db = Provider.of<FirestoreService>(context);
//    final user = Provider.of<User>(context, listen: false);
//    StreamBuilder<AvatarReference>(
//      stream: db.avatarReferenceStream(uid: user.uid),
//      builder: (context, snapshot){
//        final avatarReference = snapshot.data;
        return Avatar(
//          photoUrl: avatarReference?.downloadUrl,
          photoUrl: null,
          radius: 50,
          borderColor: Colors.black54,
          borderWidth: 2.0,
          onPressed: () => _chooseAvatar(context),
//        );

//      },
    );

  }
}
