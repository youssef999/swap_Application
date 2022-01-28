import 'dart:io';


import 'package:fire99/swaping/swapping2.dart';
import 'package:flutter/material.dart';



class Action99 extends StatefulWidget{
  final name;
  final des;
  final classe;
  final img;
  final owner;


  Action99(this.name, this.des, this.classe, this.img,this.owner
      );

  @override
  _Action_State createState() => _Action_State();
}

class _Action_State extends State<Action99> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          /*  actions: <Widget>[
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
            ]*/
        ),
        body: Container(
          color:Colors.grey[850],
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.0),

                decoration: BoxDecoration(
                    color: Colors.grey[900],
                   // color:Colors.lightBlueAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: size.width * 0.6,

                      child: Center(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: size.width * 0.75,
                              width: size.height * 0.52,
                              decoration: BoxDecoration(
                                color: Colors.grey[850],
                               shape: BoxShape.circle,
                              ),
                            ),
                            Image.network(
                              widget.img,
                              height: size.width * 0.75,
                              width: size.width * 0.78,
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0 / 2),
                      child: Text(
                        widget.name ,  style: TextStyle(color:Colors.white,fontSize:22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(" class :  " + widget.classe , style: TextStyle(color:Colors.white,fontSize:22, fontWeight: FontWeight.w600,

                    ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 30.0 / 2 ),
                      child: Text( widget.des , style: TextStyle(color: Colors.white,fontSize:22),
                      ),
                    ),
                    SizedBox(height: 20.0,)
                  ],
                ),
              ),

              Container(

                margin: EdgeInsets.all(24.0),
              //  padding: EdgeInsets.symmetric(horizontal: 20.0,
                 //   vertical: 20.0 / 2),
                decoration: BoxDecoration(color:Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    //  SizedBox(width: 20.0/3),


                      FlatButton.icon(onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                          return swapping2(widget.owner,widget.name,widget.img);
                        }));


                      },
                        icon: Icon(Icons.swap_horizontal_circle_rounded, color: Colors.redAccent,size:32,),
                        height: 12,
                       // width:50,

                        label: Text(" Start Swaping" , style: TextStyle(color: Colors.black , fontSize: 21,fontStyle:FontStyle.italic),
                        ),
                      ),

                    ],

                  ),
                ),

              ),

            ],
          ),
        )





    );

  }
}