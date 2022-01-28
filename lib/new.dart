

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/Auth/login2.dart';
import 'package:fire99/actions/add_post.dart';
import 'package:fire99/fchat/screens/chat_screen2.dart';
import 'package:fire99/posts/posts.dart';
import 'package:fire99/actions/save2.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math show pi;
import 'package:collapsible_sidebar/collapsible_sidebar.dart';



class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  List<CollapsibleItem> _items;
  String _headline;
  NetworkImage _avatarImg =
  NetworkImage('https://www.w3schools.com/howto/img_avatar.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
       text: 'Home',
        isSelected: true,
        icon: Icons.assessment,
        onPressed: ()
    {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return PostsScreen();
          }));
    }


      ),
      CollapsibleItem(
        text: 'Add New Product',
        icon: Icons.add,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
            return AddPost();
          }));
        }
      ),

      CollapsibleItem(
        text: 'Messages',
        icon: Icons.notifications,
        onPressed: ()  async {
          final user = FirebaseAuth.instance.currentUser;
          final userData = await Firestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
          String ud=userData['email'];
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return  ChatScreen2(ud);
              }));
        }
      ),
      CollapsibleItem(
        text: 'Saved Deals',
        icon: Icons.eco,
        onPressed: ()  async {
          final user = FirebaseAuth.instance.currentUser;
          final userData = await Firestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
          String ud=userData['email'];
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return save2(ud);
              }));
        }
      ),
      CollapsibleItem(
        text: 'LogOut',
        icon: Icons.logout,
        onPressed: ()   {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return LoginScreen2();
              }));
        }
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        items: _items,
        avatarImg: _avatarImg,
        title: '',
        body: Container(),
        backgroundColor: Colors.black26,

        selectedTextColor: Colors.white,
        textStyle: TextStyle(color:Colors.black,fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: TextStyle(

            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

 /* Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.23),
            child: Text(
              _headline,
              style: Theme.of(context).textTheme.headline1,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }

  */
}
class getCustomAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
        PreferredSize( preferredSize: Size.fromHeight(50),
        child:Container(
          decoration:BoxDecoration(
            gradient: LinearGradient(

            )
          ),
        )


        );
  }

}