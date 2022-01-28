import 'package:fire99/messages/our_widgets/most-active.dart';
import 'package:fire99/messages/our_widgets/msg_status-selector.dart';
import 'package:fire99/messages/our_widgets/recent-chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),

      title: Text(
        'Chats',
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
      ],
    ),
    body: Column(
    children: <Widget>[
    CategorySelector(),
    Expanded(
    child: Container(
    decoration: BoxDecoration(
    color: Theme.of(context).accentColor,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
    ),
    ),
    child: Column(
    children: <Widget>[
    MostActive(),
    RecentChats(),
    ],
    ),
    ),
    ),
    ],
    ),
    );
  }
}