import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fire99/actions/add_post.dart';
import 'package:fire99/categories/cat2.dart';
import 'package:flutter/material.dart';
import 'package:fire99/new.dart';
import 'package:fire99/categories/cat.dart';

import 'package:fire99/actions/actions.dart';


class cs extends StatelessWidget {
  String allposts;
  String v;
  final txt;

  cs(this.txt);

  void filterCategory(value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[850],
      appBar: AppBar(
          backgroundColor:Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title:Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    // Colors.white,
                    Colors.white,
                    //Colors.lightBlueAccent,

                    // Colors.lightBlueAccent,
                    Colors.white,
                  ])),
              height:30,
              child: Center(child: Row(
                children: [
                  Text("   Sw",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:21)),
                  Text("ap",style:TextStyle(color:Colors.red,fontWeight:FontWeight.w600,fontSize:21)),
                  Text("  Broker",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:21)),

                ],
              ))
          ),
          //backgroundColor: Colors.lightBlueAccent,
          actions: <Widget>[
            IconButton(
                color:Colors.red,
                icon: Icon(Icons.apps,size:34,),

                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return cat2();
                      }));

                }),

            SizedBox(
                width:7
            ),
            IconButton(
                color:Colors.black,
                icon: Icon(Icons.apps_sharp,size:34,),

                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return cat();
                      }));

                })

          ]
      ),

      drawer: SidebarPage(),
      body:
      Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(17.0),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              height: 20,
              color:Colors.grey[850],
              // child: Row(children: <Widget>[
              // ]
              // ),
            ),
            Flexible(
                child: StreamBuilder(
                    stream:
                    Firestore.instance.collection('posts5').where("name",isGreaterThanOrEqualTo:txt).snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) return Center(child: Text('Loading'));
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return new Text('Loading...');
//.where("category", isEqualTo:"tec")
                        default:
                          return ListView.builder(
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot posts = snapshot.data.documents[index];

                                return Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      height: 220,
                                      color: Colors.grey[850],
                                      width: MediaQuery.of(context).size.width / 1.1,
                                      child: InkWell(
                                        child: Card(
                                          child: Image.network(posts['img'],
                                              fit: BoxFit.cover),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) {
                                              return Action99(
                                                posts['name'],
                                                posts['des'],
                                                posts['price'],
                                                posts['img'],
                                                posts['user']['email'],
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: ListTile(
                                        leading: Image.network(posts['img']),
                                        title: Text(posts['name'],
                                            style: TextStyle(color: Colors.redAccent)),
                                        subtitle: Text("DESCRIPTION:" + posts['des'],style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),),
                                       // trailing: Text(posts['price'] + "\$"),
                                      ),
                                    ),
                                  ],
                                );
                              });
                      }
                    })
            ),
            CurvedNavigationBar(

                color:Colors.white,
                backgroundColor:Colors.grey[850],
                //buttonBackgroundColor:Colors.blue,
                items:<Widget>[

                  Icon(Icons.home,size:24,color:Colors.red),
                  Icon(Icons.add_box,size:24,color:Colors.red),
                  Icon(Icons.account_circle,size:24,color:Colors.red),
                ],

                animationCurve:Curves.bounceOut,
                onTap:(index){

                  if(index==1)
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return AddPost();
                        }));
                  }


                }


            )
          ]),
    );
  }
}
