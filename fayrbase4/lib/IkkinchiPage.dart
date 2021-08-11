import 'dart:ui';

import 'package:fayrbase4/db_helper/picture.dart';
import 'package:fayrbase4/initialize.dart';
import 'package:fayrbase4/ui/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'db_helper/dataBase_Helper.dart';
class IkkinchiPage extends StatefulWidget {
  const IkkinchiPage({Key? key}) : super(key: key);

  @override
  _IkkinchiPageState createState() => _IkkinchiPageState();
}

class _IkkinchiPageState extends State<IkkinchiPage> {
  DatabaseHelper? databaseHelper;
  List imageMemory = [];

  List titleMemory = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var birinchi="https://media.istockphoto.com/vectors/search-icon-red-background-square-white-line-vector-illustration-vector-id928656206?k=6&m=928656206&s=170667a&w=0&h=UxXNw0W7opDMYHBhO9WHOgi1DSYEQsd1VjlsXO1vRu4=";
    var ikkinchi = "https://image.shutterstock.com/image-vector/young-man-cartoon-260nw-1278398581.jpg";
    var uchinchi =  "https://icon-library.com/images/42697-fire-icon.png";
    var tortinchi = "https://c1.staticflickr.com/9/8135/9018271544_904664e047_b.jpg";
    var beshinchi =  "https://coolwallpapers.me/picsup/5639098-clash-clans-hd-wallpapers.jpg";
    var oltinchi =  "https://im0-tub-com.yandex.net/i?id=e4036a6642e62c90d3137c4f3dc1aa04&n=13";
    var yettinchi = "https://yt3.ggpht.com/a/AATXAJz19VwXcakGRmNdbEZuBTRbFwP88rt-08JJ9-Ak=s900-c-k-c0xffffffff-no-rj-mo";
    imageMemory = [
      birinchi,
      ikkinchi,
      uchinchi,
      tortinchi,
      beshinchi,
      oltinchi,
      yettinchi,
    ];

    titleMemory = <Picture>[];
    databaseHelper = DatabaseHelper();

    rasmSaqla();



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 825,
            child: FutureBuilder<List<Rasm>>(
              future: databaseHelper!.getPicture(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!.length != 0
                      ?  Container(
                    child: Column(
                      children: [
                        Row(children: [
                          Container(
                            margin: EdgeInsets.only(top: 30,left: 30),
                            height: 60,
                            width: 180,
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.all( 5.0),
                                  child: CircleAvatar(
                                 child: Image.memory(snapshot.data![0].rasm!),
                                    radius: 30,
                                  ),

                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 12,left: 70,),
                                  child: Text("Search",style: TextStyle(color: Colors.black54,fontSize: 25.0),),
                                )

                              ],
                            ),
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25,left: 100),
                            width: 80,
                            height: 90,
                               child: Image.memory(snapshot.data![1].rasm!),
                            decoration: BoxDecoration(
                               
                                borderRadius: BorderRadius.circular(20)
                            ),
                          ),


                        ],),
                        Container(
                          margin: EdgeInsets.only(left: 30,top: 100),
                          child: Row(
                            children: [
                              Container(child: Text(
                                "Trending",style: TextStyle(
                                fontSize: 35,
                              ),
                              ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                height: 50,
                                width: 40,
                                child: Image.memory(snapshot.data![2].rasm!),
                              ),




                            ],

                          ),
                        ),
                        Container(

                          width: MediaQuery.of(context).size.width,
                          height: 240,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){

                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
                                  width: 150,
                                  height: 240,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          height:120,
                                          child: Image.memory(snapshot.data![3].rasm!,fit: BoxFit.cover,),
                                          decoration: BoxDecoration(
                                            color: Colors.orangeAccent,
                                            borderRadius: BorderRadius.circular(20),

                                          ),
                                          

                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      Container(
                                        height: 30,
                                        margin: EdgeInsets.only(top: 10),
                                        child: OutlinedButton(
                                          onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));  },
                                          child: Text("Advanture",style: TextStyle(
                                              color: Colors.red),
                                          ),


                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.red.shade50,
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                      Container(

                                        child: Text("Mario"),
                                        margin: EdgeInsets.only(top: 10),
                                      ),

                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(20)),
                                );

                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10,right: 10,top: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.black,

                              borderRadius: BorderRadius.circular(20)),
                          height: 300,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15.0),
                                width: 360,
                                height: 180,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(left: 15.0),
                                              child: OutlinedButton(

                                                style: OutlinedButton.styleFrom(
                                                    shape:RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10)) ,
                                                    backgroundColor: Colors.black38),
                                                onPressed: () {  },
                                                child: Text(
                                                  "2.5k  PLaying",
                                                  style: TextStyle(color: Colors.white,),
                                                ),

                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(right: 10),

                                              child: OutlinedButton(

                                                style: OutlinedButton.styleFrom(
                                                    backgroundColor: Colors.orangeAccent,
                                                    shape:RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10)
                                                    )),
                                                onPressed: () {  },
                                                child: Text("Live",
                                                  style: TextStyle(
                                                      color: Colors.white),


                                                ),
                                              ),
                                            ),


                                          ],
                                        ),

                                      ],
                                    ),

                                  ],
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.red,
                                    image: DecorationImage(
                                        image: MemoryImage(snapshot.data![4].rasm!),

                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20)
                                ),

                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15,top: 20.0),
                                child: Row(
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        child: Image.memory(snapshot.data![5].rasm!),
                                        radius: 30,
                                      ),

                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child:Column(children: [
                                          Row(children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 15.0),
                                              child: Text(
                                                "League",style: TextStyle(
                                                color: Colors.white,fontSize: 18.0,
                                              ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(
                                                "of legends",style: TextStyle(fontSize: 18.0,
                                                color: Colors.white54,
                                              ),
                                              ),
                                            ),

                                          ],),
                                          Container(
                                            margin: EdgeInsets.only(top: 10,right: 10),
                                            height: 30,
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                  backgroundColor: Colors.orange.shade100),
                                              child: Text("Shooter",style: TextStyle(color: Colors.orange),),
                                              onPressed: (){},
                                            ),
                                          )
                                        ],)
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 37),
                                      child: CircleAvatar(


                                        child: Image.memory(
                                          snapshot.data![0].rasm!,
                                        ),radius: 30,


                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20)),

                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  )
                  
                      : CircularProgressIndicator();
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),

        ],
      ),
    );
  }

  Future rasmSaqla() async {
    for(var i = 0; i<imageMemory.length;i++){
      var image = await http.get(
        Uri.parse(imageMemory[i]),
      );
      var bytes = image.bodyBytes;

      Rasm rasm = Rasm(rasm: bytes);

      databaseHelper!.save(rasm);
      print("YOZILGAN PICTURE: " + rasm.toString());
      print("rasimmi saqla    ishladi");

    }
    setState(() {});
  }
}
